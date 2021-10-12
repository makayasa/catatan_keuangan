import 'package:catatan_keuangan/app/components/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          backgroundColor: kContentColorLightTheme,
          titleTextStyle: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'Montserrat',
            fontSize: 22,
          ),
        ),
      ),
      // localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('id', 'ID'),
      // ],
      locale: Locale('id', 'ID'),
    ),
  );
}
