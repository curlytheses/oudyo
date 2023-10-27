import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';

// ignore: must_be_immutable
class SonglistItemWidget extends StatelessWidget {
  const SonglistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 26.adaptSize,
          margin: EdgeInsets.only(
            top: 5.v,
            bottom: 11.v,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8.h,
            vertical: 1.v,
          ),
          decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Text(
            "lbl_1".tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_burning".tr,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 4.v),
              Text(
                "lbl_podval_caplella".tr,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Spacer(),
        Opacity(
          opacity: 0.503,
          child: CustomImageView(
            imagePath: ImageConstant.imgMoreIcon,
            height: 4.v,
            width: 20.h,
            margin: EdgeInsets.only(
              top: 16.v,
              bottom: 22.v,
            ),
          ),
        ),
      ],
    );
  }
}
