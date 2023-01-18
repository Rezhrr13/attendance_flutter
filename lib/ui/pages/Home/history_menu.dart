import 'package:attendancce/shared/theme_style.dart';
import 'package:flutter/material.dart';

import 'history_list.dart';

class HistoryMenu extends StatefulWidget {
  const HistoryMenu({Key key}) : super(key: key);

  @override
  State<HistoryMenu> createState() => _HistoryMenuState();
}

class _HistoryMenuState extends State<HistoryMenu>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          elevation: 1,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TabBar(
                indicatorColor: bgPrimary,
                labelColor: bgPrimary,
                unselectedLabelColor: icDisable,
                labelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'Live Attendance',
                  ),
                  Tab(
                    text: 'Request Attendance',
                  ),
                ],
              ),
              //view tab bar
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    AttendanceMenu(),
                    RequestMenu(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestMenu extends StatelessWidget {
  const RequestMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<HistoryList> cardList = HistoryList.cardList;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ///TANGGAL
                Text(
                  'This history displays the last 7 days',
                  style: primaryClrText.copyWith(
                    fontSize: 14,
                    color: icPlaceholder,
                  ),
                ),
              ],
            ),

            ///SPACING
            const SizedBox(
              height: 12,
            ),

            ///CARD HISTORY
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                ///max 3 card
                itemCount: cardList.length < 7 ? cardList.length : 7,
                itemBuilder: (context, index) {
                  return (cardList[index].clockindate == 'Sick' ||
                          cardList[index].clockindate == 'Permission')
                      ? SPCard(cardList: cardList[index])
                      : ClockCard(cardList: cardList[index]);
                }),

            ///CARD HISTORY
          ],
        ),
      ),
    );
  }
}

class AttendanceMenu extends StatelessWidget {
  const AttendanceMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AttnList> cardList = AttnList.cardList;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ///TANGGAL
                Text(
                  'This history displays the last 7 days',
                  style: primaryClrText.copyWith(
                    fontSize: 14,
                    color: icPlaceholder,
                  ),
                ),
              ],
            ),

            ///SPACING
            const SizedBox(
              height: 12,
            ),

            ///CARD HISTORY

            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,

                ///max 3 card
                itemCount: cardList.length < 7 ? cardList.length : 7,
                itemBuilder: (context, index) {
                  return AttnClockCard(cardList: cardList[index]);
                }),

            ///CARD HISTORY
          ],
        ),
      ),
    );
  }
}

class AttnClockCard extends StatelessWidget {
  const AttnClockCard({Key key, this.cardList}) : super(key: key);

