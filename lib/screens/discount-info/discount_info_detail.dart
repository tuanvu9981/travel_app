import 'package:flutter/material.dart';
import 'package:travel_app/models/discount.model.dart';
import 'package:travel_app/utils/home.info.dart';

class DiscountInfoDetail extends StatelessWidget {
  final DiscountInfo discountInfo;
  late String startDate;
  late String endDate;

  DiscountInfoDetail({
    required this.discountInfo,
    Key? key,
  }) : super(key: key) {
    startDate = HomeInfoUtil().formatDateTime(
      DateTime.parse(discountInfo.startDate!),
    );
    endDate = HomeInfoUtil().formatDateTime(
      DateTime.parse(discountInfo.endDate!),
    );
  }

  final tBoldTitle = const TextStyle(
    fontFamily: 'VNPro',
    fontSize: 17.5,
    fontWeight: FontWeight.bold,
  );

  final tNormalContent = const TextStyle(fontFamily: 'VNPro', fontSize: 15.0);

  Widget _buildContact(Contact? contact) {
    final _txtStl = TextStyle(fontFamily: 'VNPro', fontSize: 15.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.email, size: 22.5),
              const SizedBox(width: 15.0),
              Text(contact?.email ?? "", style: _txtStl),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.phone, size: 22.5),
              const SizedBox(width: 15.0),
              Text(contact?.phone ?? "", style: _txtStl),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String? title, Widget? contentWidget) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 5.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title!, style: tBoldTitle),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            width: double.infinity,
            child: contentWidget,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News & Discount Information',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Mukta',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Image(
                image: NetworkImage(discountInfo.imageUrl!),
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.4,
              ),
              const SizedBox(height: 15.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.5, vertical: 5.0),
                width: double.infinity,
                child: Text(
                  discountInfo.title!,
                  style: const TextStyle(
                    fontFamily: 'VNPro',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 15.0),
              _buildParagraph(
                "1. Valid time",
                Text(
                  'From $startDate, \nuntil $endDate',
                  style: tNormalContent,
                ),
              ),
              const SizedBox(height: 15.0),
              _buildParagraph(
                "2. Instruction",
                Text(discountInfo.instruction!, style: tNormalContent),
              ),
              const SizedBox(height: 15.0),
              _buildParagraph(
                "3. Applied Places",
                Text(discountInfo.appliedPlace!, style: tNormalContent),
              ),
              const SizedBox(height: 15.0),
              _buildParagraph(
                "4. Contacts",
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: discountInfo.contact!
                      .map((e) => _buildContact(e))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
