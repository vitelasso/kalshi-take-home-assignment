import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kalshi_tha/blocs/finantial_health_bloc.dart';
import 'package:kalshi_tha/constants/constants.dart';
import 'package:kalshi_tha/pages/finantial_result_page.dart';

class FinantialTestCardWidget extends StatefulWidget {
  const FinantialTestCardWidget({Key? key}) : super(key: key);

  @override
  State<FinantialTestCardWidget> createState() => _FinantialTestCardWidgetState();
}

class _FinantialTestCardWidgetState extends State<FinantialTestCardWidget> {
  final annualIncomeController = TextEditingController();
  final monthlyCostsController = TextEditingController();
  final buttonEnabled = ValueNotifier<bool>(false);
  late FinantialHealthBloc finantialHealthBloc;
  late StreamSubscription<FinantialHealthState> _subscription;

  @override
  void initState() {
    super.initState();
    annualIncomeController.addListener(() {
      _formatInput(annualIncomeController);
      _updateButtonState();
    });
    monthlyCostsController.addListener(() {
      _formatInput(monthlyCostsController);
      _updateButtonState();
    });
    finantialHealthBloc = BlocProvider.of<FinantialHealthBloc>(context);
    _subscription = finantialHealthBloc.stream.listen((state) {
          if (state is FinantialHealthFinished) {
            // Navigate to the new screen when FinantialHealthFinished is emitted
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FinantialResultPage()),
            );
          }
        });
  }

  @override
  void dispose() {
     annualIncomeController.removeListener(() {
      _formatInput(annualIncomeController);
      _updateButtonState();
    });
     monthlyCostsController.removeListener(() {
      _formatInput(monthlyCostsController);
      _updateButtonState();
    });
    annualIncomeController.dispose();
    monthlyCostsController.dispose();
    _subscription.cancel();
    super.dispose();
  }

  void _formatInput(TextEditingController controller) {
    String initialText = controller.text;
    initialText = initialText.replaceAll(',', '');
    if (initialText.isNotEmpty && int.tryParse(initialText) != null){
      final formattedNumber = NumberFormat("#,##0").format(int.parse(initialText));
      if (formattedNumber != controller.text) {
      controller.text = formattedNumber;
      controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
      }
    }
  }

  _updateButtonState() {
    final annualIncome = int.tryParse(annualIncomeController.text.replaceAll(',', ''));
    final monthlyCosts = int.tryParse(monthlyCostsController.text.replaceAll(',', ''));
    buttonEnabled.value = annualIncome != null && annualIncome > 0 && monthlyCosts != null && monthlyCosts > 0;
  }

  @override
  Widget build(BuildContext context) => Card(
        color:  Colors.white,
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icon.svg"),
              const SizedBox(height: 24),
              Text(
                  Constants.strFinantialWellnessTest,
                  key: const Key('finantial_test_card_title'),
                  textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                  Constants.strEnterInformation,
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 24),
              _buildTextField(context,key: 'annualIncomeController',labelText: Constants.strAnnualIncome, controller: annualIncomeController),
              const SizedBox(height: 24),
              _buildTextField(context,key: 'monthlyCostsController',labelText:  Constants.strMonthlyCosts, controller: monthlyCostsController),
              const SizedBox(height: 24),
               ValueListenableBuilder<bool>(
          valueListenable: buttonEnabled,
          builder: (context, enabled, child) { 
            return SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed:  enabled ? _onContinueButtonPressed : null, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).highlightColor, // background color
                ),
                child: const Text(
                      Constants.strCommonContinue,
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                  ),),
            );
          } 
              ),
            ],
            ),
        ),
      );

      void _onContinueButtonPressed() async => finantialHealthBloc.add(CalculateFinantialHealthScore(annualIncome: int.parse(annualIncomeController.text.replaceAll(',', '')), monthlyCosts: int.parse(monthlyCostsController.text.replaceAll(',', ''))));

      Widget _buildTextField(BuildContext context,{required String key, required String labelText, required TextEditingController controller}) => Column(
          children: [
             Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    labelText,
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE9EEF2), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)), 
                ),
                child: TextField(
                  key: Key('${key}_input'),
                  controller: controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
                  style: const TextStyle(fontFamily: 'Rubik', fontSize: 24, fontWeight: FontWeight.w500, color: Color(0xFF4D6475)),
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    prefixStyle: TextStyle(fontFamily: 'Rubik', fontSize: 24, fontWeight: FontWeight.w500, color: Color(0xFFCBD5DC)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12.0) // Remove the default underline
                  ),
                ),
              ),
              ],
        );
}
