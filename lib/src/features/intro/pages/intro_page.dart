import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:no_limit_pro/src/features/login/login.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/app_colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentPageIndex = 0;
  final int maxPages = 3;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: maxPages,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50.w),
                              ),
                            ),
                            width: double.infinity,
                            height: height * .5,
                          ),
                          Gap(8.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Register your vehicle\non NSlyft",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(6.w),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur \nadipiscingelit. Nullam et velit molestie",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp, color: appGrey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                  ),
                ),
                Gap(8.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < maxPages; i++) ...[
                      Container(
                        width: isSelectedPage(i) ? 6.w : 2.w,
                        height: 2.w,
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        decoration: BoxDecoration(
                          color: isSelectedPage(i)
                              ? appColor
                              : Colors.blue.shade300,
                          shape: isSelectedPage(i)
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                          borderRadius: isSelectedPage(i)
                              ? BorderRadius.circular(5.w)
                              : null,
                        ),
                      )
                    ]
                  ],
                ),
              ],
            ),
          ),
          Gap(8.w),
          InkWell(
            onTap: () {
              if (!isLastPage) {
                setState(() {
                  currentPageIndex++;
                });
                pageController.animateToPage(
                  currentPageIndex,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
                return;
              }

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              padding: EdgeInsets.all(4.w),
              alignment: Alignment.center,
              child: Icon(
                isLastPage
                    ? Icons.check_rounded
                    : Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Gap(4.w),
          Text(
            isLastPage ? "" : "Skip",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: appGrey),
          ),
          Gap(8.w),
        ],
      ),
    );
  }

  bool get isLastPage => currentPageIndex == maxPages - 1;

  bool isSelectedPage(int i) => currentPageIndex == i;
}
