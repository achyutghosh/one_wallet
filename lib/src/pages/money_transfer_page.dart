import 'dart:math';
import 'package:flutter/material.dart';
import 'package:one_wallet/src/widgets/KeyPad.dart';
import 'package:one_wallet/src/widgets/title_text.dart';
import 'package:one_wallet/src/theme/light_color.dart';

class MoneyTransferPage extends StatefulWidget {
  @override
  _MoneyTransferPageState createState() => _MoneyTransferPageState();
}

class _MoneyTransferPageState extends State {

  String displayCode;
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayCode = getNextCode();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('CODE UNLOCK'),
      //   backgroundColor: Colors.blue,
      // ),
      //body: buttonWidget(),

        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Container(
                      height: 55,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://jshopping.in/images/detailed/591/ibboll-Fashion-Mens-Optical-Glasses-Frames-Classic-Square-Wrap-Frame-Luxury-Brand-Men-Clear-Eyeglasses-Frame.jpg"),
                            fit: BoxFit.cover,),
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: -100,
                top: -200,
                child: CircleAvatar(
                  radius: 190,
                  backgroundColor: LightColor.lightBlue2,
                ),
              ),
              Positioned(
                left: -90,
                top: -270,
                child: CircleAvatar(
                  radius: 190,
                  backgroundColor: LightColor.lightBlue1,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .4,
                right: -130,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor: LightColor.yellow2,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .4,
                right: -160,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor: LightColor.yellow,
                ),
              ),
              Positioned(
                  left: 0,
                  top: 40,
                  child: Row(
                    children: <Widget>[
                      BackButton(color: Colors.white,),
                      SizedBox(width: 20),
                      TitleText(
                        text: "Transfer",
                        color: Colors.white,
                      )
                    ],
                  )),
              _buttonWidget(),
            ],
          ),
        ),
    );

  }

  Builder _buttonWidget() {
    return Builder(
      builder: (context) =>
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: LightColor.grey,
                        borderRadius:
                        BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: pinController,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          // fontWeight: FontWeight.bold
                          // fontFamily: AppTextStyle.robotoBold
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Amount',
                        ),
                        // controller: userDisplayName,
                      ),
                    ),
                  ),
                ),
                KeyPad(
                  pinController: pinController,
                  isPinLogin: false,
                  onChange: (String pin) {
                    pinController.text = pin;
                    print('${pinController.text}');
                    setState(() {});
                  },
                  onSubmit: (String pin) {
                    if (pin.length != 10) {
                      (pin.length == 0) ? showInSnackBar('Please Enter Amount') : showInSnackBar('Wrong Pin');
                      return;

                    } else {

                      pinController.text = pin;

                      if (pinController.text == displayCode){
                        showInSnackBar('Pin Match');
                        setState(() {
                          displayCode = getNextCode();
                        });
                      }else{
                        showInSnackBar('Wrong Amount');
                      }
                      print('Amount is ${pinController.text}');
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                _transferButton(),
              ],

            ),
          ),
    );
  }

    Widget _transferButton() {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: LightColor.navyBlue2,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Wrap(
          children: <Widget>[
            Transform.rotate(
              angle: 70,
              child: Icon(
                Icons.swap_calls,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            TitleText(
              text: "Transfer",
              color: Colors.white,
            ),
          ],
        ));
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }

  getNextCode(){
    pinController.text = '';
    var rng = new Random();
    var code = (rng.nextInt(9000) + 1000).toString();
    print('Random No is : $code');
    return code;
  }
}