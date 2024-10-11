import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // //main Color
    // primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.lightPrimary,
    // primaryColorDark: ColorManager.darkPrimary,
    // disabledColor: ColorManager.grey1,
    // splashColor: ColorManager.lightPrimary, // ripple effect color

    // //cardView theme
    // cardTheme: const CardTheme(
    //   color: ColorManager.white,
    //   shadowColor: ColorManager.grey,
    //   elevation: AppSize.s4,
    // ),

    // //app bar theme
    // appBarTheme: AppBarTheme(
    //   centerTitle: true,
    //   color: ColorManager.primary,
    //   elevation: AppSize.s4,
    //   shadowColor: ColorManager.lightPrimary,
    //   titleTextStyle: getSemiBoldStyle(
    //     color: ColorManager.white,
    //     fontSize: FontSize.s16,
    //   ),
    // ),

    // //button theme
    // buttonTheme: const ButtonThemeData(
    //   shape: StadiumBorder(),
    //   disabledColor: ColorManager.grey1,
    //   buttonColor: ColorManager.primary,
    //   splashColor: ColorManager.lightPrimary,
    // ),

    // // elevated button theme
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     textStyle: getRegularStyle(
    //       color: ColorManager.white,
    //       fontSize: FontSize.s17,
    //     ),
    //     backgroundColor: ColorManager.primary,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(AppSize.s12),
    //     ),
    //   ),
    // ),

    // //text theme
    // textTheme: TextTheme(
    //   headlineLarge: getSemiBoldStyle(
    //       color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //   titleMedium:
    //       getMediumStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
    //   labelMedium:
    //       getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
    //   bodyLarge: getRegularStyle(color: ColorManager.grey),
    //   bodySmall: getRegularStyle(color: ColorManager.white),
    //   displayLarge: getRegularStyle(color: ColorManager.lightGrey),
    // ),

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
          color: ColorManager.placeHolderColor, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s16),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: outLintInputBorderMethod(
        const BorderSide(color: ColorManager.black, width: AppSize.w1_5),
        const BorderRadius.all(Radius.circular(AppSize.s5)),
      ),
      focusedBorder: outLintInputBorderMethod(
        const BorderSide(color: ColorManager.grey, width: AppSize.w1_5),
        const BorderRadius.all(Radius.circular(AppSize.s5)),
      ),
      errorBorder: outLintInputBorderMethod(
        const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
        const BorderRadius.all(Radius.circular(AppSize.s5)),
      ),
      focusedErrorBorder: outLintInputBorderMethod(
        const BorderSide(color: ColorManager.black, width: AppSize.w1_5),
        const BorderRadius.all(Radius.circular(AppSize.s5)),
      ),
    ),
  );
}

OutlineInputBorder outLintInputBorderMethod(
    BorderSide borderSide, BorderRadius borderRadius) {
  return OutlineInputBorder(
    borderSide: borderSide,
    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s5)),
  );
}
