part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Empty extends AuthState {
  @override
  List<Object> get props => [];
}

class Loading extends AuthState {
  @override
  List<Object> get props => [];
}

class Error extends AuthState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessLoginState extends AuthState {
  final LoginModel model;
  const SuccessLoginState({required this.model});
  @override
  List<Object> get props => [model];
}
