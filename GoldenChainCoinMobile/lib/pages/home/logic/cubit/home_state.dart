part of 'home_cubit.dart';

abstract class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
    @override
    List<Object> get props => [];
}

class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  LoadedState(this.homeInfo);
  
  final HomeModel homeInfo;
  
  @override
  List<Object> get props => [homeInfo];

}

class ErrorState extends HomeState {
  @override
  List<Object> get props => [];
}