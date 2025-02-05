import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/core/widgets/custom_container.dart';
import 'package:chondohealth/core/widgets/dot_widget.dart';
import 'package:chondohealth/features/auth/views/sign_in_screen.dart';
import 'package:chondohealth/features/onboarding/models/on_boarding_model.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/constants/keys.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:chondohealth/util/services/navigation_service.dart';
import 'package:chondohealth/util/services/shared_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SOnBoarding extends StatefulWidget {
  const SOnBoarding({super.key});

  @override
  State<SOnBoarding> createState() => _SOnBoardingState();
}

class _SOnBoardingState extends State<SOnBoarding> {
  final PageController _pageController = PageController();
  ValueNotifier<int> selectedPageIndex = ValueNotifier(0);

  setSelectedPageIndex({required int value}) {
    selectedPageIndex.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PTheme.paddingX),
          child: Column(
            children: [
              ValueListenableBuilder<int>(
                  valueListenable: selectedPageIndex,
                  builder: (context, value, child) {
                    return value + 1 == onBoardingList.length
                        ? const SizedBox.shrink()
                        : Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                SharedPrefService.instance.setBool(PKeys.isBoardingShown, true);
                                const SSignIn().push();
                              },
                              child: Text(
                                "Skip",
                                style: context.themes.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          );
                  }),
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: selectedPageIndex,
                    builder: (context, valueIndex, child) {
                      return PageView.builder(
                        controller: _pageController,
                        padEnds: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: onBoardingList.length,
                        onPageChanged: (v) {
                          setSelectedPageIndex(value: v);
                        },
                        itemBuilder: (context, index) {
                          MOnBoarding? item = onBoardingList[valueIndex];
                          return Column(
                            children: [
                              Image.asset(
                                item.imagePath,
                                height: 290.h,
                                width: double.infinity,
                                fit: BoxFit.fitHeight,
                              ),
                            ],
                          );
                        },
                      );
                    }),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: selectedPageIndex,
                  builder: (context, valueIndex, child) {
                    MOnBoarding? item = onBoardingList[valueIndex];
                    return WCustomContainer(
                      color: Color(0xFFF6EBEB),
                      borderRadius: 30.r,
                      verticalPadding: 30.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.titleText ?? "",
                            textAlign: TextAlign.center,
                            style: context.themes.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                            ),
                          ),
                          gapY(30),
                          Text(
                            item.subTitleText ?? "",
                            textAlign: TextAlign.center,
                            style: context.themes.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                          gapY(30),
                          ValueListenableBuilder(
                              valueListenable: selectedPageIndex,
                              builder: (context, value, child) {
                                return WDot(length: onBoardingList.length, selectedIndex: value);
                              }),
                          gapY(20),
                          ValueListenableBuilder(
                            valueListenable: selectedPageIndex,
                            builder: (context, valueIndex, child) {
                              return WPrimaryButton(
                                text: valueIndex + 1 == onBoardingList.length ? "Get Started" : "Continue",
                                onTap: () async {
                                  if (valueIndex + 1 == onBoardingList.length) {
                                    SharedPrefService.instance.setBool(PKeys.isBoardingShown, true);
                                    const SSignIn().push();
                                  } else {
                                    setSelectedPageIndex(value: valueIndex + 1);
                                    _pageController.animateToPage(
                                      selectedPageIndex.value,
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ).gapY;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
