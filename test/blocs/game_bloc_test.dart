import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/blocs/finantial_health_bloc.dart';

class FinantialHealthBlocMock
    extends MockBloc<FinantialHealthEvent, FinantialHealthState>
    implements FinantialHealthBloc {}

class FinantialHealthStateFake extends Fake implements FinantialHealthState {}

class FinantialHealthEventFake extends Fake implements FinantialHealthEvent {}

void main() {
  group('FinantialHealthBloc', () {
    blocTest(
        'emits [FinantialHealthTest] when FinantialHealthStart Event added',
        build: () => FinantialHealthBloc(),
        act: (bloc) => bloc.add(FinantialHealthStart()),
        expect: () => [isA<FinantialHealthTest>()]);

    blocTest('emits [FinantialHealthFinished] when GameTimeOut Event added',
        build: () => FinantialHealthBloc(),
        act: (bloc) => bloc.add(CalculateFinantialHealthScore(
            annualIncome: 1000, monthlyCosts: 10)),
        expect: () => [isA<FinantialHealthFinished>()]);

    blocTest('emits [FinantialHealthFinished] when GameTimeOut Event added',
        build: () => FinantialHealthBloc(),
        act: (bloc) => bloc.add(CalculateFinantialHealthScore(
            annualIncome: 1000, monthlyCosts: 80)),
        expect: () => [isA<FinantialHealthFinished>()]);
  });
}
