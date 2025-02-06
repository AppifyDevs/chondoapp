import 'package:chondohealth/core/widgets/date_picker_form_field.dart';
import 'package:chondohealth/core/widgets/gender_selection.dart';
import 'package:chondohealth/core/widgets/primay_text_field.dart';
import 'package:chondohealth/features/auth/models/avatar_selection_model.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WDetailsCreateAccount extends StatelessWidget {
  final TextEditingController? dobTxtCtrl;
  const WDetailsCreateAccount({super.key, this.dobTxtCtrl});

  @override
  Widget build(BuildContext context) {
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
          controller: dobTxtCtrl!,
          label: "Select Date of birth",
          hintText: "Date of birth",
        ).gapY,
        GenderField(["Male", "Female"], onChanged: (v) {}).gapY,
        WDateTimePickerFormField(
          controller: dobTxtCtrl!,
          label: "Pick Last period date",
          hintText: "Last period date",
        ).gapLY,
      ],
    );
  }
}
