import 'package:chat_app/features/home/domain/models/customer/customer.dart';
import 'package:chat_app/shared/utilities/failures/result.dart';

abstract class HomeRepositories {
  Future<ResponseResult<List<Customer>>> getUser();
}
