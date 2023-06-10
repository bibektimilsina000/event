part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserSignUpLoading extends UserState {}

class UserSignUpSucess extends UserState {}

class UserSignUpError extends UserState {
  final String message;
  const UserSignUpError(this.message);
}

class UserLoginLoading extends UserState {}

class UserLoginSucess extends UserState {}

class UserLoginError extends UserState {
  final String message;
  const UserLoginError(this.message);
}
