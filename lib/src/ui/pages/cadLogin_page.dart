import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CadUsuarioPage extends StatefulWidget {
  const CadUsuarioPage({super.key});

  @override
  State<CadUsuarioPage> createState() => _CadUsuarioPageState();
}

class _CadUsuarioPageState extends State<CadUsuarioPage> {
  //chave global
  final _formKey = GlobalKey<FormState>();
  //Controlar dos campos digitaveis
  final _nameUsuarioController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmSenhaController = TextEditingController();

  @override
  void dispose() {
    _nameUsuarioController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmSenhaController.dispose();
    super.dispose();
  }

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
                  key: _formKey,
                  //Evita o OVERFLOW
                  child: SingleChildScrollView(
                    //evita do botão desaparecer
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            'assets/logo_for_finance2.png',
                            scale: 0.38,
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          validator: Validatorless.multiple([
                            Validatorless.required(
                                'Nome do usuário é obrigatório.'),
                            Validatorless.min(5,
                                'Nome do usuário deve ter no mínimo 5 caracteres.')
                          ]),
                          controller: _nameUsuarioController,
                          cursorColor: Colors.red,
                          decoration: const InputDecoration(
                            labelText: 'Nome Usuário',
                            labelStyle: TextStyle(color: Colors.red),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail obrigatório.'),
                            Validatorless.email('E-mail inválido.'),
                          ]),
                          controller: _emailController,
                          cursorColor: Colors.red,
                          decoration: const InputDecoration(
                              labelText: 'E-mail',
                              labelStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.red,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatória.'),
                            Validatorless.min(
                                5, 'Senha deve ter no mínimo 6 caracteres.')
                          ]),
                          controller: _senhaController,
                          cursorColor: Colors.red,
                          decoration: const InputDecoration(
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.red,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatória.'),
                            Validatorless.min(
                                6, 'Senha deve ter no mínimo 6 caracteres.'),
                            Validatorless.compare(_senhaController,
                                'Senha diferente do confirma senha.')
                          ]),
                          controller: _confirmSenhaController,
                          cursorColor: Colors.red,
                          decoration: const InputDecoration(
                              labelText: 'Repita a senha',
                              labelStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              prefixIcon: Icon(
                                Icons.password,
                                color: Colors.red,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)))),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                            onPressed: () {
                              var formValid =
                                  _formKey.currentState?.validate() ?? false;
                              if (formValid) {
                                //Implementar o CONTROLLER SALVAR DADOS
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text('CRIAR CONTA')),
                        const SizedBox(height: 24),
                        const Text(
                          'Já possui uma conta ?',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 24),
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
