import 'package:flutter/material.dart';
import 'package:travel_app/const/text_style.const.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;

  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email', style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Mukta',
              fontSize: 18.0,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              suffixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your email',
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
        const Text('Password', style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: _isObscure,
            style: const TextStyle(
              fontFamily: 'Mukta',
              color: Colors.white,
              fontSize: 18.0,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                child: _isObscure
                    ? const Icon(
                        Icons.lock,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.lock_open_rounded,
                        color: Colors.white,
                      ),
              ),
              hintText: 'Enter your password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text("Forgot your password ?", style: kLabelStyle),
        onPressed: () => {},
      ),
    );
  }

  Widget _buildSignInBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity, // width: 100%
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white, //background color
          // elevation: 5.0,
          padding: const EdgeInsets.all(8.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: () => {
          Navigator.pushNamed(context, '/home'),
        },
        child: const Text(
          'SIGN IN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Mukta',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: const [
        Text('- OR -', style: kLabelStyle),
        Text('Sign in with', style: kLabelStyle),
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

  Widget _buildSignUpBtn() {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/sign-up'),
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(text: 'Don\'t have an account ?', style: kStyle),
            TextSpan(text: ' Sign Up', style: kLabelStyle),
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
          Container(
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
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Mukta',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32.5),
                  _buildEmailTextField(),
                  const SizedBox(height: 32.5),
                  _buildPasswordTextField(),
                  _buildForgotPasswordBtn(),
                  _buildSignInBtn(),
                  _buildSignInWithText(),
                  _buildSocialBtnRow(),
                  _buildSignUpBtn()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
