import 'package:flutter/material.dart';
import 'package:travel_app/models/food.model.dart';

class FoodCard extends StatelessWidget {
  Food food;
  FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.5),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              child: Image(
                width: 60.0,
                height: 60.0,
                image: NetworkImage(food.imageUrl ?? ""),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          food.foodName ?? "",
                          style: const TextStyle(
                            fontFamily: 'Mukta',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          food.english ?? "",
                          style: TextStyle(
                            fontFamily: 'Mukta',
                            fontSize: 12.0,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$${food.price}",
                      style: TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 17.5,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      food.address ?? "",
                      style: const TextStyle(
                        fontFamily: 'Mukta',
                        fontSize: 13.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
