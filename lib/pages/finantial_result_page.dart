import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kalshi_tha/blocs/finantial_health_bloc.dart';
import 'package:kalshi_tha/constants/constants.dart';
import 'package:kalshi_tha/pages/home_page.dart';
import 'package:kalshi_tha/widgets/app_bar_widget.dart';
import 'package:kalshi_tha/widgets/finantial_score_card_widget.dart';

class FinantialResultPage extends StatelessWidget {
  const FinantialResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0), // Set this height
          child: AppBarWidget()
        ),
        body: BlocConsumer<FinantialHealthBloc, FinantialHealthState>(
          builder: (context, state) {
            if (state is FinantialHealthFinished) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                   Align(
                    alignment: Alignment.center,
                     child: Text(Constants.strFinantialWellnessScore,
                                       key: const Key('home_page_app_title'),
                                       textAlign: TextAlign.center,
                                       style: TextStyle(color: Theme.of(context).highlightColor, fontSize: 18, fontWeight: FontWeight.w400),),
                   ),
                  const SizedBox(height: 32),
                  FinantialScoreCardWidget(userFinantialStatus: state.result),
                  const SizedBox(height: 24), 
                Column(
                  children: [
                    SvgPicture.asset("assets/lock_icon.svg"),
                    const SizedBox(height: 12),
                    const Text(Constants.strFinancialEncryptedInfo,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF708797), fontSize: 12, fontWeight: FontWeight.w400),),               
                  ],
              ),
                ],
              );
            }
            return Container();
          },
          listener: (context, state) {
            if (state is FinantialHealthTest) {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
            }
          },
        ),
      ),
    );
  }
}
