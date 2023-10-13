import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';

class SuccessfullScreen extends StatelessWidget {
  final String title;

  final String subtitle;

  final String message;

  const SuccessfullScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              color: secondaryColor,
              width: size.width,
              height: size.height / 2.5,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task_alt_rounded,
                    size: 120,
                    color: whiteColor,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Your account has been created',
                    style: textStyleWhite,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.width / 10),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Thank you for Regestering',
              style: headingStyle,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'A verification link has been sent to your email',
              textAlign: TextAlign.center,
              style: textStyle2Black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'Please sign in to your email to verify your account',
                textAlign: TextAlign.center,
                style: textStyle2DarkGrey,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: SizedBox(
              height: 40,
              child: Image.asset('assets/images/logo_in_app.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // when pressed, will take you to home screen
        onPressed: () => Navigator.of(context).pushReplacementNamed('home'),
        backgroundColor: whiteColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.close_rounded,
          color: secondaryColor,
          weight: 20,
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
