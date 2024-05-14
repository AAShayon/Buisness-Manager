import 'package:buisness_manager/view/screens/widgets/custom_container.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Center(child: Text('Hello')));
  }
}
