import 'package:flutter/material.dart';
import 'package:travel_app/models/user.model.dart';

class PersonalTab extends StatefulWidget {
  const PersonalTab({Key? key}) : super(key: key);

  @override
  PersonalTabState createState() => PersonalTabState();
}

class PersonalTabState extends State<PersonalTab> {
  User user = User(
    email: 'vutuanvu9999@gmail.com',
    fullname: 'Vũ Tuấn Vũ',
    avatarUrl: 'assets/images/duck.jpg',
    phoneNumber: '+84 78 898 2653',
    birthday: 'February 9th 2001',
  );

  @override
  void initState() {
    super.initState();
  }

  final tBoldStl = const TextStyle(
    fontFamily: 'VNPro',
    fontWeight: FontWeight.bold,
    fontSize: 16.5,
  );

  final tNormalStl = const TextStyle(
    fontFamily: 'VNPro',
    fontSize: 14.0,
    color: Colors.black54,
  );

  Widget _buildItemLine(
    IconData tIcon,
    Color? tColor,
    String tBoldText,
    String? tNormalText,
    bool farFromTitle,
    void Function() tFunc,
  ) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: farFromTitle == true
            ? const Border(
                top: BorderSide(width: 0.5, color: Colors.grey),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(tIcon, size: 35.0, color: tColor),
          ),
          Expanded(
            flex: 5,
            child: tNormalText == null
                ? Text(tBoldText, style: tBoldStl)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tBoldText, style: tBoldStl),
                      const SizedBox(height: 5.0),
                      Text(tNormalText, style: tNormalStl)
                    ],
                  ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: tFunc,
              child: Icon(Icons.arrow_forward, size: 35.0, color: tColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupTitle(Color? tColor, String groupTitle) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            groupTitle,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Mukta',
              fontWeight: FontWeight.bold,
              color: tColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(AssetImage image) {
    return GestureDetector(
      onTap: () => {},
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(color: Colors.white, height: 35, width: 35),
          CircleAvatar(
            radius: 35.0,
            backgroundImage: image,
          ),
          Container(
            height: 27.5,
            width: 27.5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              size: 20.0,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameAndStatus(String fullname) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullname,
          style: const TextStyle(
            fontFamily: 'VNPro',
            fontWeight: FontWeight.bold,
            fontSize: 18.5,
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.circle, size: 18.5, color: Colors.lightGreen),
            SizedBox(width: 7.5),
            Text(
              "Active",
              style: TextStyle(
                fontFamily: 'VNPro',
                fontSize: 16.0,
                color: Colors.lightGreen,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildGroupTitle(Colors.blue[400], "Personal Information"),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildAvatar(AssetImage(user.avatarUrl ?? "")),
                  const SizedBox(width: 15.0),
                  _buildNameAndStatus('Vũ Tuấn Vũ'),
                ],
              ),
            ],
          ),
        ),
        _buildItemLine(
          Icons.account_circle,
          Colors.lightBlue[100],
          'Change your fullname',
          user.fullname,
          true,
          () {},
        ),
        _buildItemLine(
          Icons.calendar_month_outlined,
          Colors.lightBlue[100],
          'Change your birthday',
          user.birthday,
          true,
          () {},
        ),
        const SizedBox(height: 15.0),
        _buildGroupTitle(Colors.blue[400], "Security & Contact"),
        _buildItemLine(
          Icons.lock,
          Colors.lightBlue[100],
          'Change your password',
          '**********',
          false,
          () {},
        ),
        _buildItemLine(
          Icons.email,
          Colors.lightBlue[100],
          'Change your email',
          user.email,
          true,
          () {},
        ),
        _buildItemLine(
          Icons.phone,
          Colors.lightBlue[100],
          'Change your phone number',
          user.phoneNumber,
          true,
          () {},
        ),
        const SizedBox(height: 15.0),
        _buildGroupTitle(Colors.green[500], "Recharge"),
        _buildItemLine(
          Icons.account_balance_outlined,
          Colors.green[100],
          'From Bank Account',
          null,
          false,
          () {},
        ),
        _buildItemLine(
          Icons.money_outlined,
          Colors.green[100],
          'From Viettel Pay',
          null,
          true,
          () {},
        ),
        _buildItemLine(
          Icons.attach_money_outlined,
          Colors.green[100],
          'From Momo',
          null,
          true,
          () {},
        ),
        const SizedBox(height: 15.0),
        _buildGroupTitle(Colors.red[400], "Attention Area"),
        _buildItemLine(
          Icons.dangerous_outlined,
          Colors.red[200],
          'Sign out',
          null,
          false,
          () {},
        ),
      ],
    );
  }
}
