import 'package:flutter/material.dart';
import 'package:attendancce/shared/theme_style.dart';

class CardReminder extends StatelessWidget {
  final String subtitle;
  final String date;

  const CardReminder({Key key, this.subtitle, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 84,
        padding: const EdgeInsets.only(
          right: 12,
          left: 12,
          top: 12,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          color: bgNeutral,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                ///TITLE
                Text(
                  'Reminder',
                  textAlign: TextAlign.left,
                  style: primaryClrText.copyWith(
                    fontSize: 12,
                    fontWeight: semibold,
                  ),
                ),

                ///DATE TIME
                Text(
                  date,
                  textAlign: TextAlign.left,
                  style: tertiaryText.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                )
              ],
            ),

            ///SPACING
            const SizedBox(
              height: 8,
            ),

            ///SUBTITLE
            Text(
              subtitle,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: secondaryText.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
