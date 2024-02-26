import 'package:flutter/material.dart';

class BmiAlertDialog extends StatelessWidget {
  const BmiAlertDialog({super.key, required this.isFemale, required this.height, required this.age, required this.weight, required this.bmi});

  final double bmi;
  final bool isFemale;
  final int height;
  final int age;
  final int weight;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Your BMI is ${bmi.round()}'),
      content: SizedBox(
        height: 130,
        child: Column(
          children: [
            Text('Gender: ${isFemale ? 'Female' : 'Male'}'),
            Text('Height: $height'),
            Text('Weight: $weight'),
            Text('Age: $age'),
            Text(classification(bmi), style: const TextStyle(
              fontSize: 30,
            ),),
          ],
        ),
      ),
    );
  }
}


String classification(double bmi)
{
   if (bmi >= 25) {
     return 'Overweight';
   } else if (bmi > 18.5) {
     return 'Normal';
   } else {
     return 'Underweight';
   }
}