import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/home_screen/ui/home_screen.dart';
import 'package:login_bloc/login/bloc/login_bloc.dart';
import 'package:login_bloc/login/ui/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
      home: BlocProvider(
        create: (_) => LoginBloc(),
        child: LoginScreen(),
      ),
    );
  }
}
