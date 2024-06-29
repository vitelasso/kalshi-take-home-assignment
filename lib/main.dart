import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi_tha/pages/home_page.dart';

import 'package:kalshi_tha/constants/constants.dart';

import 'blocs/finantial_health_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinantialHealthBloc(),
      child: MaterialApp(
        title: Constants.strAppTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1E2A32),
              secondary: Color(0xFF4D6475),
            ),
            appBarTheme: const AppBarTheme(
              color: Color(0xFFFFFFFF),
            ),
            highlightColor: const Color(0xFF001C95)),
        home: const HomePage(),
      ),
    );
  }
}
