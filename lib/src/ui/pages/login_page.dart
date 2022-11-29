import 'package:flutter/material.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Chamando a CLASSE LOGIN q contém o MOBX, foi removido (= LoginStore();), por conta do PROVIDER
  late LoginStore loginStore;

  //usado p transitar dados com MOBX o PROVIDER é necessário
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  //Chave do formulario p usar em validar os campos
  final _formKey = GlobalKey<FormState>();

  bool _canShowPassword = false;

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
                  //Avita o OVERFLOW
                  child: SingleChildScrollView(
                    //Evita q o botão desapareça
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          child: Image.asset(
                            'assets/logo_for_finance2.png',
                            scale: 0.1,
                          ),
                        ),
                        const SizedBox(height: 32),
                        /* Trabalhando em criar WIDGETs TEXTFORMFIELD e diminuir o código
                        TextFormFieldPadron(
                          prefixIcon: Icons.email,
                          color: Colors.red,
                          labelText: 'E-mail',
                        ),*/

                        TextFormField(
                          //Usando VALIDATORLESS
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail Obrigatório.'),
                            Validatorless.email('E-mail Inválido.'),
                          ]),
                          //Pegando o SET da CLASSE LOGIN com MOBX
                          onChanged: loginStore.setEmail,
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
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha Obrigatória.'),
                            Validatorless.min(
                                5, 'Senha deve ter no mínimo 5 caracteres.')
                          ]),
                          //Pegando o SET da CLASSE LOGIN com MOBX
                          onChanged: loginStore.setPassword,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: const TextStyle(color: Colors.red),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              prefixIcon: const Icon(
                                Icons.password,
                                color: Colors.red,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(color: Colors.red)),
                              fillColor: Colors.red,
                              focusColor: Colors.red,
                              hoverColor: Colors.red,
                              //Exibir e esconder senha
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _canShowPassword = !_canShowPassword;
                                  });
                                },
                                icon: Icon(
                                  _canShowPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.red,
                                ),
                              )),
                          obscureText: !_canShowPassword,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                            onPressed: () {
                              //var formValid = _formKey.currentState?.validate();
                              //validação dos campos do formulario
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                              }
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
