import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class TextFormFieldPadron extends StatelessWidget {
  final Icon prefixIcon;
  final String labelText;
  //final Color color;
  final Validatorless validator;

  const TextFormFieldPadron({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    //required this.color,
    required this.validator,
  }) : super(key: key);

//Trabalahar na criação do WIDGET TEXTFORMFIELD
  // final LoginStore loginStore;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //Usando VALIDATORLESS
      // validator: Validatorless,
      //Pegando o SET da CLASSE LOGIN com MOBX
      // onChanged: loginStore.setEmail,
      //cursorColor: Colors.red,
      decoration: InputDecoration(
        labelText: labelText,
        //labelStyle: const TextStyle(color: Colors.red),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        //enabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(16)),
        //   borderSide: BorderSide(color: Colors.red)),
        //prefixIcon: Icon(
        prefixIcon: prefixIcon,
        //color: color,
        // ),
        //focusedBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(16)),
        // borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}
