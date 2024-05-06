
import '../repo/custdetailRepo.dart';

abstract class CustDetailEvent {
  const CustDetailEvent();
}

final class CustDetailStatusChangedEvent extends CustDetailEvent{

  final CustDetailAppStatus status;

  CustDetailStatusChangedEvent({required this.status});
}