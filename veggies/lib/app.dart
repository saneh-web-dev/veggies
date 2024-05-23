import 'package:flutter/material.dart';
import 'package:veggies/bindings/general_bindings.dart';
import 'package:veggies/routes/app_routes.dart';
import 'package:veggies/utils/constants/color.dart';
import 'package:veggies/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: VeggiesTheme.lightTheme,
      darkTheme: VeggiesTheme.darkTheme,
      getPages: AppRoutes.pages,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: VColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: VColors.light,
          ),
        ),
      ),
    );
  }
}
