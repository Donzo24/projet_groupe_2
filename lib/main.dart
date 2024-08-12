import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/route_manager.dart';
import 'package:projet_image/screens/button.dart';
import 'package:projet_image/screens/home_page.dart';
import 'package:projet_image/screens/more_widget.dart';
import 'package:projet_image/screens/scafold_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      home: ScafoldWidget()
    );
  }
}
