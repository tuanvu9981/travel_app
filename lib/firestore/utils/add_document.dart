import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentAdder {
  final CollectionReference db = FirebaseFirestore.instance.collection("");

  Future<DocumentReference> addDocument(Map<String, dynamic> data) async {
    return await db.add(data);
  }
}
