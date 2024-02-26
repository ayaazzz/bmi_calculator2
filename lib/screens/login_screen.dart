import 'package:flutter/material.dart';
import 'package:bmi_calculator2/screens/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter Your Email',
              icon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            onChanged:(String value) {
            },
            validator: (value) {
              return value!.isEmpty ? 'please enter your email' : null;
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText : 'Enter Your Password',
              icon: Icon(Icons.password),
              border: OutlineInputBorder(),
            ),
            onChanged:(String value) {
            },
            validator: (value) {
              return value!.isEmpty ? 'please enter your password' : null;
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if(_key.currentState!.validate()){
                Navigator.push(context,MaterialPageRoute(builder:  (context)=>CalculatorScreen()));
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }


}


