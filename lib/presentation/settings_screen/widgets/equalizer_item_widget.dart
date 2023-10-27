import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';

// ignore: must_be_immutable
class EqualizerItemWidget extends StatelessWidget {
  const EqualizerItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38.h,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 6.h),
              child: Text(
                "lbl_4_db".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          CustomImageView(
            imagePath: ImageConstant.img1,
            height: 298.v,
            width: 19.h,
          ),
          SizedBox(height: 6.v),
          Text(
            "lbl_100_hz".tr,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
