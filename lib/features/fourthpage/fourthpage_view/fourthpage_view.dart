import 'package:flutter/material.dart';
import 'package:medical_health_title/features/fourthpage/fourthpage_view/videocall.dart';

class FourthpageView extends StatefulWidget {
  const FourthpageView({super.key});

  @override
  State<FourthpageView> createState() => FourthpageViewState();
}
class FourthpageViewState extends State<FourthpageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Videocall(),
    );
  }
}
