import 'package:attendancce/helpers/firebase_helper.dart';
import 'package:attendancce/shared/theme_style.dart';
import 'package:attendancce/ui/widgets/button_component.dart';
import 'package:attendancce/ui/widgets/inputform_component.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Service service = Service();
  bool isLoading = false;

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
              DefaultForm(
                title: 'Username',
                errorcase: 'Username has not been filled',
                name: 'Input username',
                controller: emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              //INPUT FORM PASSWORD
              DefaultForm(
                title: 'Password',
                obsureText: true,
                errorcase: 'Password has not been filled',
                name: 'Input password',
                controller: passwordController,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      service.loginUser(
                        context,
                        emailController.text,
                        passwordController.text,
                      );
                      pref.setString("email", emailController.text);
                      // Navigator.pushReplacementNamed(context, '/Nav');
                    } else {
                      service.errorBox(
                        context,
                        "Email dan password tidak boleh kosong",
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                  style: TextButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              //BUTTON SIGN IN
              // ButtonPrimaryClr(
              //   title: 'Sign In',
              //   onPressed: () async {},
              // ),
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
