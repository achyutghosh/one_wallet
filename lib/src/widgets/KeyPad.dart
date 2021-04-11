import 'package:flutter/material.dart';
import 'package:one_wallet/src/theme/light_color.dart';


class KeyPad extends StatelessWidget{
  double buttonSize = 60.0;
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;

  KeyPad({this.onChange, this.onSubmit, this.pinController, this.isPinLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButtonWidget(Icons.backspace, () {
                if (pinController.text.length > 0) {
                  pinController.text = pinController.text
                      .substring(0, pinController.text.length - 1);
                }
                if (pinController.text.length > 5) {
                  pinController.text = pinController.text.substring(0, 3);
                }
                onChange(pinController.text);
              }),
              buttonWidget('0'),
              !isPinLogin
                  ? iconButtonWidget(Icons.check_circle, () {
                if (pinController.text.length > 10) {
                  pinController.text = pinController.text.substring(0, 3);
                }
                onSubmit(pinController.text);
              })
                  : Container(
                width: buttonSize,
              ),
            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText) {
    return Container(
      height: buttonSize,
      width: buttonSize,
      child: RaisedButton(
        color: LightColor.navyBlue2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonSize / 2),
        ),
        focusColor: LightColor.navyBlue2,
        hoverColor: LightColor.navyBlue2,
        highlightColor: LightColor.navyBlue2,
        onPressed: () {
          if (pinController.text.length <= 10) {
            pinController.text = pinController.text + buttonText;
            onChange(pinController.text);
          }
        },
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25),
          ),
        ),
      ),
    );
  }

  iconButtonWidget(IconData icon, Function function) {
    return InkWell(
      onTap: function,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(color: LightColor.yellow2, shape: BoxShape.circle),
        child: Center(
          child: Icon(icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}