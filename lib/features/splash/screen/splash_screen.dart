import 'package:chat_app/features/home/bloc/home_bloc.dart';
import 'package:chat_app/shared/constant/colors.dart';
import 'package:chat_app/shared/routes/routes.dart';
import 'package:chat_app/shared/theme/font_palette.dart';
import 'package:chat_app/shared/utilities/auth/auth_utils.dart';
import 'package:chat_app/shared/widgets/buttons/custom_material_button.dart';
import 'package:chat_app/shared/widgets/padding/main_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initialFunction();
    super.initState();
  }

  _initialFunction() async {
    final bool status = await AuthUtils.instance.isSignedIn;
    if (status) {
      context.read<HomeBloc>().add(UserEvent());
      Navigator.pushNamed(context, routeHome);
    } else {
      Navigator.pushNamed(context, routeSigIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image (1).png'),
          ),
        ),
        child: MainPadding(
          child: Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              80.verticalSpace,
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/icons/Group 1435.png'),
                ),
              ),
              Text(
                'Connect. Meet. Love. \nWith Fliq Dating',
                style: FontPalette.hW700S23.copyWith(
                  color: kWhite,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomMaterialBtton(
                textColor: kBlack,
                borderColor: kWhite,
                color: kWhite,
                leading: SvgPicture.asset('assets/icons/Google.svg'),
                onPressed: () {},

                buttonText: 'Sign in with Google',
              ),
              CustomMaterialBtton(
                borderColor: kBlueColor,
                color: kBlueColor,
                leading: SvgPicture.asset('assets/icons/Group.svg'),
                onPressed: () {},

                buttonText: 'Sign in with Facebook',
              ),
              CustomMaterialBtton(
                leading: Icon(Icons.call, color: kWhite),
                onPressed: () {
                  Navigator.pushNamed(context, routeSigIn);
                },

                buttonText: 'Sign in with phone number',
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By signing up, you agree to our ',
                  style: FontPalette.hW700S11.copyWith(color: kWhite),
                  children: [
                    TextSpan(
                      text: 'Terms.',
                      style: FontPalette.hW700S12.copyWith(color: kWhite),
                      children: [
                        TextSpan(
                          text: 'See how we use your data in our ',
                          style: FontPalette.hW700S11.copyWith(color: kWhite),
                          children: [
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: FontPalette.hW700S12.copyWith(
                                color: kWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              25.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
