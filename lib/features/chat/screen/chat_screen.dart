import 'package:chat_app/features/chat/bloc/chat_bloc.dart';
import 'package:chat_app/features/chat/screen/widgets/build_message_bubble.dart';
import 'package:chat_app/features/chat/screen/widgets/chat_appbar.dart';
import 'package:chat_app/shared/app/enums/api_fetch_status.dart';
import 'package:chat_app/shared/constant/colors.dart';
import 'package:chat_app/shared/theme/font_palette.dart';
import 'package:chat_app/shared/widgets/shimmer/shimer_card.dart';
import 'package:chat_app/shared/widgets/text_fields/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kLightColor,
          appBar: buildAppBar(context, arguments),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(34.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildTodayLabel(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: state.isChat == ApiFetchStatus.loading
                              ? _buildShimmerMessages()
                              : _buildChatMessages(state),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildInputArea(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShimmerMessages() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: 8,
      itemBuilder: (context, index) {
        final isMe = index % 3 != 0;
        return buildShimmerMessageBubble(isMe: isMe);
      },
    );
  }

  Widget _buildChatMessages(ChatState state) {
    if (state.chatList.isEmpty) {
      return _buildEmptyChat();
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: state.chatList.length,
        reverse: true,
        itemBuilder: (context, i) {
          final message = state.chatList[i];
          return BuildMessageBubble(
            message: message.message ?? '',
            date: DateFormat(
              'hh:mm a',
            ).format(message.sentAt ?? DateTime.now()),
            // isMe: message.currentUser ?? true,
            // isDelivered: message.isDelivered ?? false,
            isRead: true,
          );
        },
      ),
    );
  }

  Widget _buildEmptyChat() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 80.sp, color: Colors.grey[300]),
          SizedBox(height: 20.h),
          Text(
            'No messages yet',
            style: FontPalette.hW600S16.copyWith(color: Colors.grey[600]),
          ),
          SizedBox(height: 8.h),
          Text(
            'Start the conversation!',
            style: FontPalette.hW400S13.copyWith(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Color(0XFFF0F0F0),
        borderRadius: BorderRadius.circular(45.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        'Today',
        style: FontPalette.hW400S10.copyWith(color: kTextColor),
      ),
    );
  }

  Widget _buildInputArea(ChatState state) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
          child: Row(
            children: [
              Expanded(
                child: TextFeildWidget(
                  controller: _messageController,
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: const BorderSide(color: Color(0XFFD5CFD0)),
                  ),

                  suffixIcon: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: GestureDetector(
                      onTap: _messageController.text.trim().isNotEmpty
                          ? () {
                              _sendMessage();
                            }
                          : null,
                      child: SvgPicture.asset('assets/images/send.svg'),
                    ),
                  ),
                  hintText: 'Type a message...',
                  hintStyle: FontPalette.hW400S13.copyWith(color: kTextColor),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      // context.read<ChatBloc>().add(SendMessageEvent(message: _messageController.text));
      _messageController.clear();
    }
  }
}
