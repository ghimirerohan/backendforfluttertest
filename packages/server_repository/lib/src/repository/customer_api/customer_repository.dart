
import 'package:server_repository/models.dart';

import '../../../api_response.dart';

abstract class CustomerRepository{
  Future<ApiResponse<List<CBpartner>>?> getCustomer(int c_location_id);

  Future<ApiResponse<List<CBpartner>>?> getCustomerFromSearchKey(String Key);

  Future<ApiResponse<CBpartner>> postCustomer(CBpartner data);
}