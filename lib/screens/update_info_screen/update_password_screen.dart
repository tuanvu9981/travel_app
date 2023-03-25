import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/apis/auth.api.dart';

class UpdatePasswordScreen extends ConsumerStatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  UpdatePasswordScreenState createState() => UpdatePasswordScreenState();
}

class UpdatePasswordScreenState extends ConsumerState<UpdatePasswordScreen> {
  final txtStyle = const TextStyle(
    color: Colors.black,
    fontFamily: 'Mukta',
    fontSize: 18.0,
  );
  final kHint = const TextStyle(
    color: Colors.black26,
    fontFamily: 'Mukta',
    fontSize: 18.0,
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
  var newPasswordEditor = TextEditingController();
  var oldPasswordEditor = TextEditingController();
  bool newPwVisible = true;
  bool oldPwVisible = true;

  Future<void> updateEmail(
    String oldPw,
    String newPw,
    BuildContext context,
  ) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final result = await ref.read(authProvider).updatePassword(oldPw, newPw);
    if (result!.statusCode == 200) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update password',
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
                controller: oldPasswordEditor,
                keyboardType: TextInputType.visiblePassword,
                obscureText: oldPwVisible,
                style: txtStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  hintStyle: kHint,
                  hintText: 'Enter your current password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        oldPwVisible = !oldPwVisible;
                      });
                    },
                    child: oldPwVisible
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                  ),
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
                controller: newPasswordEditor,
                keyboardType: TextInputType.visiblePassword,
                obscureText: newPwVisible,
                style: txtStyle,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  hintText: 'Enter your new password',
                  hintStyle: kHint,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        newPwVisible = !newPwVisible;
                      });
                    },
                    child: newPwVisible
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 22.5),
                child: TextButton(
                  onPressed: () {
                    updateEmail(
                      oldPasswordEditor.text.trim(),
                      newPasswordEditor.text.trim(),
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
