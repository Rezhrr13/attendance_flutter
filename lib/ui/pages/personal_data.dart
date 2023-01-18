import 'package:attendancce/ui/widgets/datetimepicker_component.dart';
import 'package:attendancce/ui/widgets/inputform_component.dart';
import 'package:flutter/material.dart';

class Personaldata extends StatefulWidget {
  const Personaldata({Key key}) : super(key: key);

  @override
  State<Personaldata> createState() => _PersonaldataState();
}

class _PersonaldataState extends State<Personaldata> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Data'),
        elevation: 1,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: const [
              ///FULLNAME
              DefaultForm(
                title: 'Full name',
                name: '',
                errorcase: 'errorcase',
              ),

              ///SPACING
              SizedBox(
                height: 16,
              ),

              ///BORN DATE
              DateofBirth(),

              ///SPACING
              SizedBox(
                height: 16,
              ),

              ///ADDRESS
              TextArea(
                title: 'Address',
                name: '',
                height: 106,
                errorcase: 'errorcase',
              ),

              ///SPACING
              SizedBox(
                height: 16,
              ),

              ///NO TELP
              ///SPACING
              SizedBox(
                height: 32,
              ),

              ///BUTTON
              // ButtonPrimaryClr(
              //   onPressed: () {
              //     if (!_formKey.currentState.validate()) {
              //       return;
              //     }
              //   },
              //   title: 'Edit',
              // )
            ],
          ),
        ),
      ),
    );
  }
}
