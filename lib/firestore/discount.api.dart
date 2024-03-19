import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/discount.model.dart';

class DiscountApiFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final discountCollection = "discount";

  Future<List<DiscountInfo>> getAllDiscountInfos() async {
    final querySnapshot = await db.collection(discountCollection).get();
    List<DiscountInfo> result = [];
    for (var docSnapshot in querySnapshot.docs) {
      result.add(DiscountInfo.fromFirestore(docSnapshot, null));
    }
    return result;
  }
}
