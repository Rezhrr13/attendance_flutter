import 'package:attendancce/shared/theme_style.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile'), automaticallyImplyLeading: false),
      body: Container(
        margin: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 16,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Personal');
              },
              child: Card(
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ///ICON
                      const SizedBox(
                        height: 24,
                        width: 24,
                        child: Image(
                          image: AssetImage('assets/ic_personal_data.png'),
                        ),
                      ),

                      ///SPACING
                      const SizedBox(
                        width: 8,
                      ),

                      ///LABEL
                      Text(
                        'Personal Data',
                        style: primaryText.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ),

            ///PARENT DATA
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Parent');
              },
              child: Card(
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ///ICON
                      const SizedBox(
                        height: 24,
                        width: 24,
                        child: Image(
                          image: AssetImage('assets/ic_parent_data.png'),
                        ),
                      ),

                      ///SPACING
                      const SizedBox(
                        width: 8,
                      ),

                      ///LABEL
                      Text(
                        'Parent Data',
                        style: primaryText.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ),

            ///LOGIN ACCOUNT
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/LoginAcc');
            //   },
            //   child: Card(
            //     child: Container(
            //       height: 54,
            //       width: MediaQuery.of(context).size.width,
            //       padding: const EdgeInsets.all(12),
            //       child: Row(
            //         children: [
            //           ///ICON
            //           const SizedBox(
            //             height: 24,
            //             width: 24,
            //             child: Image(
            //               image: AssetImage('assets/ic_login_account.png'),
            //             ),
            //           ),

            //           ///SPACING
            //           const SizedBox(
            //             width: 8,
            //           ),

            //           ///LABEL
            //           Text(
            //             'Login Account',
            //             style: primaryText.copyWith(
            //               fontSize: 16,
            //               fontWeight: medium,
            //             ),
            //             textAlign: TextAlign.left,
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            ///LOGOUT
            GestureDetector(
              onTap: () {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.info,
                  text: 'Do you want to logout?',
                  confirmBtnText: 'Yes',
                  cancelBtnText: 'Cancel',
                  confirmBtnColor: primary,
                  onConfirmBtnTap: () {
                    Navigator.pushNamed(context, '/onboarding');
                  },
                  onCancelBtnTap: () {
                    Navigator.pop(context);
                  },
                  showCancelBtn: true,
                );
              },
              child: Card(
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ///ICON
                      const SizedBox(
                        height: 24,
                        width: 24,
                        child: Image(
                          image: AssetImage('assets/ic_logout.png'),
                        ),
                      ),

                      ///SPACING
                      const SizedBox(
                        width: 8,
                      ),

                      ///LABEL
                      Text(
                        'Logout',
                        style: primaryText.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
