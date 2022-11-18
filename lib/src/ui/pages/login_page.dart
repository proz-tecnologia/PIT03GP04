import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Chamando o repositório do login controller
  //final LoginController _controller = LoginController();

  //Chave do formulario
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formKey,
                  //Avita o OVERFLOW
                  child: SingleChildScrollView(
                    //Evita q o botão desapareça
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            'assets/logo_for_finance2.png',
                            scale: 0.1,
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          //Usando VALIDATORLESS
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail Obrigatório.'),
                            Validatorless.email('E-mail Inválido.'),
                          ]),
                          cursorColor: Colors.red,
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.red),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(color: Colors.red)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.red,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          //Usando o VALIDATORLESS
                          validator:
                              Validatorless.required('Senha Obrigatória.'),
                          cursorColor: Colors.red,
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.red),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.red,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.red,
                            focusColor: Colors.red,
                            hoverColor: Colors.red,
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                            onPressed: () {
                              //quando apertar o botão valida se os campos estão preenchidos
                              formKey.currentState?.validate();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text('ACESSAR')),
                        const SizedBox(height: 32),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/cadUsuario');
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text('CADASTRE-SE')),
                        const SizedBox(height: 32),
                        const Text(
                          'Ou faça login com',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.g_mobiledata,
                              size: 40,
                            ),
                            Icon(Icons.facebook)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
