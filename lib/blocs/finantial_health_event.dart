part of 'finantial_health_bloc.dart';

@immutable
abstract class FinantialHealthEvent {}

class FinantialHealthStart extends FinantialHealthEvent {}

// New event for calculating the financial health score
class CalculateFinantialHealthScore extends FinantialHealthEvent {
  final int annualIncome;
  final int monthlyCosts;

  CalculateFinantialHealthScore({required this.annualIncome, required this.monthlyCosts});
}
