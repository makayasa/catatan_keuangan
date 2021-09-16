import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0XFF3BC460),
          titleTextStyle: TextStyle(
            color: Color(0XFFf8f5f1),
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
