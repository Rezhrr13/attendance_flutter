import 'package:attendancce/shared/theme_style.dart';
import 'package:flutter/material.dart';

class DefaultForm extends StatelessWidget {
  final String title;
  final String errorcase;
  final String name;
  final bool obsureText;
  final TextEditingController controller;

  const DefaultForm({
    Key key,
    this.title,
    this.name,
    this.errorcase,
    this.obsureText = false,
    this.controller,
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
        TextFormField(
          obscureText: obsureText,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            hintText: name,
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

class FormSuffixIcon extends StatelessWidget {
  final String title;
  final String name;
  final bool obsureText;
  final IconData icon;
  final String errorcase;
  final TextEditingController controller;
  final VoidCallback onTap;

  const FormSuffixIcon({
    Key key,
    this.title,
    this.name,
    this.icon = Icons.visibility,
    this.obsureText = false,
    this.controller,
    this.onTap,
    this.errorcase,
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
        TextFormField(
          onTap: onTap,
          obscureText: obsureText,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            suffixIcon: Icon(
              icon,
              color: icPlaceholder,
            ),
            hintText: name,
            contentPadding: const EdgeInsets.all(12),
          ),
          // validator: ((value) {
          //   if (value!.isEmpty) {
          //     return errorcase;
          //   }
          //   return null;
          // }),
        ),
      ],
    );
  }
}

class TextArea extends StatelessWidget {
  final String title;
  final String name;
  final double height;
  final bool obsureText;
  final String errorcase;
  final TextEditingController controller;

  const TextArea({
    Key key,
    this.title,
    this.name,
    this.height,
    this.obsureText = false,
    this.controller,
    this.errorcase,
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
        TextFormField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: name,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
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
