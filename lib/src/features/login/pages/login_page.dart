import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:no_limit_pro/src/features/login/login.dart';
import 'package:no_limit_pro/src/theme/app_colors.dart';
import 'package:no_limit_pro/src/widgets/button/button.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController telephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Saisissez votre numéro de téléphone",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(8.w),
                  Container(
                    padding: EdgeInsets.only(left: 4.w),
                    decoration: BoxDecoration(
                      color: appBlanc,
                      borderRadius: BorderRadius.circular(3.w),
                      border: Border.all(color: appGrey),
                    ),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        //phoneInicator = number.phoneNumber!;
                      },
                      onInputValidated: (bool value) {},
                      errorMessage: "Le numéro est invalide",
                      hintText: "Numéro de téléphone",
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      initialValue: PhoneNumber(isoCode: 'CI'),
                      textFieldController: telephone,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      inputBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      onSaved: (PhoneNumber number) {},
                    ),
                  ),
                  Gap(8.w),
                  SubmitButton("CONTINUER", onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginVerificationPage(),
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
                          text:
                              "En créant un nouveau compte, vous acceptez nos",
                        ),
                        TextSpan(
                          text: " termes et conditions ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "&",
                        ),
                        TextSpan(
                          text: " politique de confidentialité",
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
