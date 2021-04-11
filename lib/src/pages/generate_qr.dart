import 'package:flutter/material.dart';
import 'package:one_wallet/src/theme/light_color.dart';
import 'package:one_wallet/src/widgets/title_text.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  String qrData = "https://achyutghosh.github.io/";
  final qrdataFeed = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Container(
                  //   height: 55,
                  //   width: 60,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: NetworkImage(
                  //             "https://jshopping.in/images/detailed/591/ibboll-Fashion-Mens-Optical-Glasses-Frames-Classic-Square-Wrap-Frame-Luxury-Brand-Men-Clear-Eyeglasses-Frame.jpg"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //       borderRadius: BorderRadius.all(Radius.circular(35))),
                  // ),
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
                    BackButton(
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    TitleText(
                      text: "QR Code",
                      color: Colors.white,
                    )
                  ],
                )),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(50),
              child: SingleChildScrollView(
                //Scroll view given to Column
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    QrImage(data: qrData),
                    SizedBox(height: 20),
                    Text(
                      "Generate QR Code",
                      style: TextStyle(fontSize: 20),
                    ),

                    //TextField for input link
                    TextField(
                      decoration:
                          InputDecoration(hintText: "Enter your link here..."),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      //Button for generating QR code
                      child: FlatButton(
                        onPressed: () async {
                          //a little validation for the textfield
                          if (qrdataFeed.text.isEmpty) {
                            setState(() {
                              qrData = "";
                            });
                          } else {
                            setState(() {
                              qrData = qrdataFeed.text;
                            });
                          }
                        },
                        //Title given on Button
                        child: Text(
                          "Generate QR Code",
                          style: TextStyle(
                            color: LightColor.navyBlue2,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: LightColor.navyBlue2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // _buttonWidget(),
          ],
        ),
      ),
      //Appbar having title

      // body: Container(
      //   padding: EdgeInsets.all(20),
      //   child: SingleChildScrollView(
      //
      //     //Scroll view given to Column
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         QrImage(data: qrData),
      //         SizedBox(height: 20),
      //         Text("Generate QR Code",style: TextStyle(fontSize: 20),),
      //
      //         //TextField for input link
      //         TextField(
      //           decoration: InputDecoration(
      //               hintText: "Enter your link here..."
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           //Button for generating QR code
      //           child: FlatButton(
      //             onPressed: () async {
      //               //a little validation for the textfield
      //               if (qrdataFeed.text.isEmpty) {
      //                 setState(() {
      //                   qrData = "";
      //                 });
      //               } else {
      //                 setState(() {
      //                   qrData = qrdataFeed.text;
      //                 });
      //               }
      //             },
      //             //Title given on Button
      //             child: Text("Generate QR Code",style: TextStyle(color: Colors.indigo[900],),),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               side: BorderSide(color: Colors.indigo[900]),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
