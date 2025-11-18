import 'package:bloc/bloc.dart';
import 'package:nour_elbachir_hackathon/core/di/dependency_injection.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getData({required String endpoint}) async {
    emit(HomeLoading());

    final result = await DependencyInjection.homeRepo.fetchData(
      endpoint: endpoint,
    );

    result.fold(
      (error) => emit(HomeError(error)),
      (data) => emit(HomeSuccess(data)),
    );
  }
}
