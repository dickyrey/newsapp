import 'package:flutter/material.dart';
import 'package:newsapp/utils/constants.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 35.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 100.0),
                Text(
                  'Welcome Back',
                  style: headline1,
                ),
                Text(
                  'Hello there, login to see stories from around the world',
                  style: subtitle1,
                ),
                SizedBox(height: 50.0),
                Text('Username or email', style: subtitle2),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kBlueDeepColor,
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Enter your username or email',
                    hintStyle: subtitle1,
                  ),
                  onChanged: (val) {},
                  validator: (value) {},
                ),
                SizedBox(height: 20.0),
                Text('Password', style: subtitle2),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kBlueDeepColor,
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Enter your password',
                    hintStyle: subtitle1,
                  ),
                  onChanged: (val) {},
                  validator: (value) {},
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    /// [Navigate] to reset password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: subtitle2.copyWith(
                      color: kBlueDeepColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: kBlueDeepColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      'Sign in',
                      style: subtitle1.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text('or', style: subtitle2),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.red[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          bottom: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                                'assets/images/1004px-Google__G__Logo.svg.png'),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Sign in with Google',
                            style: subtitle1.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?", style: subtitle2),
                      SizedBox(width: 8.0),
                      Text(
                        "Sign Up",
                        style: subtitle2.copyWith(
                          color: kBlueDeepColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
