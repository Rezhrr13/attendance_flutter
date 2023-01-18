import 'package:flutter/material.dart';
import 'package:attendancce/shared/theme_style.dart';

class HistoryCard extends StatelessWidget {
  final String date;
  final String clockindate;
  final String clockoutdate;
  const HistoryCard({Key key, this.date, this.clockindate, this.clockoutdate})
      : super(key: key);

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
                  date,
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
                                  clockindate,
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
                                  clockoutdate,
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
