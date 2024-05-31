import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:no_limit_pro/src/features/registration/pages/pages.dart';
import 'package:no_limit_pro/src/theme/app_colors.dart';
import 'package:no_limit_pro/src/widgets/button/button.dart';
import 'package:no_limit_pro/src/widgets/input/input.dart';
import 'package:sizer/sizer.dart';

class RegistrationCongratulationPage extends StatefulWidget {
  const RegistrationCongratulationPage({super.key});

  @override
  State<RegistrationCongratulationPage> createState() =>
      _RegistrationCongratulationPageState();
}

class _RegistrationCongratulationPageState
    extends State<RegistrationCongratulationPage> {
  final TextEditingController nomCtrl = TextEditingController();
  final TextEditingController prenomCtrl = TextEditingController();

  int genderIndex = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Gap(8.w),
                        Text(
                          "Votre inscription a été soumise pour révision",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(8.w),
                        Text(
                          "Votre inscription sera revisée et nous vous informerons par email dans un délai de 48 heures",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: appGrey,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Gap(4.w),
                  SubmitButton(
                    "ACCUEIL",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationAddressInfoPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGenders(List<String> genders, int selectedIndex) {
    return Row(
      children: [
        for (int i = 0; i < genders.length; i++) ...[
          InkWell(
            onTap: () {
              setState(() {
                genderIndex = i;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: selectedIndex == i ? appBlue : Colors.white,
                border: Border.all(
                  color: selectedIndex == i ? Colors.transparent : Colors.black,
                ),
              ),
              child: Text(
                genders[i],
                style: TextStyle(
                  fontSize: 12.sp,
                  color: selectedIndex == i ? Colors.white : Colors.black,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.w),
              margin: EdgeInsets.only(right: 4.w),
            ),
          ),
        ]
      ],
    );
  }
}
