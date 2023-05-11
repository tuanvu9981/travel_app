import 'package:flutter/material.dart';
import 'package:travel_app/models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  Activity activity;
  ActivityCard({Key? key, required this.activity}) : super(key: key);

  Text _buildRatingStar(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    // stars.trim()
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
          height: 180.0,
          width: double.infinity, // ?????
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
          ),

          child: Padding(
            padding: EdgeInsets.fromLTRB(130.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.0,
                      child: Text(
                        activity.name ?? "",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'VNPro',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '\$${activity.price}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.greenAccent,
                            fontFamily: 'VNPro',
                          ),
                        ),
                        const Text(
                          'per pax',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.5),
                Text(
                  activity.type ?? "",
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 5.0),
                _buildRatingStar(activity.rating?.toInt() ?? 0),
                const SizedBox(height: 12.5),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 90.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD8ECF1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      // being center of box(container=div)
                      child: Text(activity.startTimes![0]),
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 90.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD8ECF1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.center,
                      // being center of box(container=div)
                      child: Text(activity.startTimes![1]),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 30.0,
          top: 20.0,
          // only left, top: the image still not cover. add both top & bottom
          bottom: 20.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              width: 110.0,
              image: NetworkImage(activity.imageUrl ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
