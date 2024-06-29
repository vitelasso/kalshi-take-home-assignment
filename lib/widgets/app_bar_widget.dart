import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AppBar(
              title: SvgPicture.asset("assets/logo.svg"),
              centerTitle: true,
            ),
          );
}
