import 'package:flutter/material.dart';

class PersonalTab extends StatefulWidget {
  const PersonalTab({Key? key}) : super(key: key);

  @override
  PersonalTabState createState() => PersonalTabState();
}

class PersonalTabState extends State<PersonalTab> {
  final _sloganStyle = TextStyle(fontSize: 30.0, fontFamily: 'DancingScript');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400]),
                  ),
                  const SizedBox(height: 12.5),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => {},
                        child: const CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage('assets/images/duck.jpg'),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Vũ Tuấn Vũ",
                            style: TextStyle(
                              fontFamily: 'VNPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.5,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "February 9th 2001",
                            style: TextStyle(
                              fontFamily: 'VNPro',
                              fontSize: 16.0,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.account_circle,
                      size: 35.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Change your fullname',
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Vũ Tuấn Vũ',
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35.0,
                        color: Colors.lightBlue[100],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.email,
                      size: 35.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Change your email',
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'vutuanvu9999@gmail.com',
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35.0,
                        color: Colors.lightBlue[100],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Security & Contact",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[400]),
                  ),
                  const SizedBox(height: 12.5),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.lock,
                          size: 35.0,
                          color: Colors.lightBlue[100],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Change your password',
                              style: TextStyle(
                                fontFamily: 'VNPro',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.5,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              '**********',
                              style: TextStyle(
                                fontFamily: 'VNPro',
                                fontSize: 14.0,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 35.0,
                            color: Colors.lightBlue[100],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.phone,
                      size: 35.0,
                      color: Colors.lightBlue[100],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Change your phone number',
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '+84 78 898 2653',
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35.0,
                        color: Colors.lightBlue[100],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recharge",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.bold,
                      color: Colors.green[500],
                    ),
                  ),
                  const SizedBox(height: 12.5),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.account_balance_outlined,
                          size: 35.0,
                          color: Colors.green[100],
                        ),
                      ),
                      const Expanded(
                        flex: 5,
                        child: Text(
                          'From Bank Account',
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 35.0,
                            color: Colors.green[100],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.money_outlined,
                      size: 35.0,
                      color: Colors.green[100],
                    ),
                  ),
                  const Expanded(
                    flex: 5,
                    child: Text(
                      'From Viettel Pay',
                      style: TextStyle(
                        fontFamily: 'VNPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35.0,
                        color: Colors.green[100],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.attach_money_outlined,
                      size: 35.0,
                      color: Colors.green[100],
                    ),
                  ),
                  const Expanded(
                    flex: 5,
                    child: Text(
                      'From Momo',
                      style: TextStyle(
                        fontFamily: 'VNPro',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35.0,
                        color: Colors.green[100],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Attention Area",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.bold,
                      color: Colors.red[400],
                    ),
                  ),
                  const SizedBox(height: 12.5),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.dangerous_outlined,
                          size: 35.0,
                          color: Colors.red[100],
                        ),
                      ),
                      const Expanded(
                        flex: 5,
                        child: Text(
                          'Sign out',
                          style: TextStyle(
                            fontFamily: 'VNPro',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.5,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Icon(
                            Icons.logout,
                            size: 35.0,
                            color: Colors.red[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
