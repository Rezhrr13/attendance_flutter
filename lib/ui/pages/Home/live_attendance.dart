import 'package:attendancce/helpers/firebase_helper.dart';
import 'package:attendancce/ui/widgets/button_component.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendancce/shared/theme_style.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'history_list.dart';
import 'main_page.dart';
import 'package:http/http.dart' as http;

class LiveAttendance extends StatefulWidget {
  const LiveAttendance({Key key}) : super(key: key);

  @override
  State<LiveAttendance> createState() => _LiveAttendanceState();
}

class _LiveAttendanceState extends State<LiveAttendance> {
  File image;
  bool attendance = false;
  List<AttnList> cardList = AttnList.cardList;

  var loginUser = FirebaseAuth.instance.currentUser;

  final auth = FirebaseAuth.instance;

  Service service = Service();

  getCurrentUser() {
    final user = auth.currentUser;
    if (user != null) {
      loginUser = user;
    }
  }

  Future<void> getPreference() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('attendance')) {
      attendance = prefs.getBool('attendance');
    }
  }

  Future getCamera() async {
    final ImagePicker picker = ImagePicker();

    /// Capture a photo
    final XFile camera = await picker.pickImage(source: ImageSource.camera);

    ///image = File(camera.path);

    if (camera != null) {
      setState(() {
        image = File(camera.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Attendance'),
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: InkWell(
                onTap: getCamera,
                child: Container(
                  decoration: BoxDecoration(
                      color: bgDisable,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  child: image != null
                      ? Image.file(
                          image,
                        )
                      : Image.asset(
                          'assets/ic_img_placeholder.png',
                          alignment: Alignment.center,
                        ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 54,
              ),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            DateFormat('Hm').format(
                              DateTime.now(),
                            ),
                            style: whiteText.copyWith(
                              fontWeight: bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        DateFormat('EEEE, dd MMM yy').format(
                          DateTime.now(),
                        ),
                        style: whiteText.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      FutureBuilder(
                        future: getPreference(),
                        builder: (context, snapshot) {
                          return (attendance == false)
                              ? ButtonPrimaryDark(
                                  title: 'Clock In',
                                  width: 290,
                                  onPressed: () async {
                                    //buat predict
                                    var request = http.MultipartRequest(
                                      'POST',
                                      Uri.parse(
                                        'http://192.168.8.149:5000/predict',
                                      ),
                                      // 'http://127.0.0.1:5000'),
                                    );
                                    request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'image', image.path),
                                    );
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
                                          "time",
                                          DateFormat('Hms').format(
                                            DateTime.now(),
                                          ))
                                    ]);

                                    http.StreamedResponse response =
                                        await request.send();
                                    if (response.statusCode == 200) {
                                      print(
                                        await response.stream.bytesToString(),
                                      );
                                      print('berhasil');
                                    } else {
                                      print(response.reasonPhrase);
                                      print('gagal');
                                    }

                                    setState(() {
                                      attendance = true;
                                    });
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    final present = DateFormat('Hm').format(
                                      DateTime.now(),
                                    );
                                    if (prefs.containsKey('present')) {
                                      prefs.clear();
                                    }
                                    if (prefs.containsKey('attendance')) {
                                      prefs.clear();
                                    }

                                    prefs.setString('present', present);
                                    prefs.setBool('attendance', attendance);
                                    cardList.add(
                                      AttnList(
                                        date: DateFormat('dd MMM yyyy').format(
                                          DateTime.now(),
                                        ),
                                        clockoutdate: '-- : --',
                                        clockindate: DateFormat('Hm').format(
                                          DateTime.now(),
                                        ),
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MainPage(),
                                      ),
                                    );
                                  },
                                )
                              :
                              // BUTTON SIGN UP
                              ButtonSecondaryDark(
                                  title: 'Clock Out',
                                  width: 290,
                                  onPressed: () async {
                                    var request = http.MultipartRequest(
                                      'POST',
                                      Uri.parse(
                                          'http://192.168.8.149:5000/clockout'),
                                      // 'http://127.0.0.1:5000'),
                                    );
                                    request.files.add(
                                      await http.MultipartFile.fromPath(
                                          'image', image.path),
                                    );
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
                                          "time",
                                          DateFormat('Hms').format(
                                            DateTime.now(),
                                          ))
                                    ]);
                                    http.StreamedResponse response =
                                        await request.send();
                                    if (response.statusCode == 200) {
                                      print(
                                        await response.stream.bytesToString(),
                                      );
                                      print('berhasil');
                                    } else {
                                      print(response.reasonPhrase);
                                      print('gagal');
                                    }

                                    setState(() {
                                      attendance = false;
                                    });
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    final absent = DateFormat('Hm').format(
                                      DateTime.now(),
                                    );
                                    if (prefs.containsKey('absent')) {
                                      prefs.clear();
                                    }

                                    prefs.setString('absent', absent);
                                    prefs.setBool('attendance', attendance);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const MainPage(),
                                      ),
                                    );
                                  },
                                );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
