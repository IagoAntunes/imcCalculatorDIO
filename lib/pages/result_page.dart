import 'package:flutter/material.dart';
import 'package:imccalculator/model/person.dart';
import 'package:imccalculator/pages/components/button_component.dart';
import 'package:imccalculator/util/app_colors.dart';

class ResultPage extends StatefulWidget {
  ResultPage({
    super.key,
    required this.person,
  });
  Person person;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String result = "";
  double imc = 0;
  Map<String, Color> mapResult = {
    'Magreza Grave': Colors.red,
    'Magreza moderada': Colors.orange,
    'Magreza Leve': Colors.yellow,
    'Saudavel': Colors.green,
    'Sobrepeso': Colors.yellow,
    'Obesidade Grau 1': Colors.orange,
    'Obesidade Grau 2': Colors.red,
    'Obesidade Grau 3': Colors.red,
  };

  @override
  void initState() {
    super.initState();

    imc = widget.person.calculateImc(widget.person);
    if (imc < 16) {
      result = 'Magreza Grave';
      return;
    } else if (imc < 17) {
      result = 'Magreza moderada';
      return;
    } else if (imc < 18.5) {
      result = 'Magreza Leve';
      return;
    } else if (imc < 25) {
      result = 'Saudavel';
      return;
    } else if (imc < 30) {
      result = 'Sobrepeso';
      return;
    } else if (imc < 35) {
      result = 'Obesidade Grau 1';
      return;
    } else if (imc < 40) {
      result = 'Obesidade Grau 2';
      return;
    } else if (imc >= 40) {
      result = 'Obesidade Grau 3';
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'IMC: ${imc.ceil()}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
            ),
          ),
          Center(
            child: Text(
              result,
              style: TextStyle(
                fontSize: 30,
                color: mapResult[result],
              ),
            ),
          ),
          const SizedBox(height: 50),
          ButtonComponent(
            person: widget.person,
            text: 'Voltar',
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
