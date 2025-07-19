import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

CachedNetworkImage networkImage(
  String image, {
  double? height,
  double? width,
}) => CachedNetworkImage(
  height: height ?? 60.h,
  width: width ?? 60.w,
  imageUrl: image,
  imageBuilder: (context, imageProvider) =>
      CircleAvatar(radius: 28.r, backgroundImage: imageProvider),
  placeholder: (context, url) => Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: CircleAvatar(radius: 30.r, backgroundColor: Colors.white),
  ),
  errorWidget: (context, url, error) => CircleAvatar(
    radius: 28.r,
    backgroundColor: Colors.grey[200],
    child: Icon(Icons.person, size: 26.sp, color: Colors.grey[600]),
  ),
);
