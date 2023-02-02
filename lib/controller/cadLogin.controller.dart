import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:four_finance_app/src/models/api_response.model.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:four_finance_app/store/user.store.dart';
import 'package:get_it/get_it.dart';

class CadLoginController {
  final _userStore = GetIt.instance.get<UserStore>();

  String _nameUser = "";
  String _email = "";
  String _password = "";
  String _repeatPassword = "";

  changeName(String value) {
    _nameUser = value;
  }

  changeEmail(String value) {
    _email = value;
  }

  changePassword(String value) {
    _password = value;
  }

  changeRepeatPassword(String value) {
    _repeatPassword = value;
  }

  Future<APIResponse<bool>> doRegister() async {
    try {
      if (_password != _repeatPassword) {
        return APIResponse.error('Senhas estão diferentes.');
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      if (userCredential.user != null) {
        var loginStore = LoginStore(nameUser: _nameUser, email: _email);
        _userStore.loadPerson(LoginStore(nameUser: _nameUser));
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(loginStore.toMap());

        return APIResponse.success(true);
      } else {
        return APIResponse.error("Alguma coisa tá errada !");
      }
    } on FirebaseAuthException catch (e) {
      return APIResponse.error("Alguma coisa tá errada");
    }
  }
}
