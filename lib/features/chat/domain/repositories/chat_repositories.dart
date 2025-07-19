import 'package:chat_app/features/chat/domain/models/chat_response/chat_messgae_response.dart';
import 'package:chat_app/shared/utilities/failures/result.dart';

abstract class ChatRepositories {
  Future<ResponseResult<List<ChatMessage>>> getChat(int custId, int userId);
}
