import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/login/bloc/login_event.dart';
import 'package:login_bloc/login/bloc/login_state.dart';
import 'package:login_bloc/login/ui/login_screen.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPressEvent) {
      yield LoginLoadingState();
      await Future.delayed(Duration(seconds: 2));

      if (event.isError) {
        yield LoginErrorState();
      } else
        yield LoginSuccessState();
    }
  }
}
