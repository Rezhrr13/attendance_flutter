import 'package:attendancce/shared/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimePicker extends StatefulWidget {
  const DatetimePicker({
    Key key,
  }) : super(key: key);

  @override
  State<DatetimePicker> createState() => _DatetimePickerState();
}

class _DatetimePickerState extends State<DatetimePicker> {
  final TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap: () async {
            DateTime pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1999),
                lastDate: DateTime(2025));
            if (pickeddate != null) {
              setState(() {
                _date.text = DateFormat('dd/MM/yyyy').format(pickeddate);
              });
            }
          },
          controller: _date,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            suffixIcon: Icon(
              Icons.calendar_month_outlined,
              color: icPlaceholder,
            ),
            hintText: 'First Date',
            contentPadding: const EdgeInsets.all(12),
          ),
          validator: (String value) {
            if (value.trim().isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class LastDate extends StatefulWidget {
  const LastDate({Key key}) : super(key: key);

  @override
  State<LastDate> createState() => _LastDateState();
}

class _LastDateState extends State<LastDate> {
  final TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap: () async {
            DateTime pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1999),
                lastDate: DateTime(2025));
            if (pickeddate != null) {
              setState(() {
                _date.text = DateFormat('dd/MM/yyyy').format(pickeddate);
              });
            }
          },
          controller: _date,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            suffixIcon: Icon(
              Icons.calendar_month_outlined,
              color: icPlaceholder,
            ),
            hintText: 'Last Date',
            contentPadding: const EdgeInsets.all(12),
          ),
          validator: (String value) {
            if (value.trim().isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class DateofBirth extends StatefulWidget {
  const DateofBirth({Key key}) : super(key: key);

  @override
  State<DateofBirth> createState() => _DateofBirthState();
}

class _DateofBirthState extends State<DateofBirth> {
  final TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of birth',
          style: primaryText.copyWith(
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          onTap: () async {
            DateTime pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2030));
            if (pickeddate != null) {
              setState(() {
                _date.text = DateFormat('dd/MM/yyyy').format(pickeddate);
              });
            }
          },
          controller: _date,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            suffixIcon: Icon(
              Icons.calendar_month_outlined,
              color: icPlaceholder,
            ),
            hintText: 'Pick your birth date',
            contentPadding: const EdgeInsets.all(12),
          ),
          validator: (String value) {
            if (value.trim().isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
