// lib/presentation/ui/currency_form_page.dart
//
// Formulario para crear / editar monedas
// – Combo (DropdownButtonFormField) con códigos ISO‑4217 predefinidos
// – Campos: Nombre y Tasa de cambio
// – Integración con Riverpod y Use Case SaveCurrency
// – Progreso y validaciones
//--------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go2money/application/providers/theme_providers.dart';
import 'package:go2money/data/models/currency.dart';
import 'package:go2money/presentation/state/currency_action_notifiers.dart';
import 'package:go2money/presentation/widgets/currency_option.dart';
import 'package:go2money/presentation/widgets/text_form_field/custom_dropdown_button_form_field.dart';
import 'package:go2money/presentation/widgets/text_form_field/cutom_text_form_field.dart';

/// ---------------------------------------------------------------
/// Widget del formulario
/// ---------------------------------------------------------------
class CurrencyFormPage extends ConsumerStatefulWidget {
  final Currency? existing; // null = nuevo | !null = edición
  const CurrencyFormPage({super.key, this.existing});

  @override
  ConsumerState<CurrencyFormPage> createState() => _CurrencyFormState();
}

class _CurrencyFormState extends ConsumerState<CurrencyFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final TextEditingController _rateCtrl;

  CurrencyOption? _selectedOption; // valor del combo
  bool _isPrimary = false; // valor del checkbox

  @override
  void initState() {
    super.initState();

    // Valor inicial del combo según se edita o crea
    _selectedOption =
        widget.existing == null
            ? null
            : kCurrencyOptions.firstWhere(
              (o) => o.code == widget.existing!.code,
              orElse:
                  () => CurrencyOption(
                    widget.existing!.code,
                    widget.existing!.code,
                    widget.existing!.code,
                    Image.asset('assets/images/flags/aed.webp'),
                  ),
            );

    _nameCtrl = TextEditingController(text: widget.existing?.name ?? '');
    _rateCtrl = TextEditingController(
      text: widget.existing?.rateToPrimary.toString() ?? '1',
    );

    _isPrimary = widget.existing?.isPrimary == 1; // checkbox inicial
  }

  //───────────────────────────────────────────────────────────────
  //  BUILD
  //───────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    // final themeMode = ref.watch(themeModeProvider);
    final saveState = ref.watch(saveCurrencyProvider);
    final isSaving = saveState.isLoading;
    // final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.existing == null
              ? 'Nueva moneda'
              : 'Editar ${widget.existing!.code}',
        ),
        actions: [
          if (isSaving)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // ────────── Combo Código ──────────
              CustomDropDownButtonFormField(
                label: 'Código (ISO 4217)',
                hintText: 'Código (ISO 4217)',
                items:
                    kCurrencyOptions
                        .map(
                          (opt) => DropdownMenuItem(
                            value: opt,
                            child: Row(
                              children: [
                                opt.icon,
                                const SizedBox(width: 8),
                                Text('${opt.code} – ${opt.name}'),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                onChanged:
                    widget.existing == null
                        ? (opt) {
                          setState(() => _selectedOption = opt);
                          if (opt != null) {
                            _nameCtrl.text = opt.name;
                          }
                        }
                        : null,
              ),
              //const SizedBox(height: 12),

              // ────────── Nombre ──────────
              CustomTextFormField(
                controller: _nameCtrl,
                textFormFieldType: CustomTextFormFieldType.texto,
                label: 'Nombre',
                hintText: 'Nombre',
                readOnly: true,
              ),
              //const SizedBox(height: 12),

              // ────────── Tasa de cambio ──────────
              CustomTextFormField(
                controller: _rateCtrl,
                textFormFieldType: CustomTextFormFieldType.texto,
                label: 'Tasa de cambio',
                hintText: 'Tasa a Moneda Principal',
                validator:
                    (v) =>
                        (double.tryParse(v ?? '') == null)
                            ? 'Número inválido'
                            : null,
              ),
              //const SizedBox(height: 12),
              Row(
                children: [
                  const Text('Es Moneda Principal'),
                  const Spacer(),
                  Switch(
                    value: _isPrimary,
                    onChanged: (bool? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _isPrimary = newValue;
                        });
                      }
                    },
                  ),
                ],
              ),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   padding: const EdgeInsets.only(top: 10, right: 100),
              //   child: AnimatedToggleSwitch<bool>.dual(
              //     current: _isPrimary,
              //     first: false,
              //     second: true,
              //     spacing: 50.0,
              //     style: ToggleStyle(
              //       borderColor: colors.inversePrimary,
              //       backgroundColor:
              //           themeMode == ThemeMode.dark
              //               ? bgInputsDark
              //               : bgInputsLight,
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Colors.black26,
              //       //     spreadRadius: 1,
              //       //     blurRadius: 2,
              //       //     offset: Offset(0, 1.5),
              //       //   ),
              //       // ],
              //     ),
              //     borderWidth: 1.0,
              //     height: 55,
              //     onChanged: (value) {
              //       setState(() => _isPrimary = value);
              //       // Si marcamos como principal, la tasa debería ser 1
              //       if (_isPrimary) _rateCtrl.text = '1';
              //       setState(() {});
              //     },
              //     styleBuilder:
              //         (value) => ToggleStyle(
              //           indicatorColor: value ? Colors.green : Colors.red,
              //         ),
              //     iconBuilder:
              //         (value) =>
              //             value
              //                 ? const Icon(Icons.star, color: Colors.yellow)
              //                 : const Icon(Icons.star_border),
              //     textBuilder:
              //         (value) =>
              //             value
              //                 ? const Center(child: Text('Primaria'))
              //                 : const Center(child: Text('Secundaria')),
              //   ),
              // ),
              const SizedBox(height: 24),

              // ────────── Botón Guardar ──────────
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Guardar'),
                onPressed: isSaving ? null : () => _submit(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //───────────────────────────────────────────────────────────────
  //  SUBMIT
  //───────────────────────────────────────────────────────────────
  Future<void> _submit(BuildContext ctx) async {
    if (!_formKey.currentState!.validate()) return;

    final newCurrency = Currency(
      code: _selectedOption!.code,
      name: _nameCtrl.text,
      rateToPrimary: double.parse(_rateCtrl.text).toDouble(),
      isPrimary: _isPrimary ? 1 : 0,
      status: 1,
    );

    await ref.read(saveCurrencyProvider.notifier).save(newCurrency);

    ref
        .read(saveCurrencyProvider)
        .whenOrNull(
          data: (_) => Navigator.pop(ctx),
          error:
              (e, _) => ScaffoldMessenger.of(
                ctx,
              ).showSnackBar(SnackBar(content: Text('Error al guardar: $e'))),
        );
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _rateCtrl.dispose();
    super.dispose();
  }
}
