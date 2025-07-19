import 'package:chat_app/features/auth/bloc/auth_bloc.dart';
import 'package:chat_app/shared/app/enums/api_fetch_status.dart';
import 'package:chat_app/shared/app/helper.dart';
import 'package:chat_app/shared/constant/colors.dart';
import 'package:chat_app/shared/routes/routes.dart';
import 'package:chat_app/shared/theme/font_palette.dart';
import 'package:chat_app/shared/widgets/appbar/appbar.dart';
import 'package:chat_app/shared/widgets/buttons/custom_material_button.dart';
import 'package:chat_app/shared/widgets/padding/main_padding.dart';
import 'package:chat_app/shared/widgets/text_fields/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScren extends StatelessWidget {
  SignInScren({super.key});
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isSignIn == ApiFetchStatus.success) {
            Navigator.pushNamed(
              context,
              routeOtp,
              arguments: {"mobile": phoneController.text},
            );
          }
        },
        builder: (context, state) {
          return MainPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Enter your phone \nnumber',
                    style: FontPalette.hW600S28.copyWith(
                      color: Color(0XFF2E0E16),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                10.verticalSpace,
                TextFeildWidget(
                  textInputType: TextInputType.number,
                  controller: phoneController,
                  hight: 48.h,
                  fillColor: kWhite,
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: kDarkBorder),
                  ),
                  prefix: Container(
                    margin: EdgeInsets.only(left: 16.w, right: 0.w),
                    alignment: Alignment.centerLeft,
                    width: 80.w,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/cellphone.svg'),
                        Text('+91', style: FontPalette.hW400S14),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color(0XFFD5CFD0),
                          size: 28,
                        ),
                        Container(
                          height: 25,
                          width: 1,
                          color: Color(0XFFD5CFD0),
                        ),
                      ],
                    ),
                  ),
                  hintText: 'Enter mobile number',
                  hintStyle: FontPalette.hW500S16.copyWith(color: kHintColor),
                ),
                10.verticalSpace,
                Text(
                  'Fliq will send you a text with a verification code.',
                  style: FontPalette.hW400S14.copyWith(
                    color: Color(0XFF583E45),
                  ),
                ),
                Spacer(),
                CustomMaterialBtton(
                  isLoading: state.isSignIn == ApiFetchStatus.loading,
                  onPressed: () {
                    final validationError = Helper.validatePhoneNumber(
                      phoneController.text,
                    );
                    if (validationError != null) {
                      // Helper.showValidationError(context, validationError);
                      
                    } else {
                      context.read<AuthBloc>().add(
                        SigInEvent(phoneController.text),
                      );
                    }
                  },
                  buttonText: 'Next',
                ),
                25.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}
