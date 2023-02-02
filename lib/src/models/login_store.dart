class LoginStore {
  String nameUser = '';
  String email = '';
  // String password = '';

  LoginStore({this.nameUser = '', this.email = ''});

  LoginStore.fromFirestore(Map<String, dynamic> map) {
    nameUser = map['nameUser'] ?? "";
    email = map['email'] ?? "";
    //password = map['password'] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {'nameUser': nameUser, 'email': email};
  }
}
