import 'package:flutter/material.dart';
import 'package:attendancce/shared/theme_style.dart';

class PresentAttendance extends StatelessWidget {
  final String subtitle;
  final String count;
  const PresentAttendance({Key key, this.subtitle, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: bgNeutral,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            /// BOX + OUTLINE
            Container(
              height: 56,
              width: 56,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
              decoration: BoxDecoration(
                color: primaryLighten_4,
                shape: BoxShape.circle,
              ),

              /// INPUT
              child: Text(
                count,
                textAlign: TextAlign.center,
                style: primaryClrText.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
              ),
            ),

            ///SPACING
            const SizedBox(
              height: 8,
            ),

            ///SUBTITLE
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: primaryClrText.copyWith(
                fontSize: 12,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SickAttendance extends StatelessWidget {
  final String subtitle;
  final String count;
  const SickAttendance({Key key, this.subtitle, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: bgNeutral,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ///BOX + OUTLINE SICK
            Container(
              height: 56,
              width: 56,
              alignment: Alignment.center,

              margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
              decoration: BoxDecoration(
                color: greenLighten_4,
                shape: BoxShape.circle,
              ),

              ///INPUT
              child: Text(
                count,
                textAlign: TextAlign.center,
                style: successText.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
              ),
            ),

            ///SPACING
            const SizedBox(
              height: 8,
            ),

            ///SUBTITLE
            Text(
              'Sick',
              textAlign: TextAlign.center,
              style: successText.copyWith(
                fontSize: 12,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionAttendance extends StatelessWidget {
  final String title;
  final String count;
  const PermissionAttendance({Key key, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: bgNeutral,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ///BOX + OUTLINE PERMISSION
            Container(
              height: 56,
              width: 56,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
              decoration: BoxDecoration(
                color: yellowLighten_4,
                shape: BoxShape.circle,
              ),

              ///INPUT
              child: Text(
                count,
                textAlign: TextAlign.center,
                style: warningText.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
              ),
            ),

            ///SPACING
            const SizedBox(
              height: 8,
            ),

            ///SUBTITLE
            Text(
              'Permission',
              textAlign: TextAlign.center,
              style: warningText.copyWith(
                fontSize: 12,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class AlphaAttendance extends StatelessWidget {
//   final String subtitle;
//   final String count;
//   const AlphaAttendance({Key key, this.subtitle, this.count}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         width: 90,
//         decoration: BoxDecoration(
//           color: bgNeutral,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           children: [
//             ///BOX + OUTLINE ALPHA
//             Container(
//               height: 56,
//               width: 56,
//               alignment: Alignment.center,
//               padding: const EdgeInsets.all(4),
//               margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
//               decoration: BoxDecoration(
//                 color: redLighten_4,
//                 shape: BoxShape.circle,
//               ),

//               /// OUTLINE
//               child: Text(
//                 count,
//                 textAlign: TextAlign.center,
//                 style: errorText.copyWith(
//                   fontSize: 20,
//                   fontWeight: semibold,
//                 ),
//               ),
//             ),

//             ///SPACIMG
//             const SizedBox(
//               height: 8,
//             ),

//             ///SUBTITLE
//             Text(
//               subtitle,
//               textAlign: TextAlign.center,
//               style: errorText.copyWith(
//                 fontSize: 12,
//                 fontWeight: semibold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
