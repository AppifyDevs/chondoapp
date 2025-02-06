import 'package:chondohealth/core/widgets/primay_text_field.dart';
import 'package:chondohealth/util/constants/date_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class WDateTimePickerFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool dateOnly;
  final String dtFormat;
  final DateTime? minDT;
  final DateTime? maxDT;
  final String? hintText;
  final String? Function(String?)? validator;
  final ValueChanged<DateTime>? onDateTimeChanged;

  const WDateTimePickerFormField(
      {super.key,
      required this.controller,
      required this.label,
      this.dtFormat = PDateUtil.dobFormateDDMMYYYY,
      this.minDT,
      this.maxDT,
      this.hintText,
      this.dateOnly = true,
      this.validator,
      this.onDateTimeChanged});

  _openPicker(BuildContext context) {
    dateOnly
        ? DatePicker.showDatePicker(
            context,
            showTitleActions: true,
            minTime: minDT,
            maxTime: maxDT,
            currentTime: controller.text.isNotEmpty ? PDateUtil.parse(dtFormat, controller.text) : null,
            onConfirm: (dt) {
              controller.text = PDateUtil.getDate(dtFormat, dt);
              if (onDateTimeChanged != null) {
                onDateTimeChanged!(dt);
              }
            },
          )
        : DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            minTime: minDT,
            maxTime: maxDT,
            currentTime: controller.text.isNotEmpty ? PDateUtil.parse(dtFormat, controller.text) : null,
            onConfirm: (dt) {
              controller.text = PDateUtil.getDate(dtFormat, dt);
              if (onDateTimeChanged != null) {
                onDateTimeChanged!(dt);
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return WTextField(
      label: label,
      onTap: () => _openPicker(context),
      hintText: hintText,
      controller: controller,
      readOnly: true,
      validator: validator,
      suffixIcon: Icon(
        dateOnly ? Icons.calendar_today_outlined : Icons.watch_later,
      ),
    );
  }
}
