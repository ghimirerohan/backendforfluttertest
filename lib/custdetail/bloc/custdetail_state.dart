

import 'package:equatable/equatable.dart';
import 'package:server_repository/models.dart';

import '../repo/custdetailRepo.dart';

class CustDetailState extends Equatable{

  final CustDetailAppStatus status;
  final CBpartner? customer ;

  CustDetailState({required this.status,  this.customer});

  CustDetailState copyWith({
    CustDetailAppStatus? status
    , CBpartner? customer
}){
    return CustDetailState(status: status ?? this.status , customer:  customer ?? this.customer);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status , customer];



}