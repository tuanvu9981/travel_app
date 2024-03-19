import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/food.model.dart';

class FoodApiFirestore {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final foodCollection = "food";

  Future<List<Food>> getFoodByDestinationId(String destinationId) async {
    final querySnapshot = await db
        .collection(foodCollection)
        .where("destinationId", isEqualTo: destinationId)
        .get();
    List<Food> result = [];
    for (var docSnapshot in querySnapshot.docs) {
      result.add(Food.fromFirestore(docSnapshot, null));
    }
    return result;
  }
}
