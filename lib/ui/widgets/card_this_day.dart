import 'package:flutter/material.dart';
import 'package:attendancce/shared/theme_style.dart';

class CardThisDay extends StatelessWidget {
  final String title;
  final String time;
  const CardThisDay({Key key, this.title, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
          height: 80,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
            left: 12,
            right: 12,
          ),
          decoration: BoxDecoration(
              color: primaryLighten_5,
              border: Border.all(color: primary, width: 1),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: primaryText.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    time == null ? '-- : --' : time,
                    textAlign: TextAlign.left,
                    style: primaryClrText.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

class CardClockOut extends StatelessWidget {
  final String title;
  final String time;
  const CardClockOut({Key key, this.title, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 12,
          right: 12,
        ),
        decoration: BoxDecoration(
            color: secondaryLighten_5,
            border: Border.all(color: secondary, width: 1),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: primaryText.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  time == null ? '-- : --' : time,
                  textAlign: TextAlign.left,
                  style: secondaryClrText.copyWith(
                    fontSize: 20,
                    fontWeight: semibold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
