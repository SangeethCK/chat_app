import 'package:chat_app/features/home/domain/models/customer/customer.dart';
import 'package:chat_app/features/home/domain/repositories/home_repositories.dart';
import 'package:chat_app/shared/api/endpoint/api_endpoints.dart';
import 'package:chat_app/shared/api/network/network.dart';
import 'package:chat_app/shared/utilities/failures/result.dart';
import 'package:injectable/injectable.dart';
import 'package:japx/japx.dart';

@LazySingleton(as: HomeRepositories)
class HomeService implements HomeRepositories {
  @override
  Future<ResponseResult<List<Customer>>> getUser() async {
    final res = await NetworkProvider().get(ApiEndpoints.users);
    switch (res.statusCode) {
      case 200:
        final parsedData = Japx.decode(res.data, includeList: 'userSettings');
        final customers = (parsedData['data'] as List<dynamic>)
            .map(
              (customerData) =>
                  Customer.fromJson(customerData as Map<String, dynamic>),
            )
            .toList();
        return ResponseResult(data: customers);
      default:
        throw Exception('${res.statusCode}');
    }
  }
}
