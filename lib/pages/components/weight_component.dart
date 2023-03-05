import 'package:flutter/material.dart';
import 'package:imccalculator/model/person.dart';
import 'package:imccalculator/util/app_colors.dart';

class WeightComponent extends StatefulWidget {
  WeightComponent({
    super.key,
    required this.person,
    required this.dropdownValue,
    required this.listDrop,
  });
  Person person;
  String dropdownValue;
  final List<String> listDrop;
  @override
  State<WeightComponent> createState() => _WeightComponentState();
}

class _WeightComponentState extends State<WeightComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Peso',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.grey,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
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
                          widget.person.weight--;
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
                      widget.person.weight.toString(),
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.person.weight++;
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
            ),
            const SizedBox(width: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 120, minHeight: 50),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: DropdownButton(
                    value: widget.dropdownValue,
                    alignment: Alignment.center,
                    items: widget.listDrop
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        widget.dropdownValue = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
