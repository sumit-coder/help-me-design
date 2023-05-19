import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';

class MyDesignSystem {}

class MyTextTypeSystem {
  MyTextTypeSystem({bool? dark});
  //
  // ========================= [** TitlePoppins Light **] ============================
  //
  /// fontSize: 11.0 | w500 | titleSmall
  static TextStyle titleSmall = GoogleFonts.poppins(
    color: MyColors.textColorLight,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  /// fontSize: 13.71 | w600 | titleMedium
  static TextStyle titleMedium = GoogleFonts.poppins(
    fontSize: 13.71,
    fontWeight: FontWeight.w600,
    color: MyColors.textColorLight,
  );

  /// fontSize: 17.94 | w600 | titleLarge
  static TextStyle titleLarge = GoogleFonts.poppins(
    color: MyColors.textColorLight,
    fontSize: 17.94,
    fontWeight: FontWeight.w600,
  );

  /// fontSize: 22.18 | w600 | titleXLarge
  static TextStyle titleXLarge = GoogleFonts.poppins(
    color: MyColors.textColorLight,
    fontSize: 22.18,
    fontWeight: FontWeight.w600,
  );

  /// fontSize: 27.41 | w700 | titleXXLarge
  static TextStyle titleXXLarge = GoogleFonts.poppins(
    color: MyColors.textColorLight,
    fontSize: 27.41,
    fontWeight: FontWeight.w700,
  );
  //
  // ============================= [** TitlePoppins Dark **] ========================
  //
  /// fontSize: 11.0 | w500 | titleSmall
  static TextStyle titleSmallDark = GoogleFonts.poppins(
    color: MyColors.textColorDark,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  /// fontSize: 13.71 | w600 | titleMedium
  static TextStyle titleMediumDark = GoogleFonts.poppins(
    fontSize: 13.71,
    fontWeight: FontWeight.w600,
    color: MyColors.textColorDark,
  );

  /// fontSize: 17.94 | w600 | titleLarge
  static TextStyle titleLargeDark = GoogleFonts.poppins(
    color: MyColors.textColorDark,
    fontSize: 17.94,
    fontWeight: FontWeight.w600,
  );

  /// fontSize: 22.18 | w600 | titleXLarge
  static TextStyle titleXLargeDark = GoogleFonts.poppins(
    color: MyColors.textColorDark,
    fontSize: 22.18,
    fontWeight: FontWeight.w700,
  );

  /// fontSize: 24.4 | w700 | titleXXLarge
  static TextStyle titleXXLargeDark = GoogleFonts.poppins(
    color: MyColors.textColorDark,
    // fontSize: 27.41,
    fontSize: 27.41,
    fontWeight: FontWeight.w700,
  );
  //
  // ==============================[** TitlePtSerif **] ==============================
  //
  /// fontSize: 11.0 | w600 | titleSmall
  static TextStyle titleSmallSf = GoogleFonts.ptSerif(
    color: MyColors.textColorLight,
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  /// fontSize: 13.71 | w600 | titleMedium
  static TextStyle titleMediumSf = GoogleFonts.ptSerif(
    fontSize: 13.71,
    fontWeight: FontWeight.w600,
    color: MyColors.textColorLight,
  );

  /// fontSize: 17.94 | w600 | titleLarge
  static TextStyle titleLargeSf = GoogleFonts.ptSerif(
    color: MyColors.textColorLight,
    fontSize: 17.94,
    fontWeight: FontWeight.w600,
  );

  /// fontSize: 22.18 | w600 | titleXLarge
  static TextStyle titleXLargeSf = GoogleFonts.ptSerif(
    color: MyColors.textColorLight,
    fontSize: 22.18,
    fontWeight: FontWeight.w600,
  );

  /// fontSize: 24.4 | w600 | titleXXLarge
  static TextStyle titleXXLargeSf = GoogleFonts.ptSerif(
    color: MyColors.textColorLight,
    // fontSize: 27.41,
    fontSize: 24.4,
    fontWeight: FontWeight.w600,
  );

  // static const TextStyle titleMedium = TextStyle(
  //   color: MyColors.textColorLight,
  //   fontSize: 13.71,
  //   fontWeight: FontWeight.w600,
  //   fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).toString(),
  // );
  // Body
  //
  // ============================= [** Body **] ====================================
  //
  /// fontSize: 10 | w500 | bodySmall
  static TextStyle bodySmall = GoogleFonts.poppins(
    color: MyColors.textColorLight,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  /// fontSize: 12 | w500 | bodyMedium
  static TextStyle bodyMedium = GoogleFonts.poppins(
    color: MyColors.textColorLight,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  /// fontSize: 14 | w500 | bodyLarge
  static TextStyle bodyLarge = GoogleFonts.poppins(
    color: MyColors.textColorLight,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  /// fontSize: 16 | w500 | bodyXLarge
  static TextStyle bodyXLarge = GoogleFonts.poppins(
    color: MyColors.textColorLight,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // ============================= [** Body Dark **] ====================================
  //
  /// fontSize: 10 | w500 | bodySmall
  static TextStyle bodySmallDark = GoogleFonts.poppins(
    color: MyColors.textColorDark,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );

  /// fontSize: 12 | w500 | bodyMedium
  static TextStyle bodyMediumDark = GoogleFonts.poppins(
    color: MyColors.textColorDark,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  /// fontSize: 14 | w500 | bodyLarge
  static TextStyle bodyLargeDark = GoogleFonts.poppins(
    color: MyColors.textColorDark,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  /// fontSize: 16 | w500 | bodyXLarge
  static TextStyle bodyXLargeDark = GoogleFonts.poppins(
    color: MyColors.textColorDark,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

class MySpaceSystem {
  static const double _goldenRatio = 1.618;
  static const double _initialSpacePoint = 4;

  // static const double spaceX0 = (_initialSpacePoint / 2) * _goldenRatio;
  // static const double spaceX = _initialSpacePoint;
  // static const double spaceX1 = (_initialSpacePoint * 1) * _goldenRatio;
  // static const double spaceX2 = (_initialSpacePoint * 2) * _goldenRatio;
  // static const double spaceX3 = (_initialSpacePoint * 3) * _goldenRatio;
  // static const double spaceX4 = (_initialSpacePoint * 4) * _goldenRatio;
  // static const double spaceX5 = (_initialSpacePoint * 5) * _goldenRatio;
  // static const double spaceX6 = (_initialSpacePoint * 6) * _goldenRatio;
  // static const double spaceX7 = (_initialSpacePoint * 7) * _goldenRatio;

  /// 20 px spaceCustomX1 by 4 Rule
  static const double spaceCustomX1 = 20;

  /// 24 px spaceCustomX1 by 4 Rule
  static const double spaceCustomX2 = 24;

  /// 54 px spaceCustomX1 by 4 Rule
  static const double spaceCustomX3 = 54;

  // Golden Ratio Spaces [ 1.618 ]

  /// 2px SpaceX0 by Golden-Ratio
  static const double spaceX0 = _initialSpacePoint / 2;

  /// 4 px SpaceX by Golden-Ratio
  static const double spaceX = _initialSpacePoint;

  /// 6.47 px SpaceX1 by Golden-Ratio
  static final double spaceX1 = double.parse((spaceX * _goldenRatio).toStringAsFixed(2));

  /// 10.47 px SpaceX2 by Golden-Ratio
  static final double spaceX2 = double.parse((spaceX1 * _goldenRatio).toStringAsFixed(2));

  /// 16.94 px SpaceX3 by Golden-Ratio
  static final double spaceX3 = double.parse((spaceX2 * _goldenRatio).toStringAsFixed(2));

  /// 27.41 px SpaceX4 by Golden-Ratio
  static final double spaceX4 = double.parse((spaceX3 * _goldenRatio).toStringAsFixed(2));

  /// 44.35 px SpaceX5 by Golden-Ratio
  static final double spaceX5 = double.parse((spaceX4 * _goldenRatio).toStringAsFixed(2));

  /// 71.76 px SpaceX6 by Golden-Ratio
  static final double spaceX6 = double.parse((spaceX5 * _goldenRatio).toStringAsFixed(2));

  /// 116.11 px SpaceX7 by Golden-Ratio
  static final double spaceX7 = double.parse((spaceX6 * _goldenRatio).toStringAsFixed(2));

  /// 187.87 px SpaceX8 by Golden-Ratio
  static final double spaceX8 = double.parse((spaceX7 * _goldenRatio).toStringAsFixed(2));
  // }

  // double getGoldenRatioSpace({required double initialPoint, required double timesFacter}) {
  //   return double.parse(((initialPoint * timesFacter) * _goldenRatio).toStringAsFixed(2));
  // }
}

class MyColorSystem {
  double asdf = MySpaceSystem.spaceX3;
}

class Title {
//  final bool dark;
//   Title(this.dark);

  static TextStyle titleSmall({bool? dark}) {
    if (dark!) {
      return GoogleFonts.poppins(
        color: MyColors.textColorLight,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );
    } else {
      return GoogleFonts.poppins(
        color: MyColors.textColorDark,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );
    }
  }
}

class TitleSf {
//  final bool dark;
//   Title(this.dark);

  static final title = Title.titleSmall(dark: true);

  // static TextStyle title(bool dark) {
  //   if (dark) {
  //   } else {}
  // }
}
