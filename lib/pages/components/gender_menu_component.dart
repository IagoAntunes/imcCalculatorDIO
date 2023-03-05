import 'package:flutter/material.dart';
import 'package:imccalculator/model/person.dart';
import 'package:imccalculator/util/app_colors.dart';

class GenderMenuComponent extends StatefulWidget {
  GenderMenuComponent({
    super.key,
    required this.person,
  });
  Person person;
  @override
  State<GenderMenuComponent> createState() => _GenderMenuComponentState();
}

class _GenderMenuComponentState extends State<GenderMenuComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.grey,
          ),
        ),
        SizedBox(
          height: 150,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.person.gender = !widget.person.gender;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff333335),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 1.2,
                        color: widget.person.gender == true
                            ? AppColor.black
                            : AppColor.green,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Visibility(
                          visible: widget.person.gender == false ? true : false,
                          child: const Positioned(
                            right: 10,
                            top: 10,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircleAvatar(
                                backgroundColor: AppColor.green,
                                child: Icon(
                                  Icons.check,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.male,
                                color: AppColor.white,
                                size: 90,
                              ),
                              Text(
                                'Homem',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ignore: prefer_const_constructors
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.person.gender = !widget.person.gender;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff333335),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 1.2,
                        color: widget.person.gender == false
                            ? AppColor.black
                            : AppColor.green,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Visibility(
                          visible: widget.person.gender == false ? false : true,
                          child: const Positioned(
                            right: 10,
                            top: 10,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircleAvatar(
                                backgroundColor: AppColor.green,
                                child: Icon(
                                  Icons.check,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.female,
                                color: AppColor.white,
                                size: 90,
                              ),
                              Text(
                                'Mulher',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
