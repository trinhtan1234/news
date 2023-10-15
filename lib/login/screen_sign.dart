import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  const RadioGroup({super.key});

  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State {
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text('Selected Radio Item = ' + '$radioButtonItem',
                style: const TextStyle(fontSize: 21))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'ONE';
                  id = 1;
                });
              },
            ),
            const Text(
              'ONE',
              style: TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'TWO';
                  id = 2;
                });
              },
            ),
            const Text(
              'TWO',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            Radio(
              value: 3,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'THREE';
                  id = 3;
                });
              },
            ),
            const Text(
              'THREE',
              style: TextStyle(fontSize: 17.0),
            ),
          ],
        ),
      ],
    );
  }
}
