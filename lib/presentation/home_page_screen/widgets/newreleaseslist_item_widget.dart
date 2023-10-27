import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';

// ignore: must_be_immutable
class NewreleaseslistItemWidget extends StatelessWidget {
  const NewreleaseslistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 159.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgThumbnails,
            height: 181.v,
            width: 159.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 8.v),
          Text(
            "lbl_urgent_siege".tr,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 2.v),
          Text(
            "lbl_damned_anthem".tr,
            style: CustomTextStyles.bodyMediumOnPrimaryContainer,
          ),
        ],
      ),
    );
  }
}
