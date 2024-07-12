import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goldenchaincoin/pages/auth/model/authModel.dart';
import 'package:goldenchaincoin/pages/auth/model/authResponseModel.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  void login(AuthModel authModel) async {
  try {
    emit(LoadingState());
    final authResponseModel = AuthResponseModel(status: "status", description: "description", code: 200);
    emit(LoadedState(authResponseModel));
  } catch (e) {
    emit(ErrorState());
  }
}

}
