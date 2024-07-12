import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goldenchaincoin/pages/home/data/repository.dart';
import 'package:goldenchaincoin/pages/home/model/HomeModel.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repository repository;
  HomeCubit({required this.repository}) : super(HomeInitial()){
    getInfo();
  }

  void getInfo() async {
  try {
    emit(LoadingState());
    final homeModel = await repository.readJsonForHomeModel();
    emit(LoadedState(homeModel));
  } catch (e) {
    emit(ErrorState());
  }
}
}
