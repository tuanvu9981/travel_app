import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';

class UpdateEmailScreen extends ConsumerStatefulWidget {
  String oldEmail;
  UpdateEmailScreen({Key? key, required this.oldEmail}) : super(key: key);

  @override
  UpdateEmailScreenState createState() => UpdateEmailScreenState();
}

class UpdateEmailScreenState extends ConsumerState<UpdateEmailScreen> {
  final txtStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'VNPro',
    fontSize: 16.0,
  );
  final kHint = const TextStyle(
    color: Colors.black26,
    fontFamily: 'VNPro',
    fontSize: 16.0,
  );
  final kInputStyle = BoxDecoration(
    color: Colors.white,
    border: Border.all(width: 0.25, color: Colors.black),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
  var newEmailEditor = TextEditingController();
  var oldEmailEditor = TextEditingController();

  Future<void> updateEmail(
    String oldEmail,
    String newEmail,
    BuildContext context,
  ) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final result = await ref.read(authProvider).updateEmail(oldEmail, newEmail);
    if (result!.statusCode == 200) {
      var currentUser = ref.read(userProvider);
      currentUser!.email = newEmail;
      ref.read(userProvider.notifier).update((state) => currentUser);
      navigator.pop(true);
    } else if (result.statusCode == 400) {
      sMessenger.showSnackBar(
        SnackBar(
          content: Text(result.message),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    oldEmailEditor.text = widget.oldEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update personal email',
          style: TextStyle(
            fontSize: 16.5,
            fontFamily: 'VNPro',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              padding: const EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              decoration: kInputStyle,
              height: 60.0,
              child: TextField(
                enabled: false,
                controller: oldEmailEditor,
                keyboardType: TextInputType.emailAddress,
                style: txtStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  hintStyle: kHint,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              decoration: kInputStyle,
              height: 60.0,
              child: TextField(
                controller: newEmailEditor,
                keyboardType: TextInputType.emailAddress,
                style: txtStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  hintText: 'Enter your new email',
                  hintStyle: kHint,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 22.5),
                child: TextButton(
                  onPressed: () {
                    updateEmail(
                      widget.oldEmail.trim(),
                      newEmailEditor.text.trim(),
                      context,
                    );
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20.0,
                      fontFamily: 'VNPro',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
