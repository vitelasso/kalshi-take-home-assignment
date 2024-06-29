import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kalshi_tha/models/user_finantial_status_model.dart';

part 'finantial_health_event.dart';
part 'finantial_health_state.dart';

class FinantialHealthBloc extends Bloc<FinantialHealthEvent, FinantialHealthState> {
  FinantialHealthBloc() : super(FinantialHealthInitial()) {
    on<FinantialHealthStart>((event, emit) => emit(FinantialHealthTest()));

    // Handle the new event
    on<CalculateFinantialHealthScore>((event, emit) {
      double annualCosts = event.monthlyCosts * 12;
      double netIncome = event.annualIncome * 0.92; // After 8% tax
      late String score;

      if (annualCosts <= 0.25 * netIncome) {
        score = 'HEALTHY';
      } else if (annualCosts > 0.25 * netIncome && annualCosts <= 0.75 * netIncome) {
        score = 'MEDIUM';
      } else {
        score = 'LOW';
      }

      emit(FinantialHealthFinished(result: UserFinantialStatus(score: score)));
    });
  }
}
