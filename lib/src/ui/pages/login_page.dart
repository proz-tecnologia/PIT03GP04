import 'package:flutter/material.dart';
import 'package:four_finance_app/src/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  //Chamando o repositório do login controller
  final LoginController _controller = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade600,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.accessibility_new_rounded,
                size: 48,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  label: Text('E-mail'),
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),
                //Responsável por captura cada tecla apertada
                onChanged: _controller.setLogin,
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    label: Text('Senha'),
                    prefixIcon: Icon(
                      Icons.key,
                    )),
                obscureText: true,
                //Responsável por capturar cada tecla apertada
                onChanged: _controller.setSenha,
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<bool>(
                valueListenable: _controller.inLoader,
                builder: (_, inLoader, __) => inLoader
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          //Chama o AUTH LOGIN_CONTROLLER. THEN pegamos o TRUE ou FALSE
                          _controller.auth().then((resultado) {
                            if (resultado) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/mainScreen');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Verificar E-mail ou Senha.',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  duration: const Duration(seconds: 5),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                              );
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Acessar'),
                          ],
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
