import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:no_limit_pro/src/features/registration/pages/license_front_page.dart';
import 'package:no_limit_pro/src/theme/app_colors.dart';
import 'package:no_limit_pro/src/widgets/button/button.dart';
import 'package:no_limit_pro/src/widgets/input/input.dart';
import 'package:sizer/sizer.dart';

class RegistrationAddressInfoPage extends StatefulWidget {
  const RegistrationAddressInfoPage({super.key});

  @override
  State<RegistrationAddressInfoPage> createState() =>
      _RegistrationAddressInfoPageState();
}

class _RegistrationAddressInfoPageState
    extends State<RegistrationAddressInfoPage> {
  final TextEditingController nomCtrl = TextEditingController();
  final TextEditingController prenomCtrl = TextEditingController();

  int genderIndex = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: Text("Adresse"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade400,
            width: width,
            height: 1.w,
            alignment: Alignment.centerLeft,
            child: Container(
              width: width * .6,
              color: appBlue,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Numéro maison",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Gap(2.w),
                          InputText(
                            controller: prenomCtrl,
                            borderColor: Colors.grey,
                          ),
                          Gap(4.w),
                          Text(
                            "Quartier",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Gap(2.w),
                          InputText(
                            controller: prenomCtrl,
                            borderColor: Colors.grey,
                          ),
                          Gap(4.w),
                          Text(
                            "Ville",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Gap(2.w),
                          InputText(
                            controller: prenomCtrl,
                            borderColor: Colors.grey,
                          ),
                          Gap(4.w),
                          Text(
                            "Code postal",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Gap(2.w),
                          InputText(
                            controller: prenomCtrl,
                            borderColor: Colors.grey,
                          ),

                        ],
                      ),
                    ),
                  ),
                  Gap(4.w),
                  Row(
                    children: [
                      Expanded(
                        child: CancelButton(
                          "RETOUR",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Gap(4.w),
                      Expanded(
                        child: SubmitButton(
                          "CONTINUER",
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LicenseFrontPage()));
                          },
                        ),
                      ),
                    ],
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
