import 'package:flutter/material.dart';

class MyTypography {
  static TextStyle _tsMontserrat(double fontSize, double height,
      FontWeight fontWeight, double letterSpacing) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: fontSize,
      fontWeight: fontWeight,
      // height: _calcularAltura(height, fontSize), only figma mockups
      // letterSpacing: letterSpacing,
      wordSpacing: letterSpacing,
    );
  }

  static final proximaNovaExtraBold25 =
      _tsMontserrat(25, 47, FontWeight.w800, 0.75);

  static final proximaNovaExtraBold22 =
      _tsMontserrat(22, 30, FontWeight.w800, 0.66);

  static final proximaNovaExtraBold18 =
      _tsMontserrat(18, 30, FontWeight.w800, 0.54);

  static final proximaNovaBold16 = _tsMontserrat(16, 30, FontWeight.w700, 0.48);

  static final proximaNovaMedium16 =
      _tsMontserrat(16, 30, FontWeight.w500, 0.48);

  // ignore: unused_element
  static double _calcularAltura(double alturaPx, double pesoPx) {
    late double resultado = 0.0;
    double valor = 0.000001;

    do {
      resultado = valor * pesoPx;
      valor += 0.000001;
    } while (resultado <= alturaPx);

    return valor;
  }
}
