import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const StadiumBorder()),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            )),
        onPressed: onClicked,
      );
}
