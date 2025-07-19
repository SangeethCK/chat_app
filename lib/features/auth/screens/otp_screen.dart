import 'dart:async';
import 'dart:developer';

import 'package:chat_app/features/auth/bloc/auth_bloc.dart';
import 'package:chat_app/shared/app/enums/api_fetch_status.dart';
import 'package:chat_app/shared/constant/colors.dart';
import 'package:chat_app/shared/constant/string/string_english.dart';
import 'package:chat_app/shared/routes/routes.dart';
import 'package:chat_app/shared/theme/font_palette.dart';
import 'package:chat_app/shared/utilities/auth/auth_utils.dart';
import 'package:chat_app/shared/widgets/appbar/appbar.dart';
import 'package:chat_app/shared/widgets/buttons/custom_material_button.dart';
import 'package:chat_app/shared/widgets/padding/main_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  Timer? _resendTimer;
  int _resendCountdown = 30;
  bool _canResend = false;
  String _enteredPin = '';

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    setState(() {
      _canResend = false;
      _resendCountdown = 30;
    });

    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_resendCountdown > 0) {
            _resendCountdown--;
          } else {
            _canResend = true;
            timer.cancel();
          }
        });
      }
    });
  }

  void _resendOtp() {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    _pinController.clear();
    setState(() {
      _enteredPin = '';
    });

    _startResendTimer();

    context.read<AuthBloc>().add(
      SendOtpEvent(mobile: arguments?['mobile'] ?? ''),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${StringConstants.newOtp}${arguments?['mobile'] ?? ''}'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
    HapticFeedback.lightImpact();
  }

  void _verifyOtp() {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (_enteredPin.length == 6) {
      context.read<AuthBloc>().add(
        VerifyOtpEvent(mobile: arguments?['mobile'] ?? '', otp: _enteredPin),
      );
      HapticFeedback.mediumImpact();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(StringConstants.completeOTP),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppbarWidget(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.isVerify != current.isVerify,
        listener: (context, state) async {
          if (state.isVerify == ApiFetchStatus.success) {
            HapticFeedback.heavyImpact();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(StringConstants.otpSucess),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1),
              ),
            );

            await Future.delayed(const Duration(milliseconds: 900));
            final access = await AuthUtils.instance.readAccessToken;
            log("Access =-=-=$access");
            Navigator.pushReplacementNamed(context, routeHome);
          } else if (state.isVerify == ApiFetchStatus.failed) {
            HapticFeedback.vibrate();
            _pinController.clear();
            setState(() {
              _enteredPin = '';
            });

            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //     content: Text('Invalid OTP. Please try again.'),
            //     backgroundColor: Colors.red,
            //     duration: Duration(seconds: 2),
            //   ),
            // );
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
                    StringConstants.enterVerifcation,
                    style: FontPalette.hW600S28.copyWith(color: kTextDrk),
                    textAlign: TextAlign.center,
                  ),
                ),
                32.verticalSpace,

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Text(
                        '${StringConstants.countryCode} ${_formatPhoneNumber(arguments?['mobile'] ?? '')}.',
                        style: FontPalette.hW500S12,
                      ),
                    ),
                    3.horizontalSpace,
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        StringConstants.edit,
                        style: FontPalette.hW700S14.copyWith(
                          color: Color(0XFF2E0E16),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Pinput(
                    controller: _pinController,
                    length: 6,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    defaultPinTheme: PinTheme(
                      width: 50.w,
                      height: 50.h,
                      textStyle: FontPalette.hW500S12,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: kDarkBorder),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 50.w,
                      height: 50.h,
                      textStyle: FontPalette.hW500S12,
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: kPrimaryColor, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: kPrimaryColor.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: 50.w,
                      height: 50.h,
                      textStyle: FontPalette.hW500S10,
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: kPrimaryColor),
                      ),
                    ),
                    onChanged: (pin) {
                      setState(() {
                        _enteredPin = pin;
                      });
                    },
                    onCompleted: (pin) {
                      context.read<AuthBloc>().add(
                        VerifyOtpEvent(
                          mobile: arguments?['mobile'] ?? '',
                          otp: pin,
                        ),
                      );
                      HapticFeedback.mediumImpact();
                    },
                    autofillHints: const [AutofillHints.oneTimeCode],
                  ),
                ),
                10.verticalSpace,

                MainPadding(
                  top: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.dontWorry,
                        style: FontPalette.hW400S14.copyWith(color: kTextColor),
                        textAlign: TextAlign.center,
                      ),
                      if (_canResend)
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: _resendOtp,
                          child: Text(
                            StringConstants.resendCode,
                            style: FontPalette.hW700S14.copyWith(
                              color: kLightBlue,
                            ),
                          ),
                        )
                      else
                        Text(
                          '${StringConstants.sendIn} ${_resendCountdown}s',
                          style: FontPalette.hW400S14.copyWith(
                            color: kTextColor,
                          ),
                        ),
                    ],
                  ),
                ),

                const Spacer(),

                CustomMaterialButton(
                  onPressed: () {
                    _verifyOtp();
                  },
                  buttonText: state.isVerify == ApiFetchStatus.loading
                      ? 'Verifying...'
                      : 'Verify',
                  isLoading: state.isVerify == ApiFetchStatus.loading,
                ),

                25.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatPhoneNumber(String phone) {
    if (phone.length >= 10) {
      return '${phone.substring(0, 5)} ${phone.substring(5)}';
    }
    return phone;
  }
}
