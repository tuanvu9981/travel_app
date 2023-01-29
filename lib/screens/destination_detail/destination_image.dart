import 'package:flutter/material.dart';

class DestinationImage extends StatelessWidget {
  String? imgUrl;
  DestinationImage({Key? key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 9.0,
          ),
        ],
      ),
      child: Hero(
        tag: imgUrl ?? "",
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          child: Image(
            image: NetworkImage(
              imgUrl ?? "",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
