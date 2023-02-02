// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:four_finance_app/firebase_options.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:four_finance_app/src/ui/pages/login_page.dart';
import 'package:four_finance_app/store/user.store.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription? _streamSubscription;
  @override
  void initState() {
    super.initState();

    //Após 4 segundos a tela splash vai ser destruída. PushReplacementNamed é para não retornar a tela
    Future.delayed(const Duration(seconds: 14));
    //.then((_) => Navigator.of(context).pushReplacementNamed('/login'));

    WidgetsBinding.instance.addPostFrameCallback((_) => preLoad());
  }

  Future preLoad() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user == null) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
        LoginStore person =
            LoginStore.fromFirestore(snapshot.data() as Map<String, dynamic>);
        GetIt.instance.get<UserStore>().loadPerson(person);
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() async {
    super.dispose();
    await _streamSubscription!.cancel();
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
