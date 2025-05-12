enum MasculinoFemenino { masculino, femenino }

class EmailFormValidator {
  static String message = 'El email no es válido';
  static String? validateEmail({required String email}) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(email) ? null : message;
  }
}

class PasswordFormValidator {
  static String message = 'La password no es correcta';
  static String? validatePassword({required String password}) {
    return password.isNotEmpty && password.length >= 6 ? null : message;
  }
}

class DefaultFormValidator {
  final String? campo;
  final MasculinoFemenino? sexo;

  const DefaultFormValidator(this.campo, this.sexo);

  static String? validateIsNotEmpty({
    required String value,
    MasculinoFemenino? sexo = MasculinoFemenino.masculino,
    String? campo,
  }) {
    String message;

    if (campo != null) {
      message =
          '${sexo == MasculinoFemenino.masculino ? 'El' : 'La'} $campo es obligatorio.';
    } else {
      message = 'El campo esta vacio';
    }

    return value.isNotEmpty ? null : message;
  }
}
