import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:no_limit_pro/src/theme/app_colors.dart';
import 'package:no_limit_pro/src/widgets/button/button.dart';
import 'package:no_limit_pro/src/widgets/input/input.dart';
import 'package:sizer/sizer.dart';

import '../registration.dart';

class LicenseFrontPage extends StatefulWidget {
  const LicenseFrontPage({super.key});

  @override
  State<LicenseFrontPage> createState() => _LicenseFrontPageState();
}

class _LicenseFrontPageState extends State<LicenseFrontPage> {
  final TextEditingController nomCtrl = TextEditingController();
  final TextEditingController prenomCtrl = TextEditingController();

  int genderIndex = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Permis de conduire"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                    alignment: Alignment.bottomRight,
                    height: 50.w,
                    padding: EdgeInsets.all(4.w),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(2.w),
                      child: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Gap(2.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vérification",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        Gap(4.w),
                        Text(
                          "Bien calibrer et continuer",
                          style: TextStyle(
                            color: appGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        Gap(4.w),
                        SubmitButton("CONTINUER", onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => RegistrationVehicleInfoPage(),
                            ),
                          );
                        }),
                        Gap(4.w),
                        Text(
                          "Prendre une nouvelle photo",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
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
