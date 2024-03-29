import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/screens/update_info_screen/update_email_screen.dart';
import 'package:travel_app/screens/update_info_screen/update_language_screen.dart';
import 'package:travel_app/screens/update_info_screen/update_password_screen.dart';

class PersonalTab extends ConsumerStatefulWidget {
  const PersonalTab({Key? key}) : super(key: key);

  @override
  PersonalTabState createState() => PersonalTabState();
}

class PersonalTabState extends ConsumerState<PersonalTab> {
  Future<void> signOut(BuildContext context) async {
    final navigator = Routemaster.of(context);
    final sMessenger = ScaffoldMessenger.of(context);
    bool result = await ref.read(authProvider).signOut();
    if (result == true) {
      ref.read(userProvider.notifier).update((state) => null);
      navigator.replace('/');
    } else {
      sMessenger.showSnackBar(
        const SnackBar(
          content: Text("Log out failed"),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

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
    return GestureDetector(
      onTap: tFunc,
      child: Container(
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
          ],
        ),
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
              fontSize: 16.0,
              fontFamily: 'VNPro',
              fontWeight: FontWeight.bold,
              color: tColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(NetworkImage image) {
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
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
    final userRef = ref.watch(userProvider);
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
                  _buildAvatar(NetworkImage(userRef!.avatarUrl!)),
                  const SizedBox(width: 15.0),
                  _buildNameAndStatus(userRef.fullname!),
                ],
              ),
            ],
          ),
        ),
        _buildItemLine(
          Icons.account_circle,
          Colors.lightBlue[100],
          'Change your fullname',
          userRef.fullname,
          true,
          () {},
        ),

        // --------- NOTICE THIS ---------
        _buildItemLine(
          Icons.calendar_month_outlined,
          Colors.lightBlue[100],
          'Change your birthday',
          userRef.birthday,
          true,
          () {},
        ),
        _buildItemLine(
          Icons.translate_outlined,
          Colors.lightBlue[100],
          'Change your language',
          AppLocalizations.of(context)!.languageName(userRef.systemLanguage!),
          true,
          () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpdateLanguageScreen(),
              ),
            );
            if (result != null && result == true) {
              setState(() {});
            }
          },
        ),
        // --------- NOTICE THIS ---------

        const SizedBox(height: 15.0),
        _buildGroupTitle(Colors.blue[400], "Security & Contact"),
        _buildItemLine(
          Icons.lock,
          Colors.lightBlue[100],
          'Change your password',
          '**********',
          false,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UpdatePasswordScreen()),
            );
          },
        ),
        _buildItemLine(
          Icons.email,
          Colors.lightBlue[100],
          'Change your email',
          userRef.email,
          true,
          () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateEmailScreen(
                  oldEmail: userRef.email!,
                ),
              ),
            );
            if (result != null && result == true) {
              setState(() {});
            }
          },
        ),

        // --------- NOTICE THIS ---------
        _buildItemLine(
          Icons.phone,
          Colors.lightBlue[100],
          'Change your phone number',
          userRef.phoneNumber,
          true,
          () {},
        ),
        // --------- NOTICE THIS ---------

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
          () {
            signOut(context);
          },
        ),
      ],
    );
  }
}
