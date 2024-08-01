import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goldenchaincoin/pages/buy/model/BuyModel.dart';
import 'package:goldenchaincoin/pages/buy/model/BuyModelResponse.dart';

part 'buy_state.dart';

class BuyCubit extends Cubit<BuyState> {
  BuyCubit() : super(BuyInitial());

  void buyTokenGcc(BuyModel buyModel) {
    try {
      emit(LoadingState());
      // => SEND TO REQUEST
      final buyModelReponse = BuyModelResponse(
          status: "status", description: "description", code: 201);
      emit(LoadedState(buyModelReponse));
    } catch (e) {
      emit(ErrorState());
    }
  }


   stimulationLoad () async {
    try {
      emit(LoadingState());
        await _waitPrint(6);
      emit(Loaded());
    } catch (e) {
      emit(ErrorState());
    }
  }

  Future<void> _waitPrint(int timer) async {
  await Future.delayed( Duration(seconds: timer));
}

}
