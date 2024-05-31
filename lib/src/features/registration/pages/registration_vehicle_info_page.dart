import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:no_limit_pro/src/features/registration/pages/pages.dart';
import 'package:no_limit_pro/src/theme/app_colors.dart';
import 'package:no_limit_pro/src/widgets/button/button.dart';
import 'package:no_limit_pro/src/widgets/input/input.dart';
import 'package:sizer/sizer.dart';

class RegistrationVehicleInfoPage extends StatefulWidget {
  const RegistrationVehicleInfoPage({super.key});

  @override
  State<RegistrationVehicleInfoPage> createState() =>
      _RegistrationVehicleInfoPageState();
}

class _RegistrationVehicleInfoPageState
    extends State<RegistrationVehicleInfoPage> {
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
        title: Text("Informations véhicule"),
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
              width: width,
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
                            "Type de véhicule",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                          ),
                          Gap(2.w),
                          _buildGenders(["Voiture", "Moto"], genderIndex),
                          Gap(4.w),
                          Text(
                            "Immatriculation",
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
                          Gap(8.w),
                          Text(
                            "Documents véhicule",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gap(4.w),
                          Card(
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 4.w),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.red,
                                    size: 10.w,
                                  ),
                                  Gap(2.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Doc 1",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "308 KB",
                                          style: TextStyle(
                                            fontSize: 8.sp,
                                            color: appGrey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gap(4.w),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                    padding: EdgeInsets.all(1.w),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 4.w,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Gap(4.w),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Assurance véhicule",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Charger l'assurance du véhicule",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: appGrey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(4.w),
                              Text(
                                "CHARGER",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: appBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Gap(2.w),
                          Divider(),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationCongratulationPage()));
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
