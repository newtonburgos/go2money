import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorMessage;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final Widget? prifixIcon;
  final bool obscureText;
  final IconData? prefixIconData;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputType? keyboardType;
  final double? height;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  const CustomText({
    super.key,
    this.hintText,
    this.label,
    this.errorMessage,
    this.onChange,
    this.validator,
    this.prifixIcon,
    this.obscureText = false,
    this.prefixIconData,
    this.floatingLabelBehavior,
    this.keyboardType,
    this.height,
    this.hintStyle,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colors.inversePrimary),
    );

    return SizedBox(
      height: height,
      child: TextFormField(
        onChanged: onChange,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          floatingLabelBehavior: floatingLabelBehavior,
          contentPadding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: colors.primary),
          ),
          errorBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.red.shade800),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.red.shade800),
          ),
          isDense: true,
          label: label != null ? Text(label!) : null,
          prefixIcon: prifixIcon,
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyle(color: colors.inversePrimary),
          labelStyle: labelStyle ?? TextStyle(color: colors.primary),
          errorText: errorMessage,
          focusColor: colors.primary,
          // prefixIcon: Icon Icon(Icons.abc),
        ),
      ),
    );
  }
}
