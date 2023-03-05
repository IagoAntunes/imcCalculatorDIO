import 'package:flutter/material.dart';
import 'package:imccalculator/pages/result_page.dart';

import '../../model/person.dart';
import '../../util/app_colors.dart';

class ButtonComponent extends StatefulWidget {
  ButtonComponent({
    super.key,
    required this.person,
    required this.ontap,
    required this.text,
  });
  Person person;
  String text;
  Function() ontap;
  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 50),
      child: ElevatedButton(
        onPressed: widget.ontap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.green,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
