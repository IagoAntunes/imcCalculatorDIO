import 'package:flutter/material.dart';
import 'package:imccalculator/model/person.dart';
import 'package:imccalculator/pages/components/age_component.dart';
import 'package:imccalculator/pages/components/button_component.dart';
import 'package:imccalculator/pages/components/height_component.dart';
import 'package:imccalculator/pages/components/weight_component.dart';
import 'package:imccalculator/pages/result_page.dart';
import 'package:imccalculator/util/app_colors.dart';

import 'components/gender_menu_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> listDropW = ['kg'];
  final List<String> listDropH = ['cm'];
  late String dropdownValueW;
  late String dropdownValueH;
  Person person = Person();
  @override
  void initState() {
    super.initState();
    dropdownValueW = listDropW[0];
    dropdownValueH = listDropH[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.notification_add),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Calculadora IMC',
              style: TextStyle(
                fontSize: 30,
                color: AppColor.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            //Genero
            GenderMenuComponent(person: person),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeightComponent(
                  person: person,
                  dropdownValue: dropdownValueW,
                  listDrop: listDropW,
                ),
                const SizedBox(height: 15),
                HeightComponent(
                  person: person,
                  dropdownValue: dropdownValueH,
                  listDrop: listDropH,
                ),
                const SizedBox(height: 15),
                AgeComponent(
                  person: person,
                ),
              ],
            ),
            Expanded(child: Container()),
            ButtonComponent(
              person: person,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(person: person),
                  ),
                );
              },
              text: 'Calcular',
            ),
          ],
        ),
      ),
    );
  }
}
