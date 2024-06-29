import 'package:flutter/material.dart';
import 'package:kalshi_tha/constants/constants.dart';
import 'package:kalshi_tha/widgets/app_bar_widget.dart';
import 'package:kalshi_tha/widgets/finantial_test_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0), // Set this height
          child: AppBarWidget()
        ),
        body:  SingleChildScrollView(
  child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Text(Constants.strFinantialWellnessCalculation,
                    key: const Key('home_page_app_title'),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).highlightColor, fontSize: 20, fontWeight: FontWeight.w400),),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: FinantialTestCardWidget(),
                ),
              ],
            ),
        ),
        ),
      
    );
  }
}
