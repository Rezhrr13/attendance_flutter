import 'package:attendancce/ui/widgets/card_attendance.dart';
import 'package:attendancce/ui/widgets/card_this_day.dart';
import 'package:flutter/material.dart';
import 'package:attendancce/shared/theme_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'history_list.dart';
import 'history_menu.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String present;
  String absent;
  int sick;
  int permission;

  Future<void> getPreference() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('present')) {
      present = prefs.getString('present');
    }
    if (prefs.containsKey('absent')) {
      absent = prefs.getString('absent');
    }
    if (prefs.containsKey('sick')) {
      sick = prefs.getInt('sick');
    }
    if (prefs.containsKey('permission')) {
      permission = prefs.getInt('permission');
    }
  }

  List<AttnList> cardList = AttnList.cardList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

          ///SCROLL VIEW
          SingleChildScrollView(
              child: SafeArea(
                  child: Column(
        children: [
          /// BACKGROUND HEADER
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 210,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 32,
                  bottom: 48,
                ),
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    )),

                /// HEADER
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Welcome Back!',
                          textAlign: TextAlign.left,
                          style: whiteText.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: (() {}),
                        //   icon: Image.asset('assets/ic_notification.png'),
                        //   iconSize: 3,
                        //   splashColor: greyDarken_3,
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Your name',
                          textAlign: TextAlign.left,
                          style: whiteText.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ) //Text
                      ],
                    ), //Row
                  ],
                ), //Colum
              ), //Container

              Positioned(
                  top: 140,
                  left: 0,
                  right: 0,
                  bottom: -55,
                  child: Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: bgNeutral,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: greyDarken_3.withOpacity(0.15),
                            blurRadius: 25,
                            blurStyle: BlurStyle.outer,
                          ) //BoxShadow
                        ] // Box Shadow
                        ), //BoxDecoration
                    child: Container(
                      height: 78,
                      width: 78,
                      padding: const EdgeInsets.only(
                        right: 12,
                        left: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                ///LIVE ATTENDANCE
                                InkWell(
                                  splashColor: greyDarken_3,
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(
                                      left: 24,
                                      right: 24,
                                      bottom: 8,
                                      top: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: primaryLighten_4, width: 1),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/LiveAttendance');
                                      },
                                      icon: Image.asset('assets/ic_maps.png'),
                                      splashColor: greyDarken_3,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Live Attendance',
                                  textAlign: TextAlign.center,
                                  style: secondaryText.copyWith(
                                    fontSize: 12,
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ///REQUEST ATTENDANCE
                                InkWell(
                                  splashColor: greyDarken_3,
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(
                                      left: 12,
                                      right: 12,
                                      bottom: 8,
                                      top: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: primaryLighten_4, width: 1),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/reqAttendance');
                                      },
                                      icon: Image.asset(
                                          'assets/ic_request_attendance.png'),
                                      splashColor: greyDarken_3,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),

                                Text(
                                  'Request Attendance',
                                  textAlign: TextAlign.center,
                                  style: secondaryText.copyWith(
                                    fontSize: 12,
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ///HISTORY
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/history');
                                  },
                                  splashColor: greyDarken_3,
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(
                                      left: 12,
                                      right: 12,
                                      bottom: 8,
                                      top: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: primaryLighten_4, width: 1),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/history');
                                      },
                                      icon:
                                          Image.asset('assets/ic_history.png'),
                                      splashColor: greyDarken_3,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'History',
                                  textAlign: TextAlign.center,
                                  style: secondaryText.copyWith(
                                    fontSize: 12,
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ) //Container
                  ) //Positioned
            ], //Children
          ), //Stack
          /// INFORMATION THIS DAY
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 80,
              bottom: 84,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'This day',
                      textAlign: TextAlign.left,
                      style: primaryClrText.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ],
                ),

                ///SPACING
                const SizedBox(
                  height: 12,
                ),

                /// CARD INFORMATION THIS DAY

                FutureBuilder(
                    future: getPreference(),
                    builder: (context, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///CARD CLOCK IN
                          CardThisDay(title: 'Clock In', time: present),

                          /// SPACING
                          const SizedBox(
                            width: 12,
                          ),

                          ///CARD CLOCK OUT
                          CardClockOut(title: 'Clock Out', time: absent)
                        ],
                      );
                    }),

                ///SPACING
                const SizedBox(
                  height: 24,
                ),

                ///Attendance this month
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Attendance this month',
                          textAlign: TextAlign.left,
                          style: primaryClrText.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    //CARD PRESENT
                    SizedBox(
                        height: 116,
                        child: FutureBuilder(
                            future: getPreference(),
                            builder: (context, _) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //PRESENT
                                  const Expanded(
                                    child: PresentAttendance(
                                        subtitle: 'Present', count: '12'),
                                  ),

                                  ///CARD SICK
                                  Expanded(
                                    child: SickAttendance(
                                        subtitle: 'Sick',
                                        count: sick == null
                                            ? '0'
                                            : sick.toString()),
                                  ),

                                  ///CARD PERMISSION
                                  Expanded(
                                    child: PermissionAttendance(
                                        title: 'Permission',
                                        count: permission == null
                                            ? '0'
                                            : permission.toString()),
                                  ),

                                  ///ALPHA
                                  // AlphaAttendance(
                                  //     subtitle: 'Alpha',
                                  //     count: alpha == null
                                  //         ? '0'
                                  //         : alpha.toString())
                                ],
                              );
                            })),

                    ///SPACING
                    const SizedBox(
                      height: 24,
                    ),

                    ///HISTORY
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'History',
                          textAlign: TextAlign.left,
                          style: primaryClrText.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        )
                      ],
                    ),

                    ///SPACING
                    const SizedBox(
                      height: 12,
                    ),

                    ///CARD HISTORY
                    SizedBox(
                      child: Column(
                        children: [
                          ///CARD HISTORY
                          ///loop
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,

                              ///max 3 card
                              itemCount:
                                  cardList.length < 3 ? cardList.length : 3,
                              itemBuilder: (context, index) {
                                return AttnClockCard(cardList: cardList[index]);
                              }),
                        ],
                      ),
                    ),
                  ],
                )
              ], //Children
            ), //Column
          ),
        ], //Children
      ) //Singlechildscroll
                  ) //SafeArea
              ),
    );
  }
}
