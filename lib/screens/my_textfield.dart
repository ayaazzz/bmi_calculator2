import 'package:flutter/material.dart';
import 'package:bmi_calculator2/Screens/constants.dart';

class BmiTextField extends StatefulWidget {
  const BmiTextField({super.key, required this.label});

  final String label;
  @override
  State<BmiTextField> createState() => BmiTextFieldState();
}

class BmiTextFieldState extends State<BmiTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
        MediaQuery.of(context).size.width * Constants().horizontalPadding,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * Constants().loginWidgetWidth,
        child: TextFormField(
          validator: (val) {
            if (val == null || val.isEmpty) return 'PLease fill the field';
            if (widget.label == 'Password') {
              return (val != '1234') ? ('${widget.label} is incorrect') : (null);
            } else {
              return (val.toLowerCase() != 'maryam@gmail.com')
                  ? ('${widget.label} is incorrect')
                  : (null);
            }
          },
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.green,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.red,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.red,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            label: Text(widget.label),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          ),
        ),
      ),
    );
  }
}