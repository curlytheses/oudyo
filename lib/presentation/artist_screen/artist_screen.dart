import '../artist_screen/widgets/renaissancelist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';
import 'package:oudyo/widgets/app_bar/appbar_leading_image.dart';
import 'package:oudyo/widgets/app_bar/appbar_title.dart';
import 'package:oudyo/widgets/app_bar/appbar_trailing_image.dart';
import 'package:oudyo/widgets/app_bar/custom_app_bar.dart';
import 'package:oudyo/widgets/custom_icon_button.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 28.v),
                child: Column(children: [
                  _buildRenaissanceColumn(context),
                  SizedBox(height: 43.v),
                  _buildRenaissanceList(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 14.v, bottom: 13.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_renaissance".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMenu,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildRenaissanceColumn(BuildContext context) {
    return Column(children: [
      CustomIconButton(
          height: 38.adaptSize,
          width: 38.adaptSize,
          padding: EdgeInsets.all(7.h),
          child: CustomImageView(imagePath: ImageConstant.imgBookmark)),
      SizedBox(height: 12.v),
      Text("lbl_renaissance".tr, style: theme.textTheme.headlineMedium),
      SizedBox(height: 6.v),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("lbl_843_tracks".tr, style: CustomTextStyles.bodyLargeBluegray400),
        Opacity(
            opacity: 0.648,
            child: Container(
                height: 3.adaptSize,
                width: 3.adaptSize,
                margin: EdgeInsets.only(left: 4.h, top: 9.v, bottom: 6.v),
                decoration: BoxDecoration(
                    color:
                        theme.colorScheme.onPrimaryContainer.withOpacity(0.58),
                    borderRadius: BorderRadius.circular(1.h)))),
        Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: Text("lbl_23_albums".tr,
                style: CustomTextStyles.bodyLargeBluegray400))
      ])
    ]);
  }

  /// Section Widget
  Widget _buildRenaissanceList(BuildContext context) {
    return Expanded(
        child: SizedBox(
            height: 230.v,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 24.h);
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return RenaissancelistItemWidget(onTapUrgentSiege: () {
                    onTapUrgentSiege(context);
                  });
                })));
  }

  /// Navigates to the albumsScreen when the action is triggered.
  onTapUrgentSiege(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.albumsScreen);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
