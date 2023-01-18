import 'package:attendancce/shared/theme_style.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';

class DropDownComponent extends StatelessWidget {
  final String title;
  final void Function(String) onChanged;

  DropDownComponent({
    Key key,
    this.title,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: primaryText.copyWith(
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownSearch(
          items: const [
            'Sick',
            'Permission',
            'Request Clock In',
            'Request Clock Out'
          ],
          dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: primaryText.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
              dropdownSearchDecoration: InputDecoration(
                hintText: 'Select your request',
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              )),
          onChanged: onChanged,
          validator: (value) => value == null ? 'field required' : null,
        ),
      ],
    );
  }
}

// class DropdownField extends StatelessWidget {
//   final SingleValueDropDownController cnt;
//   final String title;
//   final String name;

//   const DropdownField({
//     Key key,
//     this.cnt,
//     this.title,
//     this.name,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           title,
//           style: primaryText.copyWith(
//             fontWeight: medium,
//           ),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         DropDownTextField(
//             controller: cnt,
//             onChanged: (value) {},
//             searchDecoration: const InputDecoration(
//               hintText: "Select your request",
//             ),
//             listSpace: 4,
//             listTextStyle: primaryText.copyWith(
//               fontWeight: regular,
//             ),
//             validator: ((value) {
//               if (value == null) {
//                 return "Required field";
//               } else {
//                 return null;
//               }
//             }),
//             dropDownList: const [
//               DropDownValueModel(name: 'Sick', value: 'Sick'),
//               DropDownValueModel(name: 'Permission', value: 'Permission'),
//               DropDownValueModel(name: 'Clock Out', value: 'Clock Out'),
//               DropDownValueModel(name: 'Clock In', value: 'Clock In'),
//             ]),
//       ],
//     );
//   }
// }
