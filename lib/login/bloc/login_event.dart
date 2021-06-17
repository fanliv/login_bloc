import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginPressEvent extends LoginEvent {
  final String username, password;
  final bool isError;
  LoginPressEvent(this.username, this.password, this.isError);
  @override
  List<Object?> get props => [username, password, isError];
}
