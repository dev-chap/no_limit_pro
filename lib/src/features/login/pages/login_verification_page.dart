import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:no_limit_pro/src/features/registration/pages/pages.dart';
import 'package:no_limit_pro/src/theme/app_colors.dart';
import 'package:no_limit_pro/src/widgets/button/button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

class LoginVerificationPage extends StatefulWidget {
  const LoginVerificationPage({super.key});

  @override
  State<LoginVerificationPage> createState() => _LoginVerificationPageState();
}

class _LoginVerificationPageState extends State<LoginVerificationPage> {
  final OtpFieldController code = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Transform.translate(
                offset: Offset(-10.w, -5.w),
                child: Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Vérifier le code de validation",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(8.w),
                  OTPTextField(
                    keyboardType: TextInputType.number,
                    controller: code,
                    length: 4,
                    fieldWidth: 15.w,
                    outlineBorderRadius: 0,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: appColor,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 6.w, horizontal: 4.w),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onChanged: (pin) {},
                    onCompleted: (pin) {
                      //codePin = pin;
                    },
                  ),
                  Gap(8.w),
                  SubmitButton("VERIFIER", onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationCongratulationPage(),
                      ),
                    );
                  }),
                  Gap(8.w),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "Aucun code reçu ?",
                        ),
                        TextSpan(
                          text: " Demandez à nouveau",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
