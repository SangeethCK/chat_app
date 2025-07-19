part of 'chat_bloc.dart';

class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetChatEvent extends ChatEvent {
  final int custId;
  final int userId;
  const GetChatEvent({required this.custId, required this.userId});
}
