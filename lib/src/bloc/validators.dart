import 'dart:async';

import 'dart:math';

class Validators {
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length >= 6) {
        sink.add(data);
      } else {
        sink.addError('Mas de 6 Caracteres por favot');
      }
    },
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      RegExp regExp = new RegExp(pattern);

      if (regExp.hasMatch(data)) {
        sink.add(data);
      } else {
        sink.addError('El email no es correcto');
      }
    },
  );
}
