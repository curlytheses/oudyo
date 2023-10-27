import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';
import 'package:oudyo/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class TopplaylistItemWidget extends StatelessWidget {
  TopplaylistItemWidget({
    Key? key,
    this.onTapImgRenaissance,
  }) : super(
          key: key,
        );

  VoidCallback? onTapImgRenaissance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 181.v,
      width: 342.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgPlaylistBackground,
            height: 181.v,
            width: 342.h,
            radius: BorderRadius.circular(
              8.h,
            ),
            alignment: Alignment.center,
            onTap: () {
              onTapImgRenaissance!.call();
            },
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 181.v,
              width: 342.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.h,
                      top: 21.v,
                    ),
                    child: CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(8.h),
                      alignment: Alignment.topLeft,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgBookmarkBlack900,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(16.h),
                      decoration: AppDecoration.gradientBlackToBlack.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderBL8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 86.v,
                              bottom: 4.v,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "lbl_renaissance".tr,
                                  style: theme.textTheme.headlineMedium,
                                ),
                                SizedBox(height: 6.v),
                                Container(
                                  width: 156.h,
                                  margin: EdgeInsets.only(right: 3.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "lbl_843_tracks".tr,
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                      Opacity(
                                        opacity: 0.648,
                                        child: Container(
                                          height: 3.v,
                                          width: 2.h,
                                          margin: EdgeInsets.only(
                                            top: 9.v,
                                            bottom: 6.v,
                                          ),
                                          decoration: BoxDecoration(
                                            color: theme
                                                .colorScheme.onPrimaryContainer
                                                .withOpacity(0.58),
                                            borderRadius: BorderRadius.circular(
                                              1.h,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "lbl_23_hours".tr,
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgPlay,
                            height: 50.adaptSize,
                            width: 50.adaptSize,
                            margin: EdgeInsets.only(top: 99.v),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
