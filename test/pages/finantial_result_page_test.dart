import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi_tha/blocs/finantial_health_bloc.dart';
import 'package:kalshi_tha/models/user_finantial_status_model.dart';
import 'package:kalshi_tha/pages/finantial_result_page.dart';
import 'package:mocktail/mocktail.dart';

class FinantialHealthBlocMock
    extends MockBloc<FinantialHealthEvent, FinantialHealthState>
    implements FinantialHealthBloc {}

class FinantialHealthStateFake extends Fake implements FinantialHealthState {}

class FinantialHealthEventFake extends Fake implements FinantialHealthEvent {}

void main() {
  group('FinantialResultPage renders correctly when', () {
    setUpAll(() {
      registerFallbackValue(FinantialHealthStateFake());
      registerFallbackValue(FinantialHealthEventFake());
    });

    testWidgets(
      'user Finantial Health is Healthy',
      (tester) async {
        final mockGameBloc = FinantialHealthBlocMock();
        when(() => mockGameBloc.state).thenReturn(
          FinantialHealthFinished(
              result:
                  UserFinantialStatus(score: 'HEALTHY')), // the desired state
        );

        await tester.pumpWidget(BlocProvider<FinantialHealthBloc>(
          create: (context) => mockGameBloc,
          child: const MaterialApp(
              home: Scaffold(
            body: FinantialResultPage(),
          )),
        ));

        await tester.pumpAndSettle();

        final youWonTextFinder = find.text(
            'Congratulations!'); // We should done this by key, this was just a way of
        // showcasing different ways of finding
        expect(youWonTextFinder, findsOneWidget);

        final youLoseTextFinder = find.text('There is room for improvement.');
        expect(youLoseTextFinder, findsNothing);
      },
    );

    testWidgets(
      'user Finantial Health is Medium',
      (tester) async {
        final mockGameBloc = FinantialHealthBlocMock();
        when(() => mockGameBloc.state).thenReturn(
          FinantialHealthFinished(
              result:
                  UserFinantialStatus(score: 'MEDIUM')), // the desired state
        );

        await tester.pumpWidget(BlocProvider<FinantialHealthBloc>(
          create: (context) => mockGameBloc,
          child: const MaterialApp(
              home: Scaffold(
            body: FinantialResultPage(),
          )),
        ));

        await tester.pumpAndSettle();

        final youWonTextFinder = find.text(
            'Congratulations!'); // We should done this by key, this was just a way of
        // showcasing different ways of finding
        expect(youWonTextFinder, findsNothing);

        final youLoseTextFinder = find.text('There is room for improvement.');
        expect(youLoseTextFinder, findsOneWidget);
      },
    );

    testWidgets(
      'FinantialHealthBloc emits FinantialHealthTest state',
      (tester) async {
        final mockGameBloc = FinantialHealthBlocMock();
        when(() => mockGameBloc.state).thenReturn(
          FinantialHealthTest(), // the desired state
        );

        await tester.pumpWidget(BlocProvider<FinantialHealthBloc>(
          create: (context) => mockGameBloc,
          child: const MaterialApp(
              home: Scaffold(
            body: FinantialResultPage(),
          )),
        ));

        await tester.pumpAndSettle();

        final youWonTextFinder = find.text(
            'Congratulations!'); // We should done this by key, this was just a way of
        // showcasing different ways of finding
        expect(youWonTextFinder, findsNothing);

        final youLoseTextFinder = find.text('There is room for improvement.');
        expect(youLoseTextFinder, findsNothing);
      },
    );
  });
}
