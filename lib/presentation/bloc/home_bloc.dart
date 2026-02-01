import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<FetchHomeEvent>(_onFetchHome);
    on<RefreshHomeEvent>(_onRefreshHome);
  }

  Future<void> _onFetchHome(
    FetchHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final home = await repository.getHome();
      emit(HomeLoaded(home));
    } catch (e) {
      emit(HomeError('Failed to load home data'));
    }
  }

  Future<void> _onRefreshHome(
    RefreshHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final home = await repository.getHome();

      emit(HomeLoaded(home));
    } catch (e) {
      emit(HomeError('Refresh failed'));
    }
  }
}
