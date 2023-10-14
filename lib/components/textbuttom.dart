import 'package:flutter/material.dart';

class AppTextButtom extends StatefulWidget {
  final Icon? iconLeft;
  final String? labelTitle;
  final Icon? iconRight;
  const AppTextButtom({
    super.key,
    this.iconLeft,
    this.iconRight,
    this.labelTitle,
  });

  @override
  State<AppTextButtom> createState() => _AppTextButtomState();
}

class _AppTextButtomState extends State<AppTextButtom> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Expanded(
            // ignore: avoid_unnecessary_containers
            child: Container(),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: const Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
