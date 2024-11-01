import 'package:first_app/main.dart';
import 'package:first_app/screens/homepage.dart';
import 'package:first_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  // Define your styles here if needed
  final kLabelStyle = const TextStyle(color: Colors.white, fontSize: 18.0);
  final kBoxDecorationStyle = BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 6.0,
        offset: Offset(0, 2),
      ),
    ],
  );
  final kHintTextStyle = const TextStyle(color: Colors.white54, fontSize: 16.0);

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email', style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(Icons.email, color: Colors.white),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Password', style: kLabelStyle),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: const TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(Icons.lock, color: Colors.white),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text('Forgot Password?', style: kLabelStyle),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return SizedBox(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text('Remember me', style: kLabelStyle),
        ],
      ),
    );
  }

 Widget _buildLoginBtn(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()), 
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        backgroundColor: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: const Text(
        'LOGIN',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        const Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Future<void> Function() onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
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
        children: <Widget>[
          _buildSocialBtn(
            () async {
              const facebookUrl = 'https://www.facebook.com/';
              if (await canLaunch(facebookUrl)) {
                await launch(facebookUrl);
              } else {
                throw 'Could not launch $facebookUrl';
              }
            },
            const AssetImage('assets/logos/facebook.jpg'),
          ),
          _buildSocialBtn(
            () async {
              const googleUrl = 'https://www.google.com/';
              if (await canLaunch(googleUrl)) {
                await launch(googleUrl);
              } else {
                throw 'Could not launch $googleUrl';
              }
            },
            const AssetImage('assets/logos/google.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupBtn() {
  return Material(
    color: Colors.transparent, // Make the material background transparent
    child: InkWell(
      onTap: () {
        // Navigate to the Sign Up screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3594DD),
                      Color(0xFF4563DB),
                      Color(0xFF5036D5),
                      Color(0xFF5B16D0),
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
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      _buildEmailTF(),
                      const SizedBox(height: 30.0),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(context),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildSignupBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
