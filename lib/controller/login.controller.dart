import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:four_finance_app/src/models/login_store.dart';
import 'package:four_finance_app/store/user.store.dart';
import 'package:get_it/get_it.dart';

import '../src/models/api_response.model.dart';

class LoginController {
  final _userStore = GetIt.instance.get<UserStore>();

  String _nameUser = "";
  String _email = "";
  String _password = "";

  changeNameUser(String values) {
    _nameUser = values;
  }

  changeEmail(String values) {
    _email = values;
  }

  changePassword(String values) {
    _password = values;
  }

  Future<APIResponse<bool>> doLogin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      if (userCredential.user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
        LoginStore loginStore =
            LoginStore.fromFirestore(snapshot.data() as Map<String, dynamic>);
        _userStore.loadPerson(loginStore);
        return APIResponse.success(true);
      } else {
        return APIResponse.error("Alguma coisa tá errada!");
      }
    } catch (exception) {
      return APIResponse.error((exception as FirebaseAuthException).message);
    }
  }
}
