import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/home_screen/ui/home_screen.dart';
import 'package:login_bloc/login/bloc/login_bloc.dart';
import 'package:login_bloc/login/bloc/login_event.dart';
import 'package:login_bloc/login/bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  static final String id = "LoginScreen";
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case LoginLoadingState:
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Loading'),
                      ],
                    ),
                  );
                },
              );
              break;
            case LoginErrorState:
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("An error has occured")));
              break;
            case LoginSuccessState:
              Navigator.of(context).pop();
              Navigator.pushNamed(context, HomeScreen.id);
              break;
            default:
              break;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    icon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
                TextButton(
                    onPressed: () {
                      if (_userController.text.isNotEmpty &&
                          _userController.text.isNotEmpty) {
                        return context.read<LoginBloc>().add(LoginPressEvent(
                            _userController.text, _passController.text, false));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Please input your user name and password first')));
                      }
                    },
                    child: Text("Login")),
              ],
            ),
          );
        },
      ),
    );
  }
}
