import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';

class GenderField extends StatelessWidget {
  final List<String> genderList;
  final ValueChanged<String?> onChanged;
  final String? selectedGender;
  final String? Function(String?)? validator;
  final bool showError; // Control when to display errors

  const GenderField(
    this.genderList, {
    super.key,
    required this.onChanged,
    this.selectedGender,
    this.validator,
    this.showError = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    Map<int, String> mappedGender = genderList.asMap();
    String? errorText = showError ? validator?.call(selectedGender) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Gender"),
        gapY(5),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          decoration: BoxDecoration(
            color: context.themes.inputDecorationTheme.fillColor,
            border: Border.all(color: context.themes.inputDecorationTheme.border!.borderSide.color),
            borderRadius: BorderRadius.circular(
              PTheme.boarderRadius,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...mappedGender.entries.map(
                (MapEntry<int, String> mapEntry) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      activeColor: Theme.of(context).cardColor,
                      groupValue: selectedGender,
                      value: genderList[mapEntry.key],
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        onChanged(value);
                      },
                    ),
                    Text(mapEntry.value),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (errorText != null)
          Text(
            errorText,
            style: context.themes.textTheme.displaySmall,
          ),
      ],
    );
  }
}
