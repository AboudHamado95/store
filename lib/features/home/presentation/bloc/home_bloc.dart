import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/data/models/offers_model.dart';
import 'package:store_app/features/home/data/repositories/offers_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  OffersModel? model;
  OffersRepository repository = OffersRepository();

  HomeBloc() : super(HomeInitial()) {
    on<GetOffersEvent>((event, emit) async {
      emit(Loading());
      final result = await repository.getOffers();
      result.fold(
        (failure) => emit(Error(message: failure.error ?? "Something wrong")),
        (success) => emit(
          SuccessGetOffersState(model: success),
        ),
      );
    });
  }
}
