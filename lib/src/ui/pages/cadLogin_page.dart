import 'package:firebase_auth/firebase_auth.dart';
import 'package:four_finance_app/components/custom_alert_dialog.component.dart';
import 'package:four_finance_app/components/progress_dialog.component.dart';
import 'package:four_finance_app/controller/cadLogin.controller.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:four_finance_app/store/user.store.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter/material.dart';

class CadUsuarioPage extends StatelessWidget {
  CadUsuarioPage({super.key});

  //@override
  // State<CadUsuarioPage> createState() => _CadUsuarioPageState();
//}

//class _CadUsuarioPageState extends State<CadUsuarioPage> {
  //Chamando a CLASSE LOGIN q contém o MOBX, foi removido (= LoginStore();), por conta do PROVIDER
  //late LoginStore loginStore;

  //usado p transitar dados com MOBX o PROVIDER é necessário
  // @override
  // void didChangeDependencies() {
  //  super.didChangeDependencies();
  //  loginStore = Provider.of<LoginStore>(context);
  // }

  //chave global
  final _formKey = GlobalKey<FormState>();
  //Controlar dos campos digitaveis
  //final _nameUsuarioController = TextEditingController();
  //final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmSenhaController = TextEditingController();

  //Tudo p o FIREBASE
  final _controllerRegister = CadLoginController();
  final _progressDialog = ProgressDialog();
  final _alertDialog = CustomAlertDialog();
  //final _firebaseAuth = FirebaseAuth.instance;

  final bool _canShowPassword = false;

/*
  @override
  void dispose() {
    _nameUsuarioController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmSenhaController.dispose();
    super.dispose();
  }
*/
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
                          //pegando o digitado p enviar ao FIREBASE
                          onChanged: _controllerRegister.changeName,
                          validator: Validatorless.multiple([
                            Validatorless.required(
                                'Nome do usuário é obrigatório.'),
                            Validatorless.min(5,
                                'Nome do usuário deve ter no mínimo 5 caracteres.')
                          ]),
                          //Faz parte do MOBX para setar o NOME USUARIO
                          //onChanged: loginStore.setNameUser,
                          //controller: _nameUsuarioController,
                          decoration: const InputDecoration(
                            labelText: 'Nome Usuário',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          //Pegando o digitado p enviar ao FIREBASE
                          onChanged: _controllerRegister.changeEmail,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail obrigatório.'),
                            Validatorless.email('E-mail inválido.'),
                          ]),
                          //Faz parte d MOBX p setar o EMAIL
                          //onChanged: loginStore.setEmail,
                          //controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          //Pegando o digitado p enviar ao FIREBASE
                          onChanged: _controllerRegister.changePassword,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatória.'),
                            Validatorless.min(
                                6, 'Senha deve ter no mínimo 6 caracteres.')
                          ]),
                          controller: _senhaController,
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              prefixIcon: const Icon(
                                Icons.password,
                              ),
                              //exibir e escondr senha
                              suffixIcon: IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   _canShowPassword = !_canShowPassword;
                                  // });
                                },
                                icon: Icon(
                                  _canShowPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                          obscureText: !_canShowPassword,
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          //Pegando o digitado p enviar ao FIREBASE
                          onChanged: _controllerRegister.changeRepeatPassword,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatória.'),
                            Validatorless.min(
                                6, 'Senha deve ter no mínimo 6 caracteres.'),
                            Validatorless.compare(_senhaController,
                                'Senha diferente do confirma senha.')
                          ]),
                          controller: _confirmSenhaController,
                          decoration: InputDecoration(
                              labelText: 'Repita a senha',
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              prefixIcon: const Icon(
                                Icons.password,
                                //color: Colors.red,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  // setState(() {
                                  //   _canShowPassword = !_canShowPassword;
                                  //});
                                },
                                icon: Icon(
                                  _canShowPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              )),
                          obscureText: !_canShowPassword,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: 190,
                          height: 60,
                          child: ElevatedButton(
                              onPressed: () {
                                // var formValid =
                                //_formKey.currentState?.validate() ?? false;
                                //validação dos campos do formulario
                                if (_formKey.currentState!.validate()) {
                                  _doRegister();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                }

                                // Navigator.pushReplacementNamed(
                                //   context, '/home');
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)))),
                              child: const Text('CRIAR CONTA')),
                        ),
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

  _doRegister() async {
    final response = await _controllerRegister.doRegister();
    await _progressDialog.show("Efetuando Cadastro");

    if (response.isSuccess) {
      print('Conta criada com sucesso');
      //Navigator.pushReplacementNamed('/home');
    } else {
      await _progressDialog.hide();
      await _alertDialog.showInfo(
          title: "Deu merda", message: response.message!);
    }
  }
}
