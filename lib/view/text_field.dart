import 'package:flutter/material.dart';

class TextFieldTask extends StatefulWidget {
  const TextFieldTask({super.key});

  @override
  State<TextFieldTask> createState() => _TextFieldTaskState();
}

class _TextFieldTaskState extends State<TextFieldTask> {
  double textSize = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter the Value"
              ),
              onChanged: (value) {
                setState(() {
                  textSize = double.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Text1",
              ),
              style: TextStyle(
                fontSize: textSize
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Text2"
              ),
              style: TextStyle(
                  fontSize: textSize
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Text3"
              ),
              style: TextStyle(
                  fontSize: textSize
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Text4"
              ),
              style: TextStyle(
                  fontSize: textSize
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Text5"
              ),
              style: TextStyle(
                  fontSize: textSize
              ),
            ),
          ],
        ),
      ),
    );
  }
}
