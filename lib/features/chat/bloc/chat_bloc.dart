import 'package:bloc/bloc.dart';
import 'package:chat_app/features/chat/domain/models/chat_response/chat_messgae_response.dart';
import 'package:chat_app/features/chat/domain/repositories/chat_repositories.dart';
import 'package:chat_app/shared/app/enums/api_fetch_status.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepositories _chatRepositories;
  ChatBloc(this._chatRepositories) : super(ChatInitial()) {
    on<GetChatEvent>(_getChat);
  }
  //=-=-=-=-=-= GET CHAT  =-=-=-=-=
  Future<void> _getChat(GetChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(isChat: ApiFetchStatus.loading));
    final res = await _chatRepositories.getChat(event.custId, event.userId);
    if (res.data != null) {
      emit(state.copyWith(isChat: ApiFetchStatus.success, chatList: res.data));
    }
    emit(state.copyWith(isChat: ApiFetchStatus.failed));
  }
}
