import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/models/discount.model.dart';
import 'package:travel_app/screens/discount-info/discount_info_detail.dart';
import 'package:travel_app/widgets/discounts/discount_card.dart';
import '../discounts/discount_header.dart';
import '../../apis/discount.api.dart';

class DiscountCarousel extends ConsumerStatefulWidget {
  const DiscountCarousel({Key? key}) : super(key: key);

  @override
  DiscountCarouselState createState() => DiscountCarouselState();
}

class DiscountCarouselState extends ConsumerState<DiscountCarousel> {
  List<DiscountInfo>? discounts = [];

  Future<void> _fetchData() async {
    String? accessToken = await ref.read(authProvider).getCurrentAccessToken();
    List<DiscountInfo>? data = await DiscountApi().getAllDiscountInfos(
      accessToken!,
    );
    if (data == null) {
      // Unauthorized
      String? newAccessToken = await ref.read(authProvider).regenerateToken();
      List<DiscountInfo>? newData = await DiscountApi().getAllDiscountInfos(
        newAccessToken!,
      );
      setState(() {
        discounts = newData;
      });
    } else {
      setState(() {
        discounts = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: DiscountHeader(),
        ),
        SizedBox(
          height: 170.0,
          width: 650.0,
          child: discounts == null || discounts!.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : CarouselSlider.builder(
                  itemCount: discounts?.length,
                  itemBuilder: (BuildContext context, int index, int realIdx) {
                    DiscountInfo discount = discounts![index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiscountInfoDetail(
                            discountInfo: discounts![index],
                          ),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(7.5),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.5),
                          ),
                          child: DiscountCard(
                            imgUrl: discount.imageUrl!,
                            title: discount.title!,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.625,
                    autoPlayInterval: const Duration(seconds: 2),
                  ),
                ),
        ),
      ],
    );
  }
}

// enableInfiniteScroll: false,
// meaning: start again from the first element

// Theme is always changing --> Theme is not a constant
