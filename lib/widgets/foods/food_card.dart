import 'package:flutter/material.dart';
import 'package:travel_app/models/food.model.dart';

class FoodCard extends StatelessWidget {
  Food food;
  FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image(
              width: 150.0,
              height: 95.0,
              image: NetworkImage(food.imageUrl ?? ""),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Column(
                    children: [
                      Text(
                        food.foodName ?? "",
                        style: const TextStyle(
                          fontFamily: 'VnPro',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        food.english ?? "",
                        style: const TextStyle(
                          fontFamily: 'VNPro',
                          fontSize: 12.5,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    "\$${food.price}",
                    style: TextStyle(
                      fontFamily: 'Mukta',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 20.0,
                  color: Colors.red,
                ),
                Flexible(
                  child: Text(
                    food.address ?? "",
                    style: const TextStyle(
                      fontFamily: 'VNPro',
                      fontSize: 13.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
