/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:four_finance_app/src/models/transaction.model.dart' as ff;

class TransactionService {
  Future<List<ff.Transaction>> getTransactions() async {
    final usuarioID = FirebaseAuth.instance.currentUser!.uid;

    final querySnapshot = await FirebaseFirestore.instance
        .collection("profiles")
        .doc(usuarioID)
        .collection("transactions")
        .get();
    for (var documentSnapshot in querySnapshot.docs) {
      //
    }

    final documentSnapshot = await FirebaseFirestore.instance
        .collection("profiles")
        .doc(usuarioID)
        .set({});
  }
}
*/