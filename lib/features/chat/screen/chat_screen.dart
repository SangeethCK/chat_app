import 'dart:developer';

import 'package:chat_app/features/chat/bloc/chat_bloc.dart';
import 'package:chat_app/shared/app/enums/api_fetch_status.dart';
import 'package:chat_app/shared/constant/colors.dart';
import 'package:chat_app/shared/widgets/images/network_image.dart';
import 'package:chat_app/shared/widgets/shimmer/shimer_card.dart';
import 'package:chat_app/shared/widgets/text_fields/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          backgroundColor: const Color(0xFFF5F5F5),
          appBar: _buildAppBar(context, arguments),
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
          return _buildMessageBubble(
            message: message.message ?? '',
            date: DateFormat('HH:mm').format(message.sentAt ?? DateTime.now()),
            // isMe: message.currentUser ?? true,
            // isDelivered: message.isDelivered ?? false,
            // isRead: message.isRead ?? false,
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
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Start the conversation!',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    Map<String, dynamic>? arguments,
  ) {
    log("Status read${arguments?['is_online']}");
    return PreferredSize(
      preferredSize: Size.fromHeight(80.h),
      child: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 2,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              children: [
                _buildCircularButton(
                  icon: Icons.arrow_back,
                  onTap: () => Navigator.pop(context),
                ),
                12.horizontalSpace,
                Hero(
                  tag: 'chat_avatar',
                  child: networkImage(
                    arguments?['profileImage'],
                    height: 50.w,
                    width: 50.w,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        arguments?['name'] ?? 'Unknown User',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            arguments?['is_online'] == true
                                ? 'Online'
                                : 'Last seen recently',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: arguments?['is_online'] == true
                                  ? const Color(0xFF4CAF50)
                                  : Colors.grey[600],
                            ),
                          ),
                          4.horizontalSpace,
                          if (arguments?['is_online'] == true)
                            Container(
                              width: 8.r,
                              height: 8.r,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF4CAF50,
                                    ).withOpacity(0.3),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20.sp, color: Colors.black87),
      ),
    );
  }

  Widget _buildTodayLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.r),
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
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildMessageBubble({
    String? message,
    String? date,
    bool isMe = true,
    bool isDelivered = false,
    bool isRead = false,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(
        bottom: 16.h,
        left: isMe ? 50.w : 0,
        right: isMe ? 0 : 50.w,
      ),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              gradient: isMe
                  ? const LinearGradient(
                      colors: [Color(0xFFFF6B9D), Color(0xFFFF4081)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isMe ? null : Colors.grey[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
                bottomLeft: Radius.circular(isMe ? 18.r : 4.r),
                bottomRight: Radius.circular(isMe ? 4.r : 18.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              message ?? '',
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                date ?? '',
                style: TextStyle(fontSize: 11.sp, color: Colors.grey[500]),
              ),
              if (isMe) ...[
                SizedBox(width: 4.w),
                Icon(
                  isRead
                      ? Icons.done_all
                      : isDelivered
                      ? Icons.done_all
                      : Icons.done,
                  size: 14.sp,
                  color: isRead ? Colors.blue : Colors.grey[500],
                ),
              ],
            ],
          ),
        ],
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

                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: GestureDetector(
                      onTap: () {
                        // Handle attachment
                      },
                      child: Icon(
                        Icons.attach_file,
                        size: 20.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(4.r),
                    child: GestureDetector(
                      onTap: _messageController.text.trim().isNotEmpty
                          ? () {
                              // Send message
                              _sendMessage();
                            }
                          : null,
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          gradient: _messageController.text.trim().isNotEmpty
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFFFF6B9D),
                                    Color(0xFFFF4081),
                                  ],
                                )
                              : null,
                          color: _messageController.text.trim().isEmpty
                              ? Colors.grey[300]
                              : null,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.send,
                          size: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  hintText: 'Type a message...',
                  onChanged: (value) {
                    setState(() {}); // Rebuild to update send button state
                  },
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
      // Add your send message logic here
      // context.read<ChatBloc>().add(SendMessageEvent(message: _messageController.text));
      _messageController.clear();
      setState(() {});
    }
  }
}
