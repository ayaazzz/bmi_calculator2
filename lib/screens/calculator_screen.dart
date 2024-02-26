import 'package:flutter/material.dart';
import 'package:bmi_calculator2/Screens/calculate_bmi.dart';
import 'package:bmi_calculator2/Screens/constants.dart';
import 'package:bmi_calculator2/Screens/my_containers.dart';
class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});

  bool isFemale = true;
  int age = 18;
  int weight = 50;

  @override
  State<CalculatorScreen> createState() => BmiCalcState();
}

class BmiCalcState extends State<CalculatorScreen> {
  double currentHeight = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants().bg,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Constants().primary,
        title: const Text(
          'Body Mass Index',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isFemale = true;
                      });
                    },
                    child: BmiContainer(
                      content: gender('Female'),
                      isColored: widget.isFemale,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isFemale = false;
                      });
                    },
                    child: BmiContainer(
                      content: gender('Male'),
                      isColored: !widget.isFemale,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiContainer(
              content: slider(),
              isColored: false,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiContainer(
                    content: ageOrWeight('Weight'),
                    isColored: false,
                  ),
                ),
                Expanded(
                  child: BmiContainer(
                    content: ageOrWeight('Age'),
                    isColored: false,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: GestureDetector(
              onTap: () {
                double heightInMeters = currentHeight / 100.0;
                double bmi = widget.weight / (heightInMeters * heightInMeters);
                showDialog<String>(
                  context: context,
                  builder: (context) => BmiAlertDialog(
                    bmi: bmi,
                    isFemale: widget.isFemale,
                    height: currentHeight.round(),
                    age: widget.age,
                    weight: widget.weight,
                  ),
                );
              },
              child: const BmiContainer(
                content: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
                isColored: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gender(String gender) {
    return Column(
      children: [
        Icon(
          gender == 'Female' ? Icons.female : Icons.male,
          size: 100,
          color: Colors.white,
        ),
        Text(
          gender,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ],
    );
  }

  Widget slider() {
    return Column(
      children: [
        const Text(
          'HEIGHT',
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              currentHeight.round().toString(),
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'CM',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 350,
          child: Slider(
            value: currentHeight,
            onChanged: (val) {
              setState(() {
                currentHeight = val;
              });
            },
            min: 80,
            max: 220,
            activeColor: Constants().primary,
            inactiveColor: const Color.fromRGBO(105, 132, 143, 1),
            thumbColor: Colors.black,
            label: currentHeight.round().toString(),
          ),
        )
      ],
    );
  }

  Widget ageOrWeight(String text) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          (text == 'Age' ? widget.age : widget.weight).toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            plusMinusButton('-', text),
            TextButton(
                onPressed: () {
                  setState(() {
                    (text == 'Age' ? widget.age = 18 : widget.weight = 50);
                  });
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                )),
            plusMinusButton('+', text),

          ],
        ),
      ],
    );
  }

  Widget plusMinusButton(String sign, String text) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          sign == '+'
              ? text == 'Age'
              ? widget.age++
              : widget.weight++
              : text == 'Age'
              ? widget.age -= widget.age > 0 ? 1 : 0
              : widget.weight -= widget.weight > 0 ? 1 : 0;
        });
      },
      heroTag: null,
      mini: true,
      shape: const CircleBorder(),
      backgroundColor: Constants().primary,
      child: Icon(
        sign == '+' ? Icons.add : Icons.remove,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}