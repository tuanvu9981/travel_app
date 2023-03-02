import 'package:flutter/material.dart';
import 'package:travel_app/const/text_style.const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;
  final txtStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'Mukta',
    fontSize: 18.0,
  );
  var passwordEditor = TextEditingController();
  var emailEditor = TextEditingController();
  var fullnameEditor = TextEditingController();

  @override
  void dispose() {
    // clean TextInput when widget removed from the widget tree.
    emailEditor.dispose();
    passwordEditor.dispose();
    fullnameEditor.dispose();
    super.dispose();
  }

  Widget _buildFullnameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Fullname', style: kLabelStyle),
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
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              suffixIcon: Icon(Icons.person, color: Colors.white),
              hintText: 'Enter your fullname',
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
        const Text('Email', style: kLabelStyle),
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
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              suffixIcon: Icon(Icons.email, color: Colors.white),
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
            controller: passwordEditor,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _isObscure,
            style: txtStyle,
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
                        Icons.visibility_off_outlined,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
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

  Widget _buildSignUpBtn() {
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
        onPressed: () => {},
        child: const Text(
          'SIGN UP',
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

  Widget _buildSignUpWithText() {
    return Column(
      children: const [
        Text('- OR -', style: kLabelStyle),
        Text('Sign up with', style: kLabelStyle),
      ],
    );
  }

  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: () => {
        Navigator.pop(context),
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(text: 'You\'ve got an account ?', style: kStyle),
            TextSpan(text: ' Sign In', style: kLabelStyle),
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
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Mukta',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  _buildFullnameTextField(),
                  const SizedBox(height: 20.0),
                  _buildEmailTextField(),
                  const SizedBox(height: 20.0),
                  _buildPasswordTextField(),
                  _buildSignUpBtn(),
                  _buildSignUpWithText(),
                  _buildSocialBtnRow(),
                  _buildSignInBtn()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
