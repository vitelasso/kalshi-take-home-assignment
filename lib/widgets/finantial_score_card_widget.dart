import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kalshi_tha/blocs/finantial_health_bloc.dart';
import 'package:kalshi_tha/constants/constants.dart';
import 'package:kalshi_tha/models/user_finantial_status_model.dart';

class FinantialScoreCardWidget extends StatelessWidget {
  final UserFinantialStatus userFinantialStatus;
  const FinantialScoreCardWidget({Key? key, required this.userFinantialStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SvgPicture.asset("assets/icon.svg"),
                const SizedBox(height: 24),
                SvgPicture.asset(
                    "assets/${userFinantialStatus.score.toString().toLowerCase()}.svg"),
                const SizedBox(height: 24),
                Text(
                  Constants.strFinantialWellnessScoreTitleMap[
                          userFinantialStatus.score.toString()] ??
                      'Unknown',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  Constants.strFinantialWellnessScoreSubTitleMap[
                          userFinantialStatus.score.toString()] ??
                      'Unknown',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<FinantialHealthBloc>(context)
                            .add(FinantialHealthStart()),
                    style: ButtonStyle(
                      shape: WidgetStateProperty.resolveWith<
                          RoundedRectangleBorder>(
                        (Set<WidgetState> states) {
                          return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(96),
                            side: BorderSide(
                                color: Theme.of(context).highlightColor,
                                width: 2),
                          );
                        },
                      ),
                    ),
                    child: Text(
                      Constants.strCommonReturn,
                      style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
