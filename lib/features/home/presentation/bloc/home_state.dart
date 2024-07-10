part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class Empty extends HomeState {
  @override
  List<Object> get props => [];
}

class Loading extends HomeState {
  @override
  List<Object> get props => [];
}

class Error extends HomeState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessGetOffersState extends HomeState {
  final OffersModel model;
  const SuccessGetOffersState({required this.model});
  @override
  List<Object> get props => [model];
}
