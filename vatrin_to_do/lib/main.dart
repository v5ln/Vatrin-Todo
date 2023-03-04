import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vatrin_to_do/assets/themes/theme.dart';
import 'package:vatrin_to_do/view/splash_view.dart';
import 'package:vatrin_to_do/viewmodel/home_page_viewmodel.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageViewModel()),
      ],
      child: GetMaterialApp(
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
