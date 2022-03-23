import 'package:flutter/material.dart';

class MyCheckbox2 extends StatelessWidget {


  final Function()? onTap;
  final bool active;

  const MyCheckbox2({Key? key, this.onTap, required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: active,
          onChanged: (value) {
            if(value == null) return;

            print(value);

            onTap?.call();

            //setState(() {
            // active = value;
            // });
          },
        ),
        Text('Invia le email'),
      ],
    );
  }
}

class MyCheckbox extends StatefulWidget {

  final Function()? onTap;
  final bool active;

  const MyCheckbox({Key? key, this.onTap, required this.active}) : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  //bool active = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.active,
          onChanged: (value) {
            if(value == null) return;

            print(value);

            widget.onTap?.call();

            //setState(() {
             // active = value;
           // });
          },
        ),
        Text('Invia le email'),
      ],
    );
  }
}
