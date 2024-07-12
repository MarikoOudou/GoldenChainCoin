part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AuthState {
  LoadedState(this.authResponseModel);
  
  final AuthResponseModel authResponseModel;
  
  @override
  List<Object> get props => [authResponseModel];

}

class ErrorState extends AuthState {
  @override
  List<Object> get props => [];
}