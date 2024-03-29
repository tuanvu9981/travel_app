import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/apis/food.api.dart';
import 'package:travel_app/firestore/food.api.dart';
import 'package:travel_app/models/activity.model.dart';
import 'package:travel_app/models/hotel.model.dart';
import 'package:travel_app/widgets/activities/activity_card.dart';
import 'package:travel_app/widgets/foods/food_card.dart';
import 'package:travel_app/widgets/hotels/hotel_card.dart';

import './destination_display_text.dart';
import './destination_image.dart';
import '../../models/destination.model.dart';
import '../../models/food.model.dart';
import '../../utils/destination.info.dart';

class DestinationScreen extends ConsumerStatefulWidget {
  final Destination? destination;
  const DestinationScreen({Key? key, this.destination}) : super(key: key);

  @override
  DestinationScreenState createState() => DestinationScreenState();
}

class DestinationScreenState extends ConsumerState<DestinationScreen> {
  int _currentTab = 0;
  final EdgeInsets _paddingForTab = const EdgeInsets.only(
    top: 15.0,
    bottom: 15.0,
  );
  final EdgeInsets _paddingGrid = const EdgeInsets.symmetric(
    horizontal: 10.0,
    vertical: 15.0,
  );
  List<Food>? foodList = [];

  Future<void> _fetchData(String? id) async {
    String? accessToken = await ref.watch(authProvider).getCurrentAccessToken();
    List<Food>? data = await FoodApi().getFoodByDestinationId(
      id!,
      accessToken!,
    );
    if (data == null) {
      // Unauthorized
      String? newAccessToken = await ref.watch(authProvider).regenerateToken();
      List<Food>? newData = await FoodApi().getFoodByDestinationId(
        id,
        newAccessToken!,
      );
      setState(() {
        foodList = newData;
      });
    }
    setState(() {
      foodList = data;
    });
  }

  Future<void> _fetchDataFirestore(String? id) async {
    List<Food>? newData = await FoodApiFirestore().getFoodByDestinationId(id!);
    if (newData != null) {
      setState(() {
        foodList = newData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   _fetchData(widget.destination?.id);
    // });
    Future.delayed(Duration.zero, () {
      _fetchDataFirestore(widget.destination?.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userLocale = ref.watch(userProvider)!.systemLanguage;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            DestinationImage(imgUrl: widget.destination?.imageUrl ?? ""),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.search),
                        iconSize: 30.0,
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.sort_outlined),
                        iconSize: 30.0,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20.0,
              top: size.width * 0.75 - 100.0, // SERIOUSLY BE WARED OF THIS !
              child: DestinationDisplayText(
                city: widget.destination?.city!.get(userLocale),
                country: widget.destination?.country!.get(userLocale),
              ),
            ),
            const LocationIcon(),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                0,
                size.width * 0.75 - 25,
                0,
                0,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0),
                  ),
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _currentTab == 0
                      ? ListView.builder(
                          padding: _paddingForTab,
                          itemCount: widget.destination?.activities?.length,
                          itemBuilder: (BuildContext context, int index) {
                            Activity activity =
                                widget.destination!.activities![index];
                            return ActivityCard(activity: activity);
                          },
                        )
                      : _currentTab == 1
                          ? GridView.builder(
                              padding: _paddingGrid,
                              itemCount: foodList?.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.73,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                Food food = foodList![index];
                                return FoodCard(food: food);
                              },
                            )
                          : ListView.builder(
                              padding: _paddingForTab,
                              itemCount: widget.destination?.hotels?.length,
                              itemBuilder: (BuildContext context, int index) {
                                Hotel hotel =
                                    widget.destination!.hotels![index];
                                return HotelCard(hotel: hotel);
                              },
                            ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColorLight,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: DestinationInfo()
            .btmNavIcons
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
            .toList(),
      ),
    );
  }
}
