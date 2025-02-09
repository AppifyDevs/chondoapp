import 'package:chondohealth/core/functions/is_null.dart';
import 'package:chondohealth/core/models/drop_selected_item_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';
import 'package:chondohealth/util/extensions/extension.dart';
import 'package:flutter/material.dart';

class PDropDownField extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final String hintText;

  final String selectedValue;
  final List<PSelectItem> items;
  final Function onChanged;

  const PDropDownField({
    super.key,
    this.label = '',
    this.labelStyle,
    required this.onChanged,
    required this.selectedValue,
    required this.items,
    this.hintText = 'Select item',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!isNullCheck(label))
          Text(
            label,
            style: labelStyle,
          ),
        gapY(5),
        Container(
          decoration: BoxDecoration(
            color: context.themes.inputDecorationTheme.fillColor,
            border: Border.all(color: context.themes.inputDecorationTheme.border!.borderSide.color),
            borderRadius: BorderRadius.circular(PTheme.boxRadius),
          ),
          padding: EdgeInsets.symmetric(horizontal: PTheme.paddingX / 2, vertical: 1.h),
          child: DropdownButton(
            underline: SizedBox.shrink(),
            hint: Text(hintText),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down_circle_sharp),
            items: items.map(
              (PSelectItem m) {
                return DropdownMenuItem<String>(
                  value: m.value,
                  child: Text(
                    m.name,
                    style: context.themes.textTheme.bodyMedium,
                  ),
                );
              },
            ).toList(),
            value: selectedValue.isNotEmpty ? selectedValue : null,
            onChanged: (String? value) => onChanged(value!),
          ),
        ),
      ],
    );
  }
}
