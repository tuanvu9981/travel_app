import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/const/text_style.const.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends ConsumerState<SignInScreen> {
  bool _isObscure = true;
  bool isLoading = false;
  final txtStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'VNPro',
    fontSize: 16.5,
  );
  var passwordEditor = TextEditingController();
  var emailEditor = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Routemaster.of(context);
    final result = await ref.read(authProvider).signIn(email, password);
    if (result == true) {
      final user = await ref.read(authProvider).getProfile();
      if (user != null) {
        ref.read(userProvider.notifier).update((state) => user);
        navigator.replace('/');
      }
    } else {
      sMessenger.showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.authFailed),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  Future<void> signInFirebase(
    BuildContext context,
    String email,
    String password,
  ) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Routemaster.of(context);
    try {
      // MAKE CLEAR !!!
      // final result = await auth.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // final user = await ref.read(authProvider).getProfile();
      // if (user != null) {
      //   ref.read(userProvider.notifier).update((state) => user);
      //   navigator.replace('/');
      // }
    } catch (e) {
      sMessenger.showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.authFailed),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  void dispose() {
    // clean TextInput when widget removed from the widget tree.
    emailEditor.dispose();
    passwordEditor.dispose();
    super.dispose();
  }

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.email, style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: emailEditor,
            keyboardType: TextInputType.emailAddress,
            style: txtStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              suffixIcon: const Icon(Icons.email, color: Colors.white),
              hintText: AppLocalizations.of(context)!.enterEmail,
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.password, style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: passwordEditor,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _isObscure,
            style: txtStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: _isObscure
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Colors.white,
                      ),
              ),
              hintText: AppLocalizations.of(context)!.enterPassword,
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPasswordBtn(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: kLabelStyle,
        ),
        onPressed: () => {},
      ),
    );
  }

  Widget _buildSignInBtn(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity, // width: 100%
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, //background color
          // elevation: 5.0,
          padding: const EdgeInsets.all(8.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () {
          signIn(context, emailEditor.text.trim(), passwordEditor.text.trim());
          setState(() {
            isLoading = true;
          });
        },
        child: isLoading == false
            ? Text(
                AppLocalizations.of(context)!.signIn,
                style: const TextStyle(
                  color: Color(0xFF527DAA),
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'VNPro',
                ),
              )
            : Center(
                child: Transform.scale(
                  scale: 0.6,
                  child: const CircularProgressIndicator(
                    color: Colors.lightBlue,
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildSignInWithText(BuildContext context) {
    return Column(
      children: [
        Text('- ${AppLocalizations.of(context)!.or} -', style: kLabelStyle),
        Text(AppLocalizations.of(context)!.signInWith, style: kLabelStyle),
      ],
    );
  }

  Widget _buildSingleSocialBtn(void Function() onTapFunc, AssetImage logo) {
    return GestureDetector(
      onTap: onTapFunc,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(image: logo),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSingleSocialBtn(
            () {
              print('Login with Facebook');
            },
            const AssetImage('assets/logos/facebook.jpg'),
          ),
          _buildSingleSocialBtn(
            () {
              print('Login with Google');
            },
            const AssetImage('assets/logos/google.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => Routemaster.of(context).replace('/sign-up'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context)!.dontHaveAcc,
              style: kStyle,
            ),
            TextSpan(
              text: ' ${AppLocalizations.of(context)!.signUp}',
              style: kLabelStyle,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 60.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.signIn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'VNPro',
                      fontSize: 27.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32.5),
                  _buildEmailTextField(),
                  const SizedBox(height: 32.5),
                  _buildPasswordTextField(context),
                  _buildForgotPasswordBtn(context),
                  _buildSignInBtn(context),
                  _buildSignInWithText(context),
                  _buildSocialBtnRow(),
                  _buildSignUpBtn(context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
