import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/sign_up_prov.dart';
import '../../utils/constants.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signUpProv = Provider.of<SignUpProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 35.0),
        child: SingleChildScrollView(
          child: Form(
            key: signUpProv.formKey,
            autovalidate: signUpProv.autoValidation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Welcome Back',
                  style: headline1,
                ),
                Text(
                  'Hello there, login to see stories from around the world',
                  style: subtitle1,
                ),
                SizedBox(height: 50.0),
                Text('Full name', style: subtitle2),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: kBlueDeepColor,
                        width: 1.0,
                      ),
                    ),
                    hintText: 'Enter your full name',
                    hintStyle: subtitle1,
                    suffixIcon: signUpProv.fullNameComplete
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              radius: 2.0,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 12.0,
                              ),
                            ),
                          )
                        : null,
                  ),
                  onChanged: (val) => signUpProv.onSavedFullName(val),
                  validator: signUpProv.validateFullName,
                ),
                SizedBox(height: 20.0),
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
                    suffixIcon: signUpProv.emailComplete
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              radius: 2.0,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 12.0,
                              ),
                            ),
                          )
                        : null,
                  ),
                  onChanged: (val) => signUpProv.onSavedEmail(val),
                  validator: signUpProv.validateEmail,
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
                    suffixIcon: signUpProv.passwordComplete
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              radius: 2.0,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 12.0,
                              ),
                            ),
                          )
                        : null,
                  ),
                  onChanged: (val) => signUpProv.onSavedPassword(val),
                  validator: signUpProv.validatePassword,
                ),
                SizedBox(height: 20.0),
                Text(
                  'By creating an account you aggree to our',
                  style: subtitle2,
                ),
                SizedBox(height: 5.0),
                GestureDetector(
                  onTap: () {
                    // TODO: Navigate term and conditions page
                  },
                  child: Text(
                    'Term and Conditions',
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
                    onPressed: () {
                      if (signUpProv.formKey.currentState.validate()) {
                        signUpProv.formKey.currentState.save();
                        signUpProv.autoValidation = false;

                        ///[Authentication] user if successfully return Home Page
                      } else {
                        signUpProv.autoValidation = true;
                      }
                    },
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
                            'Continue with Google',
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
                      Text("Already have an account?", style: subtitle2),
                      SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Sign In",
                          style: subtitle2.copyWith(
                            color: kBlueDeepColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
