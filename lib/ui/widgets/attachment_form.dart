import 'package:attendancce/shared/theme_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AttachmentComponent extends StatefulWidget {
  const AttachmentComponent({Key key}) : super(key: key);

  @override
  State<AttachmentComponent> createState() => _AttachmentComponentState();
}

class _AttachmentComponentState extends State<AttachmentComponent> {
  TextEditingController attachment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Attachment',
              style: primaryText.copyWith(
                fontWeight: medium,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          onTap: () async {
            FilePickerResult picked = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png', 'pdf']);

            if (picked != null) {
              PlatformFile file = picked.files.first;

              attachment.text = file.name;
            } else {}
          },
          controller: attachment,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            suffixIcon: Icon(
              Icons.attach_file,
              color: icPlaceholder,
            ),
            hintText: 'Select file request',
            contentPadding: const EdgeInsets.all(12),
          ),
          validator: (String value) {
            if (value.trim().isEmpty) {
              return 'Required';
            }
            return null;
          },
        )
      ],
    );
  }
}
