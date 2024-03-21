import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/activity.model.dart';
import 'package:travel_app/models/destination.model.dart';
import 'package:travel_app/models/hotel.model.dart';

class DestinationApiFirestore {
  final hotelCollection = "hotel";
  final activityCollection = "activity";
  final destinationCollection = "destination";
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Destination>?> getAllDestinations() async {
    final querySnapshot = await db.collection(destinationCollection).get();
    List<Destination> result = [];
    List<Activity> activities = [];
    List<Hotel> hotels = [];
    int counter = 0;
    for (var docSnapshot in querySnapshot.docs) {
      print("counter: $counter");
      final activityIds = docSnapshot.data()["activities"];
      final hotelIds = docSnapshot.data()["hotels"];
      activities = [];
      hotels = [];

      for (var activityId in activityIds) {
        final activitySnapshot =
            await db.collection(activityCollection).doc(activityId).get();
        activities.add(Activity.fromFirestore(activitySnapshot, null));
      }

      for (var hotelId in hotelIds) {
        final hotelSnapshot =
            await db.collection(hotelCollection).doc(hotelId).get();
        hotels.add(Hotel.fromFirestore(hotelSnapshot, hotelId, null));
      }

      // docSnapshot is immutable !!
      // docSnapshot.data()["activities"] = activities;
      // docSnapshot.data()["hotels"] = hotels;
      var processedDocSnapshot = docSnapshot.data();
      processedDocSnapshot["activities"] = activities;
      processedDocSnapshot["hotels"] = hotels;

      result.add(
        Destination.fromFirestore(processedDocSnapshot, docSnapshot.id, null),
      );
      counter += 1;
    }
    return result;
  }

  Future<List<Destination>?> getTopDestinations() async {
    final destinations = await getAllDestinations();
    return destinations?.sublist(0, 5);
  }
}
