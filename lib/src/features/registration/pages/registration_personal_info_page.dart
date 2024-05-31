import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:no_limit_pro/src/features/registration/pages/pages.dart';
import 'package:no_limit_pro/src/theme/app_colors.dart';
import 'package:no_limit_pro/src/widgets/button/button.dart';
import 'package:no_limit_pro/src/widgets/input/input.dart';
import 'package:sizer/sizer.dart';

class RegistrationPersonalInfoPage extends StatefulWidget {
  const RegistrationPersonalInfoPage({super.key});

  @override
  State<RegistrationPersonalInfoPage> createState() =>
      _RegistrationPersonalInfoPageState();
}

class _RegistrationPersonalInfoPageState
    extends State<RegistrationPersonalInfoPage> {
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
        title: Text("Informations personnelles"),
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
              width: width * .3,
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
                          Gap(4.w),
                          Center(
                            child: SizedBox(
                              width: 40.w,
                              height: 40.w,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.w),
                                      color: Colors.blue.shade50,
                                    ),
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(2.w),
                                    child: Icon(Icons.person, size: 20.w),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: appBlue,
                                        borderRadius: BorderRadius.circular(2.w),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.w,
                                        vertical: 1.w,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Gap(8.w),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Nom",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Gap(2.w),
                                    InputText(
                                      controller: nomCtrl,
                                      borderColor: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              Gap(4.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Prénoms",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Gap(2.w),
                                    InputText(
                                      controller: prenomCtrl,
                                      borderColor: Colors.grey,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Gap(4.w),
                          Text(
                            "Email",
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
                            "Date de naissance",
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
                            "Genre",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Gap(2.w),
                          _buildGenders(["Homme", "Femme"], genderIndex),
                        ],
                      ),
                    ),
                  ),
                  Gap(4.w),
                  SubmitButton(
                    "CONTINUER",
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
