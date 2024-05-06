

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:nextera_customer_info/custdetail/bloc/custdetail_event.dart';
import 'package:nextera_customer_info/custdetail/bloc/custdetail_state.dart';
import 'package:nextera_customer_info/custdetail/repo/custdetailRepo.dart';
import 'package:server_repository/server_repository.dart';

class CustDetailBloc extends Bloc<CustDetailEvent , CustDetailState>{
  CustDetailBloc({required CustDetailRepo repo})
    : this._repo = repo,
  super(CustDetailState(status: CustDetailAppStatus.unknown)){
    on<CustDetailStatusChangedEvent>(_onStatusChanged);
    _StatusSubscription = _repo.status.listen(
            (status) => add(CustDetailStatusChangedEvent(status: status))
    );
  }

  @override
  Future<void> close() {
    _StatusSubscription.cancel();
    return super.close();
  }

  final CustDetailRepo _repo;
  late StreamSubscription<CustDetailAppStatus>
  _StatusSubscription;

  Future<void> _onStatusChanged(CustDetailStatusChangedEvent event , Emitter<CustDetailState> emit) async{
    if(event.status ==  CustDetailAppStatus.valid){
      try{
        CBpartner? model = await _repo.getCustomerModel();
        return emit(state.copyWith(status: model != null
            ? CustDetailAppStatus.valid : CustDetailAppStatus.invalid,
            customer: model
        ));
      }catch(e, printstack){
        return emit(state.copyWith(status: CustDetailAppStatus.error));
      }

    }
    return emit(state.copyWith(status: event.status));
  }

}