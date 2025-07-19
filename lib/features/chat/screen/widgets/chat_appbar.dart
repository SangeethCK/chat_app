import 'package:chat_app/shared/constant/colors.dart';
import 'package:chat_app/shared/theme/font_palette.dart';
import 'package:chat_app/shared/widgets/images/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
  Map<String, dynamic>? arguments,
) {
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
                      style: FontPalette.hW600S16.copyWith(color: kTextDrk),

                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Text(
                          arguments?['is_online'] == true
                              ? 'Online'
                              : 'Offline',
                          style: FontPalette.hW600S11.copyWith(
                            color: arguments?['is_online'] == true
                                ? const Color(0xFF4CAF50)
                                : kTextColor,
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
