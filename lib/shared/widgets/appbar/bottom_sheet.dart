// import 'package:baqala_app/features/home/bloc/home_bloc.dart';
// import 'package:baqala_app/shared/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// void showCustomBottomSheet(BuildContext context, Widget child) {
//   context.read<HomeBloc>().add(ToggleBottomSheetVisibilityEvent(true));
//   showModalBottomSheet(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(12.r),
//         topRight: Radius.circular(12.r),
//       ),
//     ),
//     backgroundColor: kWhite,
//     context: context,
//     isScrollControlled: true,
//     isDismissible: true,
//     enableDrag: true,
//     builder: (context) => child,
//   ).whenComplete(() {
//     context.read<HomeBloc>().add(ToggleBottomSheetVisibilityEvent(false));
//   });
// }
