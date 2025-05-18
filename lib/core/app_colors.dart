
import 'package:flutter/cupertino.dart';

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const background = Color(0xFFFAFAFA);

  static const primary90 = Color(0xFF141A2E);
  static const primary80 = Color(0xFF28345C);
  static const primary70 = Color(0xFF3D4E8A);
  static const primary60 = Color(0xFF5168B8);
  static const primary50 = Color(0xFF6582E6);
  static const primary40 = Color(0xFF849BEB);
  static const primary30 = Color(0xFFA3B4F0);
  static const primary20 = Color(0xFFC1CDF5);
  static const primary10 = Color(0xFFE0E6FA);
  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary40, primary60],
  );

  static const grey90 = Color(0xFF131414);
  static const grey80 = Color(0xFF262728);
  static const grey70 = Color(0xFF393B3D);
  static const grey60 = Color(0xFF4C4E51);
  static const grey50 = Color(0xFF5F6265);
  static const grey40 = Color(0xFF7F8184);
  static const grey30 = Color(0xFF9FA1A3);
  static const grey20 = Color(0xFFBFC0C1);
  static const grey10 = Color(0xFFDFE0E0);

  static const danger90 = Color(0xFF2F0B08);
  static const danger80 = Color(0xFF5E1610);
  static const danger70 = Color(0xFF8C2219);
  static const danger60 = Color(0xFFBB2D21);
  static const danger50 = Color(0xFFEA3829);
  static const danger40 = Color(0xFFEE6054);
  static const danger30 = Color(0xFFF2887F);
  static const danger20 = Color(0xFFF7AFA9);
  static const danger10 = Color(0xFFFBD7D4);

  static const warning90 = Color(0xFF311B07);
  static const warning80 = Color(0xFF62350E);
  static const warning70 = Color(0xFF945016);
  static const warning60 = Color(0xFFC56A1D);
  static const warning50 = Color(0xFFF68524);
  static const warning40 = Color(0xFFF89D50);
  static const warning30 = Color(0xFFFAB67C);
  static const warning20 = Color(0xFFFBCEA7);
  static const warning10 = Color(0xFFFDE7D3);

  static const success90 = Color(0xFF022217);
  static const success80 = Color(0xFF04452E);
  static const success70 = Color(0xFF076746);
  static const success60 = Color(0xFF098A5D);
  static const success50 = Color(0xFF0BAC74);
  static const success40 = Color(0xFF3CBD90);
  static const success30 = Color(0xFF6CCDAB);
  static const success20 = Color(0xFF9DDEC7);
  static const success10 = Color(0xFFCEEEE3);

  static Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    final p = percent / 100;
    return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round(),
    );
  }

  static Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    final f = 1 - percent / 100;
    return Color.fromARGB(
      c.alpha,
      (c.red * f).round(),
      (c.green * f).round(),
      (c.blue * f).round(),
    );
  }
}
