import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gtCustomRadioButtonWidget extends StatefulWidget {
  final String fieldName;
  final String option1;
  final String option2;
  final IconData icon1;
  final IconData icon2;
  final Function(int) onChanged;
  final int initialValue;

  const gtCustomRadioButtonWidget({
    Key? key,
    required this.fieldName,
    required this.option1,
    required this.option2,
    required this.icon1,
    required this.icon2,
    required this.onChanged,
    required this.initialValue,

  }) : super(key: key);

  @override
  _gtCustomRadioButtonWidgetState createState() =>
      _gtCustomRadioButtonWidgetState();
}

class _gtCustomRadioButtonWidgetState extends State<gtCustomRadioButtonWidget> {
  int value = 0;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue; // Set initial value from parameter
  }

  Widget radioButton(String text, int index, IconData iconData, ) {
    return GestureDetector(
      onTap: () {
        setState(() {
        //  widget.initialValue =;
          value =  0;
          widget.onChanged(value);
        });
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 15, bottom: 15.0),
        decoration: BoxDecoration(
          color:
              (value == index) ? Colors.green : Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //--- The following field name is commented out for design purpose only
        // Text(
        //   widget.fieldName,
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 16,
        //   ),
        // ),
        SizedBox(height: 8.0),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: radioButton(widget.option1, 1, widget.icon1),
            ),
            SizedBox(width: 10.0),
            Expanded(
              flex: 1,
              child: radioButton(widget.option2, 2, widget.icon2),
            ),
          ],
        ),
      ],
    );
  }
}
