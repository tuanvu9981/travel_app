import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:travel_app/apis/auth.api.dart';
import 'package:travel_app/apis/booking-history.api.dart';
import 'package:travel_app/const/text_style.const.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  bool isLoading = false;
  bool _isObscure = true;
  final txtStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'VNPro',
    fontSize: 16.5,
  );
  var passwordEditor = TextEditingController();
  var emailEditor = TextEditingController();
  var fullnameEditor = TextEditingController();

  Future<void> signUp(
    BuildContext context,
    String email,
    String password,
    String fullname,
  ) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Routemaster.of(context);
    final result =
        await ref.read(authProvider).signUp(email, password, fullname);
    if (result == true) {
      final user = await ref.read(authProvider).getProfile();
      if (user != null) {
        // create booking history (no worry of expiration because just signing up)
        String? accessToken =
            await ref.read(authProvider).getCurrentAccessToken();
        await BookingHistoryApi().createUserBookingHistory(accessToken!);

        // update state & navigation
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

  @override
  void dispose() {
    // clean TextInput when widget removed from the widget tree.
    emailEditor.dispose();
    passwordEditor.dispose();
    fullnameEditor.dispose();
    super.dispose();
  }

  Widget _buildFullnameTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.fullname, style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: fullnameEditor,
            keyboardType: TextInputType.name,
            style: txtStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              suffixIcon: const Icon(Icons.person, color: Colors.white),
              hintText: AppLocalizations.of(context)!.enterFullname,
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
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

  Widget _buildPasswordTextField() {
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

  Widget _buildSignUpBtn(BuildContext context) {
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
          signUp(
            context,
            emailEditor.text.trim(),
            passwordEditor.text.trim(),
            fullnameEditor.text.trim(),
          );
          setState(() {
            isLoading = true;
          });
        },
        child: isLoading == false
            ? Text(
                AppLocalizations.of(context)!.signUp,
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

  Widget _buildSignUpWithText(BuildContext context) {
    return Column(
      children: [
        Text(
          '- ${AppLocalizations.of(context)!.or} -',
          style: kLabelStyle,
        ),
        Text(AppLocalizations.of(context)!.signUpWith, style: kLabelStyle),
      ],
    );
  }

  Widget _buildSignInBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => Routemaster.of(context).replace('/'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: AppLocalizations.of(context)!.gotAnAcc, style: kStyle),
            TextSpan(
              text: ' ${AppLocalizations.of(context)!.signIn}',
              style: kLabelStyle,
            ),
          ],
        ),
      ),
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
                horizontal: 40.0,
                vertical: 60.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.signUp,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Mukta',
                      fontSize: 27.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  _buildFullnameTextField(context),
                  const SizedBox(height: 20.0),
                  _buildEmailTextField(),
                  const SizedBox(height: 20.0),
                  _buildPasswordTextField(),
                  _buildSignUpBtn(context),
                  _buildSignUpWithText(context),
                  _buildSocialBtnRow(),
                  _buildSignInBtn(context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
