import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:four_finance_app/components/custom_alert_dialog.component.dart';
import 'package:four_finance_app/components/progress_dialog.component.dart';
import 'package:four_finance_app/controller/login.controller.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:four_finance_app/widget/text.form.field.padrao.dart';
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

  final _controller = LoginController();

  final _progresDialog = ProgressDialog();
  final _alesrtDialog = CustomAlertDialog();

  StreamSubscription? _streamSubscriprion;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => preload());
  }

  //usado p transitar dados com MOBX o PROVIDER é necessário
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  @override
  void dispose() async {
    super.dispose();
    if (_streamSubscriprion != null) await _streamSubscriprion!.cancel();
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
                              TextFormField(
                                  onChanged: _controller.changeEmail,
                                  //Usando VALIDATORLESS
                                  validator: Validatorless.multiple([
                                    Validatorless.required(
                                        'E-mail Obrigatório.'),
                                    Validatorless.email('E-mail Inválido.'),
                                  ]),
                                  //Pegando o SET da CLASSE LOGIN com MOBX
                                  //onChanged: loginStore.setEmail,
                                  decoration: const InputDecoration(
                                    labelText: 'E-mail',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    prefixIcon: Icon(
                                      Icons.email,
                                    ),
                                  )),
                              const SizedBox(height: 32),
                              TextFormField(
                                onChanged: _controller.changePassword,
                                //Usando o VALIDATORLESS
                                validator: Validatorless.multiple([
                                  Validatorless.required('Senha Obrigatória.'),
                                  Validatorless.min(5,
                                      'Senha deve ter no mínimo 5 caracteres.')
                                ]),
                                //Pegando o SET da CLASSE LOGIN com MOBX
                                //onChanged: loginStore.setPassword,
                                decoration: InputDecoration(
                                    labelText: 'Senha',
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    prefixIcon: const Icon(
                                      Icons.password,
                                    ),
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
                                      ),
                                    )),
                                obscureText: !_canShowPassword,
                              ),
                              const SizedBox(height: 32),
                              SizedBox(
                                width: 190,
                                height: 60,
                                //Aqui
                                child: ElevatedButton(
                                    onPressed: _doLogin, //() {
                                    //var formValid = _formKey.currentState?.validate();
                                    //validação dos campos do formulario
                                    // if (_formKey.currentState!.validate()) {
                                    //Navigator.of(context)
                                    //     .pushReplacementNamed('/home');
                                    // }
                                    //},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16)))),
                                    child: const Text('ACESSAR')),
                              ),
                              const SizedBox(height: 32),
                              SizedBox(
                                width: 190,
                                height: 60,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/cadUsuario');
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16)))),
                                    child: const Text('CADASTRE-SE')),
                              ),
                              const SizedBox(height: 32),
                              const Text(
                                'Ou faça login com',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                ))));
  }

  Future preload() async {
    _streamSubscriprion =
        FirebaseAuth.instance.authStateChanges().listen((user) async {
      if (user != null) {
        await _streamSubscriprion!.cancel();
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  _doLogin() async {
    _progresDialog.show("Autenticando");
    final response = await _controller.doLogin();
    if (response.isSuccess) {
      print('passou por aqui');
    } else {
      print('Deu errado');
      _progresDialog.hide();
      _alesrtDialog.showInfo(title: "oxe", message: response.message!);
    }
  }
}
