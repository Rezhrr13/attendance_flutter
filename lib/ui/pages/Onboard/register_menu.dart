import 'package:attendancce/ui/widgets/datetimepicker_component.dart';
import 'package:attendancce/ui/widgets/inputform_component.dart';
import 'package:attendancce/ui/widgets/button_component.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:attendancce/shared/theme_style.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File image;

  Future getGalery() async {
    final ImagePicker picker = ImagePicker();

    /// Pick an image
    final XFile galerry = await picker.pickImage(source: ImageSource.gallery);

    ///image = File(galerry!.path);

    if (galerry != null) {
      setState(() {
        image = File(galerry.path);
      });
    }
  }

  Future getCamera() async {
    final ImagePicker picker = ImagePicker();

    /// Capture a photo
    final XFile camera = await picker.pickImage(source: ImageSource.camera);

    ///image = File(camera.path);

    if (camera != null) {
      setState(() {
        image = File(camera.path);
      });
    }
  }

  int activeIndex = 0;
  int totalIndex = 4;
  bool goNext = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (activeIndex != 0) {
          activeIndex--;
          setState(() {});
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: bodyBuilder(),
      ),
    );
  }

  Widget bodyBuilder() {
    switch (activeIndex) {
      case 0:
        return enterPersonalData();
      case 1:
        return enterParentData();
      case 2:
        return enterAccountData();
      case 3:
        return uploadImage();

      default:
        return enterPersonalData();
    }
  }

  Widget enterPersonalData() {
    return Form(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 16,
          ),

          ///STEPPER
          DotStepper(
            dotCount: totalIndex,
            activeStep: activeIndex,
            dotRadius: 6,
            shape: Shape.circle,
            spacing: 8,
            indicator: Indicator.shift,
            onDotTapped: (tappedDotIndex) {
              setState(() {
                activeIndex = tappedDotIndex;
              });
            },
            fixedDotDecoration: FixedDotDecoration(
                color: icDisable, strokeColor: icPlaceholder),
            indicatorDecoration: IndicatorDecoration(
              color: icPrimary,
              strokeColor: icPrimary,
            ),
            lineConnectorDecoration: LineConnectorDecoration(
              color: icPrimary,
              strokeWidth: 0,
            ),
          ),

          ///SPACING
          const SizedBox(
            height: 24,
          ),

          ///SUBTITLE
          Text(
            'Enter your personal information',
            style: primaryText.copyWith(
              fontSize: 18,
              fontWeight: semibold,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 8,
          ),

          ///SUBHEADING
          Text(
            'Please enter your personal information with actual data',
            style: secondaryText.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
            textAlign: TextAlign.left,
          ),

          ///SPACING
          const SizedBox(
            height: 24,
          ),

          ///INPUT FORM FULL NAME
          const DefaultForm(
            title: 'Full name',
            name: 'Input fullname',
            errorcase: 'You must fill fullname',
          ),

          ///SPACING
          const SizedBox(
            height: 24,
          ),

          ///DATE OF BIRTH
          const DateofBirth(),

          ///SPACING
          const SizedBox(
            height: 24,
          ),

          ///ADDRESS
          const TextArea(
            title: 'Address',
            name: 'Input your address',
            height: 106,
            errorcase: 'Your address min. 15 Caracter',
          ),

          ///SPACING
          const SizedBox(
            height: 24,
          ),

          ///PHONE NUMBER
          const DefaultForm(
            title: 'Phone Number',
            name: 'Input phone number',
            errorcase: 'Your phone number not valid',
          ),

          ///SPACINg
          const SizedBox(
            height: 32,
          ),

          ///BUTTON
          const ButtonPrimaryClr(
            title: 'Next',
          ),

          ///SPACING
          const SizedBox(
            height: 24,
          ),

          ///DONT HAVE AN ACCOUNT
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Already have an account? ',
                style: secondaryText.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              ButtonTextOnly(
                width: 80,
                height: 40,
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget enterParentData() {
    return Form(
      child: ListView(padding: const EdgeInsets.all(16), children: [
        const SizedBox(
          height: 16,
        ),
        DotStepper(
          dotCount: totalIndex,
          activeStep: activeIndex,
          dotRadius: 6,
          shape: Shape.circle,
          spacing: 8,
          indicator: Indicator.shift,
          onDotTapped: (tappedDotIndex) {
            setState(() {
              activeIndex = tappedDotIndex;
            });
          },
          fixedDotDecoration:
              FixedDotDecoration(color: icDisable, strokeColor: icPlaceholder),
          indicatorDecoration: IndicatorDecoration(
            color: icPrimary,
            strokeColor: icPrimary,
          ),
          lineConnectorDecoration: LineConnectorDecoration(
            color: icPrimary,
            strokeWidth: 0,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Enter your parent information',
          style: primaryText.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Please enter your parent information with actual data',
          style: secondaryText.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 24,
        ),
        const DefaultForm(
          title: 'Parent name',
          name: 'Input parent name',
          errorcase: 'You must fill parent name',
        ),
        const SizedBox(
          height: 24,
        ),
        const TextArea(
          title: 'Address',
          name: 'Input parent address',
          height: 106,
          errorcase: 'Your address min. 15 Character',
        ),
        const SizedBox(
          height: 24,
        ),
        const DefaultForm(
          title: 'Whatsapp Number',
          name: 'Input parent whatsapp number',
          errorcase: 'Your whatsapp number not valid',
        ),
        const SizedBox(
          height: 32,
        ),
        const ButtonPrimaryClr(
          title: 'Next',
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account? ',
              style: secondaryText.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            ButtonTextOnly(
              width: 80,
              height: 40,
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
            )
          ],
        )
      ]),
    );
  }

  Widget enterAccountData() {
    return Form(
      child: ListView(padding: const EdgeInsets.all(16), children: [
        const SizedBox(
          height: 16,
        ),
        DotStepper(
          dotCount: totalIndex,
          activeStep: activeIndex,
          dotRadius: 6,
          shape: Shape.circle,
          spacing: 8,
          indicator: Indicator.shift,
          onDotTapped: (tappedDotIndex) {
            setState(() {
              activeIndex = tappedDotIndex;
            });
          },
          fixedDotDecoration:
              FixedDotDecoration(color: icDisable, strokeColor: icPlaceholder),
          indicatorDecoration: IndicatorDecoration(
            color: icPrimary,
            strokeColor: icPrimary,
          ),
          lineConnectorDecoration: LineConnectorDecoration(
            color: icPrimary,
            strokeWidth: 0,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Create your login account',
          style: primaryText.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Username data cannot be changed later, please remember your login account',
          style: secondaryText.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 24,
        ),
        const DefaultForm(
          title: 'Username',
          name: 'Create username',
          errorcase: 'Username cannot be changed later',
        ),
        const SizedBox(
          height: 24,
        ),
        const FormSuffixIcon(
          title: 'Password',
          name: 'Create Password',
          errorcase: 'Min. 8 Character',
          icon: Icons.visibility,
          obsureText: true,
        ),
        const SizedBox(
          height: 24,
        ),
        const FormSuffixIcon(
          title: 'Retype Password',
          name: 'Retype Password',
          errorcase: 'Your password doesnt match',
          icon: Icons.visibility,
          obsureText: true,
        ),
        const SizedBox(
          height: 32,
        ),
        const ButtonPrimaryClr(
          title: 'Next',
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account? ',
              style: secondaryText.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            ButtonTextOnly(
              width: 80,
              height: 40,
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
            )
          ],
        )
      ]),
    );
  }

  Widget uploadImage() {
    return Form(
      child: ListView(padding: const EdgeInsets.all(16), children: [
        const SizedBox(
          height: 16,
        ),
        DotStepper(
          dotCount: totalIndex,
          activeStep: activeIndex,
          dotRadius: 6,
          shape: Shape.circle,
          spacing: 8,
          indicator: Indicator.shift,
          onDotTapped: (tappedDotIndex) {
            setState(() {
              activeIndex = tappedDotIndex;
            });
          },
          fixedDotDecoration:
              FixedDotDecoration(color: icDisable, strokeColor: icPlaceholder),
          indicatorDecoration: IndicatorDecoration(
            color: icPrimary,
            strokeColor: icPrimary,
          ),
          lineConnectorDecoration: LineConnectorDecoration(
            color: icPrimary,
            strokeWidth: 0,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          'Upload your photo',
          style: primaryText.copyWith(
            fontSize: 18,
            fontWeight: semibold,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'This data is used for attendance purposes, do it clearly and correctly.',
          style: secondaryText.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
          children: [
            InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 120,
                        margin: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Choose your upload method',
                                  style: primaryClrText.copyWith(
                                    fontWeight: semibold,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    getCamera();
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Icon(
                                          Icons.photo_camera,
                                          color: icPlaceholder,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        'Camera',
                                        style: primaryText.copyWith(
                                          fontWeight: medium,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    getGalery();
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Icon(
                                          Icons.photo_library,
                                          color: icPlaceholder,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        'Galery',
                                        style: primaryText.copyWith(
                                          fontWeight: medium,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: DottedBorder(
                  color: greyDarken_1,
                  strokeWidth: 2,
                  dashPattern: const [8, 8],
                  borderType: BorderType.Rect,
                  radius: const Radius.circular(8),
                  child: Container(
                      height: 328,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: bgDisable,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          image != null
                              ? SizedBox(
                                  height: 328,
                                  width: double.maxFinite,
                                  child: Image.file(
                                    image,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/ic_upload.png',
                                  ),
                                ),
                        ],
                      )),
                )),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        ButtonPrimaryClr(
          title: 'Submit',
          onPressed: () {
            Navigator.pushNamed(context, '/Nav');
          },
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account? ',
              style: secondaryText.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            ButtonTextOnly(
              width: 80,
              height: 40,
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
            )
          ],
        )
      ]),
    );
  }
}
