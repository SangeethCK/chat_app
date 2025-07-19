import 'package:chat_app/features/chat/domain/models/chat_response/chat_messgae_response.dart';
import 'package:chat_app/features/chat/domain/repositories/chat_repositories.dart';
import 'package:chat_app/shared/api/endpoint/api_endpoints.dart';
import 'package:chat_app/shared/api/network/network.dart';
import 'package:chat_app/shared/utilities/failures/result.dart';
import 'package:injectable/injectable.dart';
import 'package:japx/japx.dart';

@LazySingleton(as: ChatRepositories)
class ChatService implements ChatRepositories {
  @override
  Future<ResponseResult<List<ChatMessage>>> getChat(
    int custId,
    int userId,
  ) async {
    final res = await NetworkProvider().get(
      ApiEndpoints.chatMessage(custId, userId),
    );
    switch (res.statusCode) {
      case 200:
        final parsedData = Japx.decode(res.data, includeList: 'sender');
        final customers = (parsedData['data'] as List<dynamic>)
            .map(
              (customerData) =>
                  ChatMessage.fromJson(customerData as Map<String, dynamic>),
            )
            .toList();
        return ResponseResult(data: customers);
      default:
        throw Exception('${res.statusCode}');
    }
  }
}
