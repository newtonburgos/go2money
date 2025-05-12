import 'package:flutter/material.dart';
import 'package:go2money/utils/helpers/validators/form_validators.dart';

abstract mixin class TextFormFieldDelegate {
  onChange({
    required String newValue,
    required CustomTextFormFieldType customTextFormFieldType,
  });
}

enum CustomTextFormFieldType { email, password, phone, texto, dateOfBirth }

class CustomTextFormField extends StatelessWidget {
  final CustomTextFormFieldType textFormFieldType;
  final String? label;
  final String hintText;
  final Widget? prifixIcon;
  //final TextFormFieldDelegate delegate;
  final TextEditingController? _controller;
  final TextStyle? hintStyle;
  final Color? bgColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool readOnly;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.textFormFieldType,
    required this.hintText,
    //required this.delegate,
    TextEditingController? controller,
    this.label,
    this.prifixIcon,
    this.hintStyle,
    this.bgColor,
    this.floatingLabelBehavior,
    this.readOnly = false,
    this.validator,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colors.inversePrimary),
    );

    return Container(
      padding: const EdgeInsets.only(top: 10),
      //margin: const EdgeInsets.only(top: 10),
      //padding: const EdgeInsets.only(left: 20),
      // decoration: BoxDecoration(
      //   color: bgColor ?? bgInputsLight,
      //   borderRadius: BorderRadius.circular(40),
      // ),
      child: TextFormField(
        controller: _controller,
        keyboardType: getKeyboardType(textFormFieldType: textFormFieldType),
        readOnly: readOnly,
        obscureText:
            textFormFieldType == CustomTextFormFieldType.password
                ? true
                : false,
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
          floatingLabelStyle: TextStyle(color: colors.primary, fontSize: 20),
          labelStyle: TextStyle(
            color: colors.primary,
            fontWeight: FontWeight.bold,
          ),
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
        validator:
            validator ??
            (value) {
              switch (textFormFieldType) {
                case CustomTextFormFieldType.email:
                  return EmailFormValidator.validateEmail(email: value ?? '');
                case CustomTextFormFieldType.password:
                  return PasswordFormValidator.validatePassword(
                    password: value ?? '',
                  );
                case CustomTextFormFieldType.phone:
                  return DefaultFormValidator.validateIsNotEmpty(
                    value: value ?? '',
                  );
                case CustomTextFormFieldType.texto:
                  return DefaultFormValidator.validateIsNotEmpty(
                    value: value ?? '',
                    campo: hintText,
                  );
                case CustomTextFormFieldType.dateOfBirth:
                  return DefaultFormValidator.validateIsNotEmpty(
                    value: value ?? '',
                  );
              }
            },
      ),
    );
  }

  TextInputType? getKeyboardType({
    required CustomTextFormFieldType textFormFieldType,
  }) {
    switch (textFormFieldType) {
      case CustomTextFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFormFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFormFieldType.phone:
        return TextInputType.phone;
      case CustomTextFormFieldType.texto:
        return TextInputType.text;
      case CustomTextFormFieldType.dateOfBirth:
        return TextInputType.datetime;
    }
  }
}
