import 'package:chat_app/shared/constant/colors.dart';
import 'package:chat_app/shared/theme/font_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildMessageBubble extends StatelessWidget {
  final String? message;
  final String? date;
  final bool? isMe;
  final bool? isDelivered;
  final bool? isRead;
  const BuildMessageBubble({
    super.key,
    this.isMe = true,
    this.isDelivered = false,
    this.isRead = false,
    this.date,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(
        bottom: 16.h,
        left: isMe ?? false ? 50.w : 0,
        right: isMe ?? false ? 0 : 50.w,
      ),
      child: Column(
        crossAxisAlignment: isMe ?? false
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              gradient: isMe ?? false
                  ? const LinearGradient(
                      colors: [Color(0xFFFF6B9D), Color(0xFFFF4081)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isMe ?? false ? null : Colors.grey[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(12.r),
                bottomLeft: Radius.circular(isMe ?? false ? 18.r : 4.r),
                bottomRight: Radius.circular(isMe ?? false ? 0.r : 18.r),
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
              style: FontPalette.hW400S14.copyWith(
                color: isMe ?? false ? kWhite : Colors.black87,
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
              if (isMe ?? false) ...[
                SizedBox(width: 4.w),
                Icon(
                  isRead ?? true
                      ? Icons.done_all
                      : isDelivered ?? false
                      ? Icons.done_all
                      : Icons.done,
                  size: 14.sp,
                  color: isRead ?? false ? kTextColor : Colors.grey[500],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
