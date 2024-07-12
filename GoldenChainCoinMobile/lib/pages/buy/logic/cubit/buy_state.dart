part of 'buy_cubit.dart';

abstract class BuyState extends Equatable {}

final class BuyInitial extends BuyState {
  @override
  List<Object> get props => [];
}

class LoadingState extends BuyState {
  @override
  List<Object> get props => [];
}

class LoadedState extends BuyState {
  LoadedState(this.buyModelResponse);
  
  final BuyModelResponse buyModelResponse;
  
  @override
  List<Object> get props => [buyModelResponse];

}

class ErrorState extends BuyState {
  @override
  List<Object> get props => [];
}