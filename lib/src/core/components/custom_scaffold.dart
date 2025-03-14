import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final String? backgroundImages;
  final Widget body;
  final PreferredSizeWidget? appBar;
  const CustomScaffold({
    super.key,
    this.backgroundColor,
    required this.body,
    this.appBar,
    this.backgroundImages,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        backgroundColor: backgroundColor ?? Color(0xff070730),
        body: body,
      ),
    );
  }
}
