part of 'finantial_health_bloc.dart';

@immutable
abstract class FinantialHealthState {}

class FinantialHealthInitial extends FinantialHealthState {}

class FinantialHealthTest extends FinantialHealthState {}

class FinantialHealthFinished extends FinantialHealthState {
  final UserFinantialStatus result;
  FinantialHealthFinished({required this.result});
}
