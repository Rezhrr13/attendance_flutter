import 'package:attendancce/shared/theme_style.dart';
import 'package:attendancce/ui/widgets/button_component.dart';
import 'package:attendancce/ui/widgets/inputform_component.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 28,
          horizontal: 16,
        ),
        alignment: Alignment.centerLeft,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome to Attendance Apps',
                    textAlign: TextAlign.left,
                    style: primaryText.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Please enter your username and password',
                    style: secondaryText.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),
              //INPUT FORM USERNAME
              const DefaultForm(
                title: 'Username',
                errorcase: 'Username has not been filled',
                name: 'Input username',
              ),
              const SizedBox(
                height: 16,
              ),
              //INPUT FORM PASSWORD
              const DefaultForm(
                title: 'Password',
                obsureText: true,
                errorcase: 'Password has not been filled',
                name: 'Input password',
              ),
              const SizedBox(
                height: 32,
              ),
              //BUTTON SIGN IN
              ButtonPrimaryClr(
                title: 'Sign In',
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  Navigator.pushNamed(context, '/Nav');
                },
              ),
              const SizedBox(
                height: 24,
              ),

              ///BUTTON BLM PUNYA ACCOUNT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dont havent an account? ',
                    style: secondaryText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Contact your admin',
                    style: secondaryText.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                      color: primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
