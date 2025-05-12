// lib/presentation/ui/currency_list_page.dart
//
// (mismo contenido que antes; sólo cambia _listenStatus)
//────────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go2money/data/models/currency.dart';
import 'package:go2money/presentation/state/currency_action_notifiers.dart';
import 'package:go2money/presentation/state/currency_list_notifier.dart';
import 'currency_form_page.dart';

class CurrencyListPage extends ConsumerWidget {
  static const routeName = 'currency_list';
  const CurrencyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(currencyListProvider);

    // Escucha de acciones (SnackBars sólo tras la acción del usuario)
    ref.listen(
      setPrimaryProvider,
      _listenStatus(context, 'Moneda principal actualizada'),
    );
    ref.listen(
      setInactiveProvider,
      _listenStatus(context, 'Moneda desactivada'),
    );
    ref.listen(
      deleteCurrencyProvider,
      _listenStatus(context, 'Moneda eliminada'),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Monedas')),
      body: listAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (currencies) => _buildList(currencies, context, ref),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CurrencyFormPage()),
          );
        },
      ),
    );
  }

  /*──────────────────────── Helpers ─────────────────────────────*/

  Widget _buildList(List<Currency> list, BuildContext ctx, WidgetRef ref) {
    if (list.isEmpty) return const Center(child: Text('Sin monedas'));

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: list.length,
      itemBuilder: (_, i) {
        final c = list[i];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Material(
            color: Colors.transparent, // necesario para mostrar el ripple
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () async {
                await Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (_) => CurrencyFormPage(existing: c),
                  ),
                );
              },
              child: Container(
                height: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(5, 150, 105, 1), // verde intenso
                      Color.fromRGBO(16, 185, 129, 1), // verde medio
                      Color.fromRGBO(52, 211, 153, 1), // verde claro
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 6,
                      offset: Offset(0, 2),
                      color: Colors.black26,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Ícono a la izquierda
                    Icon(
                      c.isPrimary == 1 ? Icons.star : Icons.currency_exchange,
                      color: c.isPrimary == 1 ? Colors.amber : Colors.white,
                    ),
                    const SizedBox(width: 12),

                    // Texto principal (código y nombre)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: c.code,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const TextSpan(text: '  '),
                                TextSpan(
                                  text: c.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Rate: ${c.rateToPrimary}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Menú emergente (3 puntos)
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      color: Theme.of(ctx).cardColor,
                      onSelected: (value) async {
                        switch (value) {
                          case 'primary':
                            await ref
                                .read(setPrimaryProvider.notifier)
                                .setPrimary(c.code);
                            break;
                          case 'inactive':
                            await ref
                                .read(setInactiveProvider.notifier)
                                .setInactive(c.code);
                            break;
                          case 'delete':
                            final ok = await _confirmDelete(ctx, c.code);
                            if (ok) {
                              await ref
                                  .read(deleteCurrencyProvider.notifier)
                                  .delete(c.code);
                            }
                            break;
                        }
                      },
                      itemBuilder:
                          (_) => const [
                            PopupMenuItem(
                              value: 'primary',
                              child: Text('Marcar principal'),
                            ),
                            PopupMenuItem(
                              value: 'inactive',
                              child: Text('Desactivar'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Eliminar'),
                            ),
                          ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _confirmDelete(BuildContext ctx, String code) async {
    return (await showDialog<bool>(
          context: ctx,
          builder:
              (_) => AlertDialog(
                title: const Text('Eliminar moneda'),
                content: Text('¿Seguro que deseas eliminar $code?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: const Text('Eliminar'),
                  ),
                ],
              ),
        )) ??
        false;
  }

  void Function(AsyncValue<void>?, AsyncValue<void>?) _listenStatus(
    BuildContext ctx,
    String successMsg,
  ) {
    return (prev, next) {
      if (prev == null || prev.isLoading) {
        return; // ← ignora la 1.ª llamada al montar
      }

      final wasLoading = prev.isLoading; // veníamos de Loading

      // ---------- ÉXITO ----------
      if (wasLoading && next is AsyncData<void>) {
        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(SnackBar(content: Text(successMsg)));
      }

      // ---------- ERROR ----------
      if (wasLoading && next is AsyncError<void>) {
        final err = next.error; // objeto Exception / Error
        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(SnackBar(content: Text('Error: $err')));
      }
    };
  }
}
