import 'package:attendancce/shared/theme_style.dart';
import 'package:attendancce/ui/widgets/attachment_form.dart';
import 'package:attendancce/ui/widgets/button_component.dart';
import 'package:attendancce/ui/widgets/datetimepicker_component.dart';
import 'package:attendancce/ui/widgets/dropdown_component.dart';
import 'package:attendancce/ui/widgets/inputform_component.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'history_list.dart';
import 'package:http/http.dart' as http;

var loginUser = FirebaseAuth.instance.currentUser;

class RequestAttendance extends StatefulWidget {
  const RequestAttendance({Key key}) : super(key: key);

  @override
  State<RequestAttendance> createState() => _RequestAttendanceState();
}

class _RequestAttendanceState extends State<RequestAttendance> {
  int sick = 0;
  int permission = 0;

  List<HistoryList> cardList = HistoryList.cardList;
  List<HistoryList> cardList2 = HistoryList.cardList2;

  Future<void> getPreference() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('sick')) {
      sick = prefs.getInt('sick');
    }
    if (prefs.containsKey('permission')) {
      permission = prefs.getInt('permission');
    }
  }

  String attendanceController;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Request Attendance'),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Enter your request attendance with responbility',
                      style: secondaryText.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),

                ///SPACING
                const SizedBox(
                  height: 24,
                ),

                ///DATE TIME SELECT
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Request Date',
                          style: primaryText.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(children: const [
                      Expanded(child: DatetimePicker()),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(child: LastDate()),
                    ]),
                  ],
                ),

                ///SPACING
                const SizedBox(
                  height: 16,
                ),

                ///DROPDOWN SELECT

                DropDownComponent(
                  title: 'Request Attendance',
                  onChanged: (value) {
                    setState(() {
                      attendanceController = value;
                    });
                  },
                ),

                ///SPACING
                const SizedBox(
                  height: 16,
                ),

                ///ATTACH FILE
                const AttachmentComponent(),

                ///SPACING
                const SizedBox(
                  height: 16,
                ),

                ///NOTES - TEXT AREA

                const TextArea(
                    title: 'Notes',
                    name: 'Fill your reason',
                    height: 40,
                    errorcase: 'Required form'),

                ///SPACING
                const SizedBox(
                  height: 16,
                ),

                ///SPACING
                const SizedBox(
                  height: 32,
                ),

                ///BUTTON REQUEST
                FutureBuilder(
                    future: getPreference(),
                    builder: (context, _) {
                      return ButtonPrimaryClr(
                        title: 'Request',
                        onPressed: () async {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          var request = http.MultipartRequest(
                            'POST',
                            Uri.parse(
                              'http://192.168.8.149:5000/request',
                            ),
                            // 'http://127.0.0.1:5000'),
                          );

                          // request.files.add(
                          //   await http.MultipartFile.fromPath('attachment', ''),
                          // );

                          request.fields.addEntries(
                            [
                              MapEntry(
                                "user_id",
                                loginUser.email.toString().substring(
                                    loginUser.email.indexOf('_') + 1,
                                    loginUser.email.indexOf("@")),
                              ),
                            ],
                          );

                          request.fields.addEntries([
                            MapEntry(
                                "request_attendance_date",
                                DateFormat('Hms').format(
                                  DateTime.now(),
                                ))
                          ]);

                          request.fields.addEntries(
                            [MapEntry("request_type_id", 1.toString())],
                          );

                          request.fields.addEntries(
                            [MapEntry("notes", "sick")],
                          );

                          http.StreamedResponse response = await request.send();

                          if (response.statusCode == 200) {
                            print(
                              await response.stream.bytesToString(),
                            );
                            print('berhasil');
                          } else {
                            print(response.reasonPhrase);
                            print('gagal');
                          }

                          final prefs = await SharedPreferences.getInstance();
                          if (attendanceController == 'Sick') {
                            sick = sick + 1;
                            prefs.setInt('sick', sick);
                            cardList.add(
                              HistoryList(
                                date: DateFormat('dd MMM\nyyyy').format(
                                  DateTime.now(),
                                ),
                                clockindate: 'Sick',
                                clockoutdate: DateFormat('Hm').format(
                                  DateTime.now(),
                                ),
                              ),
                            );
                          } else if (attendanceController == 'Permission') {
                            permission += 1;
                            prefs.setInt('permission', permission);
                            cardList.add(
                              HistoryList(
                                date: DateFormat('dd MMM\nyyyy').format(
                                  DateTime.now(),
                                ),
                                clockindate: 'Permission',
                                clockoutdate: DateFormat('Hm').format(
                                  DateTime.now(),
                                ),
                              ),
                            );
                          } else if (attendanceController ==
                              'Request Clock In') {
                            cardList.add(
                              HistoryList(
                                date: DateFormat('dd MMM yyyy').format(
                                  DateTime.now(),
                                ),
                                clockindate: DateFormat('Hm').format(
                                  DateTime.now(),
                                ),
                                clockoutdate: '-- : --',
                              ),
                            );
                          } else if (attendanceController ==
                              'Request Clock Out') {
                            cardList.add(
                              HistoryList(
                                date: DateFormat('dd MMM yyyy').format(
                                  DateTime.now(),
                                ),
                                clockindate: '-- : --',
                                clockoutdate: DateFormat('Hm').format(
                                  DateTime.now(),
                                ),
                              ),
                            );
                          }

                          Navigator.pushNamed(context, '/Nav');
                        },
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
