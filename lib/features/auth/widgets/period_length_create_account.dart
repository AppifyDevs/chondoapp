import 'package:chondohealth/core/widgets/custom_container.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SPeriodLengthAccountCreation extends StatefulWidget {
  const SPeriodLengthAccountCreation({super.key});

  @override
  State<SPeriodLengthAccountCreation> createState() => _SPeriodLengthAccountCreationState();
}

class _SPeriodLengthAccountCreationState extends State<SPeriodLengthAccountCreation> {
  final ValueNotifier<int> isSelectedPeriodLength = ValueNotifier<int>(0);

  ValueNotifier<int> selectedIndex = ValueNotifier<int>(5);
  late final PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(
      initialPage: selectedIndex.value,
      viewportFraction: 0.06,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        gapY(100),
        Text(
          'What’s your Period Length?',
          style: context.themes.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
          ),
        ),
        gapY(25),
        SizedBox(
          height: 120.h,
          child: PageView.builder(
            controller: _pageViewController,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            onPageChanged: (index) {
              selectedIndex.value = index;
            },
            itemBuilder: (context, index) {
              return FittedBox(
                child: ValueListenableBuilder(
                    valueListenable: selectedIndex,
                    builder: (context, value, child) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 5.w,
                        height: index % 3 == 0 ? 120.h : 70.h, // Adjust height dynamically
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 8.w), // Add spacing for scrolling
                        decoration: BoxDecoration(
                          color: index == value
                              ? context.themes.buttonTheme.colorScheme?.primary
                              : context.themes.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
              );
            },
          ),
        ),
        gapY(25),
        Text(
          'Swap to select days',
          style: context.themes.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
        gapY(25),
        WCustomContainer(
          borderRadius: 0,
          verticalPadding: 5.h,
          width: MediaQuery.of(context).size.width * 0.6,
          borderColor: context.themes.buttonTheme.colorScheme?.primary,
          child: Center(
            child: ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context, value, child) {
                  return Text(
                    "Period Length ${value + 1} ${value == 0 ? "Day" : "Days"}",
                    style: context.themes.textTheme.displayMedium,
                  );
                }),
          ),
        ).gapLY.gapLY,
        Text(
          'Your Period cycle starts on the day you start bleeding and ends on the day your bleeding stops. Your period length can vary from about 2 to 7 days.',
          textAlign: TextAlign.center,
          style: context.themes.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