  final AttnList cardList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        // padding: const EdgeInsets.only(
        //   right: 12,
        //   left: 12,
        //   top: 12,
        //   bottom: 12,
        // ),
        decoration: BoxDecoration(
          color: bgNeutral,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///DATE TIME
            SizedBox(
                width: 64,
                child: Text(
                  cardList.date,
                  textAlign: TextAlign.left,
                  style: primaryClrText.copyWith(
                    fontSize: 14,
                    fontWeight: semibold,
                  ),
                )),

            ///SEPARATOR
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                width: 2,
                color: greyLighten_1,
              ),
            ),

            ///SPACING
            const SizedBox(
              width: 12,
            ),

            ///INFORMATION CLOCK IN - CLOCK OUT
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ///CLOCK IN ICON
                SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset('assets/ic_clock_in.png')),
                          ],
                        ),

                        ///SPACING
                        const SizedBox(
                          width: 4,
                        ),

                        ///CONTENT
                        Column(
                          children: [
                            ///TITLE CLOCK IN
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Clock In',
                                  textAlign: TextAlign.left,
                                  style: secondaryText.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),

                            ///SPACING
                            const SizedBox(
                              height: 4,
                            ),

                            ///TIME CLOCK IN
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  cardList.clockindate,
                                  textAlign: TextAlign.left,
                                  style: secondaryText.copyWith(
                                    fontSize: 16,
                                    fontWeight: semibold,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),

                ///SPACING
                const SizedBox(
                  width: 48,
                ),

                ///INFORMATION CLOCK OUT

                SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        ///ICON CLOCKOUT
                        Column(
                          children: [
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset('assets/ic_clock_out.png')),
                          ],
                        ),

                        ///SPACING
                        const SizedBox(
                          width: 4,
                        ),

                        ///CONTENT
                        Column(
                          children: [
                            ///TITLE CLOCK OUT
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Clock Out',
                                  textAlign: TextAlign.left,
                                  style: secondaryText.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),

                            ///SPACING
                            const SizedBox(
                              height: 4,
                            ),

                            ///TIME CLOCK OUT
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  cardList.clockoutdate,
                                  textAlign: TextAlign.left,
                                  style: secondaryText.copyWith(
                                    fontSize: 16,
                                    fontWeight: semibold,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ClockCard extends StatelessWidget {
  const ClockCard({Key key, this.cardList}) : super(key: key);

  final HistoryList cardList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        // padding: const EdgeInsets.only(
        //   right: 12,
        //   left: 12,
        //   top: 12,
        //   bottom: 12,
        // ),
        decoration: BoxDecoration(
          color: bgNeutral,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///DATE TIME
            SizedBox(
                width: 64,
                child: Text(
                  cardList.date,
                  textAlign: TextAlign.left,
                  style: primaryClrText.copyWith(
                    fontSize: 14,
                    fontWeight: semibold,
                  ),
                )),

            ///SEPARATOR
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                width: 2,
                color: greyLighten_1,
              ),
            ),

            ///SPACING
            const SizedBox(
              width: 12,
            ),

            ///INFORMATION CLOCK IN - CLOCK OUT
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                ///CLOCK IN ICON
                SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset('assets/ic_clock_in.png')),
                          ],
                        ),

                        ///SPACING
                        const SizedBox(
                          width: 4,
                        ),

                        ///CONTENT
                        Column(
                          children: [
                            ///TITLE CLOCK IN
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Clock In',
                                  textAlign: TextAlign.left,
                                  style: secondaryText.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),

                            ///SPACING
                            const SizedBox(
                              height: 4,
                            ),

                            ///TIME CLOCK IN
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  cardList.clockindate,
                                  textAlign: TextAlign.left,
                                  style: secondaryText.copyWith(
                                    fontSize: 16,
                                    fontWeight: semibold,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),

                ///SPACING
                const SizedBox(
                  width: 48,
                ),

                ///INFORMATION CLOCK OUT

                SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        ///ICON CLOCKOUT
                        Column(
                          children: [
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset('assets/ic_clock_out.png')),
                          ],
                        ),

                        ///SPACING
                        const SizedBox(
                          width: 4,
                        ),

                        ///CONTENT
                        Column(
                          children: [
                            ///TITLE CLOCK OUT
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Clock Out',
                                  textAlign: TextAlign.left,
                                  style: secondaryText.copyWith(
                                    fontSize: 14,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),

                            ///SPACING
                            const SizedBox(
                              height: 4,
                            ),

                            ///TIME CLOCK OUT
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  cardList.clockoutdate,
                                  textAlign: TextAlign.left,
                                  style: secondaryText.copyWith(
                                    fontSize: 16,
                                    fontWeight: semibold,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SPCard extends StatelessWidget {
  const SPCard({Key key, this.cardList}) : super(key: key);

  final HistoryList cardList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        // padding: const EdgeInsets.only(
        //   right: 12,
        //   left: 12,
        //   top: 12,
        //   bottom: 12,
        // ),
        decoration: BoxDecoration(
          color: bgNeutral,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.,
          children: [
            ///DATE TIME

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    cardList.date,
                    textAlign: TextAlign.left,
                    style: primaryClrText.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    width: 2,
                    color: greyLighten_1,
                  ),
                ),
              ],
            ),

            ///SEPARATOR

            ///INFORMATION CLOCK IN - CLOCK OUT
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///CONTENT
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///TITLE CLOCK IN
                            Text(
                              'Request',
                              textAlign: TextAlign.left,
                              style: secondaryText.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),

                            const SizedBox(
                              height: 6,
                            ),

                            ///TIME CLOCK IN
                            Text(
                              cardList.clockindate,
                              textAlign: TextAlign.left,
                              style: secondaryText.copyWith(
                                fontSize: 16,
                                fontWeight: semibold,
                              ),
                            )
                          ],
                        ),

                        ///TIME CLOCK OUT
                        Text(
                          cardList.clockoutdate,
                          textAlign: TextAlign.left,
                          style: secondaryText.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
