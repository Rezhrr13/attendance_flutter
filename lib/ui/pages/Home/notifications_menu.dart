import 'package:attendancce/ui/widgets/card_reminder.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///APP BAR
      appBar: AppBar(
        title: const Text('Notification'),
        elevation: 1,
      ),
      body:

          ///CONTAINER NOTIFICATION
          Container(
        margin: const EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            ///CARD REMINDER
            CardReminder(
                subtitle:
                    'You havent clock in today, please clock in now. Do’nt forget! have a nice day.',
                date: '17 April 2022'),

            ///SPACING
            SizedBox(
              height: 8,
            ),

            ///CARD REMINDER
            CardReminder(
                subtitle:
                    'You havent clock in today, please clock out now. Do’nt forget! have a nice day.',
                date: '17 April 2022'),
          ],
        ),
      ),
    );
  }
}
