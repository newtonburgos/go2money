import 'package:flutter/material.dart';
import 'package:go2money/presentation/widgets/currency_option.dart';

abstract mixin class DropDownButtonFormField {
  onChange({
    required String newValue,
    //required CustomTextFormFieldType customTextFormFieldType,
  });
}

//enum CustomTextFormFieldType { email, password, phone, texto, dateOfBirth }

class CustomDropDownButtonFormField extends StatelessWidget {
  //final CustomTextFormFieldType textFormFieldType;
  final String? label;
  final String hintText;
  final Widget? prifixIcon;
  //final TextFormFieldDelegate delegate;
  final CurrencyOption? _value;
  final TextStyle? hintStyle;
  final Color? bgColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final List<DropdownMenuItem<CurrencyOption>>? items;
  final void Function(CurrencyOption?)? onChanged;

  const CustomDropDownButtonFormField({
    super.key,
    //required this.textFormFieldType,
    required this.hintText,
    //required this.delegate,
    // TextEditingController? controller,
    // DropDownButtonController? dropDownButtonController,
    CurrencyOption? value,
    this.label,
    this.prifixIcon,
    this.hintStyle,
    this.bgColor,
    this.floatingLabelBehavior,
    this.items,
    this.onChanged,
  }) : _value = value;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colors.inversePrimary),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      //margin: const EdgeInsets.only(top: 10),
      //padding: const EdgeInsets.only(left: 20),
      // decoration: BoxDecoration(
      //   color: bgColor ?? bgInputsLight,
      //   borderRadius: BorderRadius.circular(40),
      // ),
      child: DropdownButtonFormField<CurrencyOption>(
        value: _value,
        isExpanded: true,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor:
              bgColor ?? colors.primaryContainer, // tu mismo color lila claro
          label: label != null ? Text(label!) : null,
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyle(color: colors.primary),
          enabledBorder: border,
          prefixIcon: prifixIcon,
          floatingLabelBehavior: floatingLabelBehavior,
          labelStyle: TextStyle(color: colors.primary),
          contentPadding: const EdgeInsets.fromLTRB(25, 15, 25, 15),

          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: colors.primary),
          ),
          errorBorder: border.copyWith(
            borderSide: BorderSide(color: colors.error),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: colors.error),
          ),
        ),
        // onChanged:
        //     (newValue) => delegate.onChange(
        //       newValue: newValue,
        //       customTextFormFieldType: textFormFieldType,
        //     ),
        validator: (opt) => opt == null ? 'Selecciona la moneda' : null,
      ),
    );
  }

  // TextInputType? getKeyboardType({
  //   required CustomTextFormFieldType textFormFieldType,
  // }) {
  //   switch (textFormFieldType) {
  //     case CustomTextFormFieldType.email:
  //       return TextInputType.emailAddress;
  //     case CustomTextFormFieldType.password:
  //       return TextInputType.visiblePassword;
  //     case CustomTextFormFieldType.phone:
  //       return TextInputType.phone;
  //     case CustomTextFormFieldType.texto:
  //       return TextInputType.text;
  //     case CustomTextFormFieldType.dateOfBirth:
  //       return TextInputType.datetime;
  //   }
  // }
}
