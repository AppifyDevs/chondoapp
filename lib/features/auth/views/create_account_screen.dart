import 'package:chondohealth/core/functions/snackbar.dart';
import 'package:chondohealth/core/widgets/buttons/primary_button.dart';
import 'package:chondohealth/core/widgets/date_picker_form_field.dart';
import 'package:chondohealth/core/widgets/gender_selection.dart';
import 'package:chondohealth/core/widgets/primay_text_field.dart';
import 'package:chondohealth/features/auth/models/avatar_selection_model.dart';
import 'package:chondohealth/features/auth/widgets/detail_section_create_account.dart';
import 'package:chondohealth/features/auth/widgets/period_length_create_account.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SCreateAccount extends StatefulWidget {
  const SCreateAccount({super.key});

  @override
  State<SCreateAccount> createState() => _SCreateAccountState();
}

class _SCreateAccountState extends State<SCreateAccount> {
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);
  final TextEditingController _dobTxtCtrl = TextEditingController();
  final ValueNotifier<int> isSelectedBody = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ValueListenableBuilder(
                  valueListenable: isSelectedBody,
                  builder: (context, value, child) {
                    return value == 0
                        ? WDetailsCreateAccount(
                            dobTxtCtrl: _dobTxtCtrl,
                          )
                        : SPeriodLengthAccountCreation(isForPeriodLenght: value == 1 ? true : false);
                  },
                ),
              ),
            ),
            Column(
              children: [
                gapY(20),
                SizedBox(
                  height: 4.h,
                  child: Row(
                    children: List.generate(3, (index) {
                      return Expanded(
                        child: ValueListenableBuilder(
                            valueListenable: isSelectedBody,
                            builder: (context, value, child) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: index == value
                                      ? context.themes.buttonTheme.colorScheme?.primary
                                      : context.themes.colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(
                                    5.r,
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
                  ),
                ).gapLY,
                ValueListenableBuilder(
                  valueListenable: isSelectedBody,
                  builder: (context, value, child) {
                    return WPrimaryButton(
                      text: value == 2 ? "Continue" : "Next",
                      onTap: () {
                        if (value < 2) {
                          isSelectedBody.value++;
                        } else {
                          showSnackBar("Thanks for trying! Please go back to the sign in page");
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ).paddingXY,
      ),
    );
  }

  Widget detailSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter your valid information to provide better recommendation for you.",
          style: context.themes.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ).gapLY.gapY,
        WTextField(
          label: "Full Name",
          hintText: "Enter Full name".toString().toLowerCase(),
          controller: TextEditingController(),
        ).gapY,
        WTextField(
          hintText: "username",
          label: "Enter username",
          controller: TextEditingController(),
        ).gapY,
        WTextField(
          label: "Phone Number",
          hintText: "Enter Phone Number",
          controller: TextEditingController(),
          isBdPhoneNumber: true,
        ).gapY,
        Text(
          "Select Avatar",
          style: context.themes.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ).gapY,
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: avatarList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int avatarIndex) {
              MAvatarSelection item = avatarList[avatarIndex];
              return Padding(
                padding: EdgeInsets.only(right: PTheme.spaceX),
                child: Image.asset(
                  item.iconPath!,
                  height: 40.h,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ).gapY,
        WDateTimePickerFormField(
          controller: _dobTxtCtrl,
          label: "Select Date of birth",
          hintText: "Date of birth",
        ).gapY,
        GenderField(["Male", "Female"], onChanged: (v) {}).gapY,
        WDateTimePickerFormField(
          controller: _dobTxtCtrl,
          label: "Pick Last period date",
          hintText: "Last period date",
        ).gapLY,
      ],
    );
  }
}
