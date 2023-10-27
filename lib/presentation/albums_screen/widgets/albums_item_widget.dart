import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';

// ignore: must_be_immutable
class AlbumsItemWidget extends StatelessWidget {
  AlbumsItemWidget({
    Key? key,
    this.onTapAlbum,
  }) : super(
          key: key,
        );

  VoidCallback? onTapAlbum;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapAlbum!.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgThumbnail78x78,
            height: 78.adaptSize,
            width: 78.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 5.v,
              bottom: 3.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_flower_power".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 5.v),
                Text(
                  "lbl_ray_charles".tr,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 3.v),
                Text(
                  "lbl_2018".tr,
                  style: CustomTextStyles.bodyLargeBluegray400,
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
              margin: EdgeInsets.symmetric(vertical: 37.v),
            ),
          ),
        ],
      ),
    );
  }
}
