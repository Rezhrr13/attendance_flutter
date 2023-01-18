import 'package:attendancce/ui/widgets/button_component.dart';
import 'package:attendancce/ui/widgets/inputform_component.dart';
import 'package:flutter/material.dart';

class LoginAccount extends StatelessWidget {
  const LoginAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login account'),
        elevation: 1,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: const [
            ///USERNAME
            DefaultForm(
              title: 'Username',
              name: '',
              errorcase: '',
            ),

            ///SPACING
            SizedBox(
              height: 16,
            ),

            ///PASSWORD
            FormSuffixIcon(
              title: 'Password',
              name: '',
              errorcase: '',
              icon: Icons.visibility,
            ),

            ///SPACING
            SizedBox(
              height: 32,
            ),

            ///BUTTON
            ButtonPrimaryClr(title: 'Edit')
          ],
        ),
      ),
    );
  }
}
