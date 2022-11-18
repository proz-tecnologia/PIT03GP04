import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:four_finance_app/src/ui/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //Após 4 segundos a tela splash vai ser destruída. PushReplacementNamed é para não retornar a tela
    Future.delayed(const Duration(seconds: 4))
        .then((_) => Navigator.of(context).pushReplacementNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/24233-money-tree.json'),
      nextScreen: const LoginPage(),

      //Aqui aumenta o tamanho da imagem JSON
      splashIconSize: 350,
      //splashTransition: SplashTransition.rotationTransition,
      //pageTransitionType: PageTransitionType.topToBottom,
    );
  }
}
