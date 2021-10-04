import './translation.dart';

class EnUs implements Translation {
  String get msgEmailInUse => 'O username já está em uso.';
  String get msgInvalidCredentials => 'Credenciais inválidas.';
  String get msgInvalidField => 'Campo inválido';
  String get msgRequiredField => 'Campo obrigatório';
  String get msgUnexpectedError =>
      'Algo errado aconteceu. Tente novamente em breve.';

  String get msgSingIn => 'SingIn';
  String get msgSingUp => 'SingUp';
}
