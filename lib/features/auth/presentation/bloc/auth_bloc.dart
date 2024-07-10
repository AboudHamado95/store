import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/core/utils/app_exports.dart';
import 'package:store_app/features/auth/data/models/auth_model.dart';
import 'package:store_app/features/auth/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(Loading());
      final result = await repository.login(param: event.param);
      result.fold(
        (failure) => emit(Error(message: failure.error ?? "Something wrong")),
        (success) => emit(
          SuccessLoginState(model: success),
        ),
      );
    });
  }
}
