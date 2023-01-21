import 'package:flutter/material.dart';
import 'package:four_finance_app/login/data/providers/login_store.dart';
import 'package:four_finance_app/widget/text.form.field.padrao.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Todo: Chamando a CLASSE LOGIN q contém o MOBX, foi removido (= LoginStore();), por conta do PROVIDER
  late LoginStore loginStore;

  //Todo: Usado p transitar dados com MOBX o PROVIDER é necessário
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginStore = Provider.of<LoginStore>(context);
  }

  //Todo: Chave do formulario p usar em validar os campos
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
                            //Usando VALIDATORLESS
                            validator: Validatorless.multiple([
                              Validatorless.required('E-mail Obrigatório.'),
                              Validatorless.email('E-mail Inválido.'),
                            ]),
                            //Pegando o SET da CLASSE LOGIN com MOBX
                            onChanged: loginStore.setEmail,
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                            )),
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
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
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
                          child: ElevatedButton(
                              onPressed: () {
                                //Todo: Validação dos campos do formulario
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
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
                                  MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            child: const Text('CADASTRE-SE'),
                          ),
                        ),
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
