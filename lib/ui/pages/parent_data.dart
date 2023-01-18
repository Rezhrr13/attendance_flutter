import 'package:attendancce/ui/widgets/inputform_component.dart';
import 'package:flutter/material.dart';

class ParentDate extends StatefulWidget {
  const ParentDate({Key key}) : super(key: key);

  @override
  State<ParentDate> createState() => _ParentDateState();
}

class _ParentDateState extends State<ParentDate> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Data'),
        elevation: 1,
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: const [
              ///PARENT NAME
              DefaultForm(
                title: 'Parent name',
                name: '',
                errorcase: '',
              ),

              ///SPACING
              SizedBox(
                height: 16,
              ),

              ///ADDRESS
              TextArea(
                title: 'Address',
                name: '',
                height: 106,
                errorcase: '',
              ),

              ///SPACING
              SizedBox(
                height: 16,
              ),

              ///PHONE NUMBER
              DefaultForm(
                title: 'Whatsapp number',
                name: '',
                errorcase: '',
              ),

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
