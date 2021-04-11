import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_wallet/src/pages/generate_qr.dart';
import 'package:one_wallet/src/pages/homePage.dart';
import 'package:one_wallet/src/pages/money_transfer_page.dart';
import 'package:one_wallet/src/pages/money_transfer_page1.dart';
import 'package:one_wallet/src/pages/scan_qr.dart';
import 'package:one_wallet/src/theme/theme.dart';
import 'package:one_wallet/src/widgets/customRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Wallet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: <String, WidgetBuilder> {
        '/': (_) => HomePage(),
        '/transfer': (_) => MoneyTransferPage(),
        '/generate': (_) => GenerateQR(),
        '/scan': (_) => ScanQR()
      },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] == '') {
            return null;
          }
          if (pathElements[0] == 'transfer') {
            return CustomRoute<bool>(
                builder: (BuildContext context) => MoneyTransferPage());
          }
          if (pathElements[0] == 'generate') {
            return CustomRoute<bool>(
                builder: (BuildContext context) => GenerateQR());
          }
          if (pathElements[0] == 'scan') {
            return CustomRoute<bool>(
                builder: (BuildContext context) => ScanQR());
          }
        }
    );
  }
}
