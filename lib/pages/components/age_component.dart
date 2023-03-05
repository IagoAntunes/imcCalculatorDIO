import 'package:flutter/material.dart';
import 'package:imccalculator/model/person.dart';
import 'package:imccalculator/util/app_colors.dart';

class AgeComponent extends StatefulWidget {
  AgeComponent({
    super.key,
    required this.person,
  });
  Person person;
  @override
  State<AgeComponent> createState() => _AgeComponentState();
}

class _AgeComponentState extends State<AgeComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Idade',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.grey,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.person.age--;
                  });
                },
                child: const SizedBox(
                  height: 25,
                  child: CircleAvatar(
                    backgroundColor: AppColor.black,
                    child: Icon(
                      Icons.remove,
                      size: 15,
                    ),
                  ),
                ),
              ),
              Text(
                widget.person.age.toString(),
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.person.age++;
                  });
                },
                child: const SizedBox(
                  height: 25,
                  child: CircleAvatar(
                    backgroundColor: AppColor.black,
                    child: Icon(
                      Icons.add,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
