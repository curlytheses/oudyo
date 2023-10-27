import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';
import 'package:oudyo/widgets/custom_elevated_button.dart';
import 'package:oudyo/widgets/custom_outlined_button.dart';
import 'package:oudyo/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onError,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              left: 24.h,
              right: 24.h,
              bottom: 152.v,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Text(
                  "lbl_sign_in".tr,
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(height: 31.v),
                _buildEmail(context),
                SizedBox(height: 16.v),
                _buildPassword(context),
                SizedBox(height: 24.v),
                _buildSignIn(context),
                SizedBox(height: 40.v),
                Text(
                  "msg_forgot_your_login".tr,
                  style: CustomTextStyles.bodyMediumOnPrimaryContainer,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildCreateAccountButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "lbl_email".tr,
      textInputType: TextInputType.emailAddress,
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "lbl_password".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  /// Section Widget
  Widget _buildSignIn(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_sign_in2".tr,
      buttonStyle: CustomButtonStyles.fillOnPrimaryContainer,
      buttonTextStyle: CustomTextStyles.bodyLargeBlack900,
    );
  }

  /// Section Widget
  Widget _buildCreateAccountButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "lbl_create_account".tr,
      margin: EdgeInsets.only(
        left: 24.h,
        right: 24.h,
        bottom: 40.v,
      ),
    );
  }
}
