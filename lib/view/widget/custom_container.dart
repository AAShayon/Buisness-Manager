import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child,  this.appBar});
  final Widget child;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: appBar,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.greenAccent.withOpacity(.5),
                Colors.red.withOpacity(.5),
              ],begin: Alignment.topRight,end: Alignment.bottomLeft)
            ),
           child: child,
          ),
      ),
    );
  }
}
