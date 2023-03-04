
import 'package:flutter/material.dart';
import 'package:vatrin_to_do/assets/themes/constants.dart';
import 'package:vatrin_to_do/viewmodel/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashViewModel.splashRouting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.check_box_outlined,
            color: SecondaryColor,
            size: 95,
          ),
          Text(
            "UpTodo",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          )
        ],
      )),
    );
  }
}
