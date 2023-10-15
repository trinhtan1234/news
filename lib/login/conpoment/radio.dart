import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppRadio extends StatefulWidget {
  final String title;
  final int value;
  late int? selectedGender;

  AppRadio({
    Key? key,
    required this.title,
    required this.value,
    required this.selectedGender,
  }) : super(key: key);

  @override
  State<AppRadio> createState() => _AppRadioState();
}

class _AppRadioState extends State<AppRadio> {
  void handleRadioValueChange(int? value) {
    setState(() {
      widget.selectedGender = value; // Sửa đổi thành widget.selectedGender
    });
  }

  @override
  Widget build(BuildContext context) {
    return Radio(
        value: widget.value,
        groupValue: widget.selectedGender,
        onChanged: handleRadioValueChange);
  }
}
