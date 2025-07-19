part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final ApiFetchStatus? isChat;
  final List<ChatMessage> chatList;
  const ChatState({this.isChat, this.chatList = const []});

  ChatState copyWith({
    ApiFetchStatus? isChat,
    List<ChatMessage>? chatList,
  }) {
    return ChatState(
      isChat: isChat ?? this.isChat,
      chatList: chatList ?? this.chatList,
    );
  }

  @override
  List<Object> get props => [isChat ?? '', chatList];
}

final class ChatInitial extends ChatState {}
