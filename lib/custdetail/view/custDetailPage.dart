import 'package:flutter/material.dart';
import 'package:server_repository/models.dart';

class CustDetailPage extends StatelessWidget {
  const CustDetailPage({super.key, required this.customer});

  final CBpartner customer;

  static Route<void> route(CBpartner customer) {
    return MaterialPageRoute<void>(builder: (_) =>  CustDetailPage(customer: customer,));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("CUSTOMER DETAILS : ",style: TextStyle(fontSize: 36 , fontWeight: FontWeight.bold),),
            const SizedBox(height: 24,),
            Text("Name : ${customer.name}",style: const TextStyle(fontSize: 21 , fontWeight: FontWeight.w600),),
            const SizedBox(height: 12,),
            Text("Phone No : ${customer.phone}",style: const TextStyle(fontSize: 21 , fontWeight: FontWeight.w600),),
            const SizedBox(height: 12,),
            Text("Group Name : ${customer.cBPGroupID?.identifier}",style: const TextStyle(fontSize: 21 , fontWeight: FontWeight.w600),),
            const SizedBox(height: 12,),
            Text("Rate Per Month : Rs.${customer.ratePerMonth}",style: const TextStyle(fontSize: 21 , fontWeight: FontWeight.w600),),
            const SizedBox(height: 12,),
            Text("Paid Till Month : ${customer.toPeriodID?.identifier}",style: const TextStyle(fontSize: 21 , fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }
}
