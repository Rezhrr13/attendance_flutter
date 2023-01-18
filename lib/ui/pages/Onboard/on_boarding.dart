import 'package:attendancce/shared/theme_style.dart';
import 'package:attendancce/ui/widgets/button_component.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 253,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/il_onboarding.png',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(
                left: 24,
                top: 32,
                right: 24,
                bottom: 29,
              ),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome to Attendance Apps',
                          textAlign: TextAlign.left,
                          style: whiteText.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Please choose how to enter the application and enjoy the apps ',
                      textAlign: TextAlign.left,
                      style: baseText.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),

                    const SizedBox(
                      height: 32,
                    ),

                    // BUTTON SIGN IN
                    ButtonPrimaryDark(
                      title: 'Sign In',
                      onPressed: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                    ),

                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Dont havent an account? ',
                          style: secondaryText.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                            color: icDisable,
                          ),
                        ),
                        Text(
                          'Contact your admin',
                          style: secondaryText.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                            color: bgWhite,
                          ),
                        ),
                      ],
                    )

                    // const SizedBox(
                    //   height: 24,
                    // ),

                    // BUTTON SIGN UP
                    // ButtonSecondaryDark(
                    //   title: 'Register',
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, '/register');
                    //   },
                    // ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
