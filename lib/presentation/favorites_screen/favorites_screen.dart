import '../favorites_screen/widgets/favorites_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';
import 'package:oudyo/presentation/top_playlists_screen/top_playlists_screen.dart';
import 'package:oudyo/widgets/app_bar/appbar_leading_image.dart';
import 'package:oudyo/widgets/app_bar/appbar_title.dart';
import 'package:oudyo/widgets/app_bar/appbar_trailing_image.dart';
import 'package:oudyo/widgets/app_bar/custom_app_bar.dart';
import 'package:oudyo/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 22.v),
                child: Column(children: [
                  _buildPlaylist(context),
                  SizedBox(height: 24.v),
                  _buildFavorites(context)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
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
        title: AppbarTitle(text: "lbl_favourites".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMenu,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildPlaylist(BuildContext context) {
    return SizedBox(
        height: 181.v,
        width: 342.h,
        child: Stack(alignment: Alignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgPlaylistBackground2,
              height: 181.v,
              width: 342.h,
              radius: BorderRadius.circular(8.h),
              alignment: Alignment.center),
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.all(16.h),
                  decoration: AppDecoration.gradientBlackToBlack.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderBL8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 88.v, bottom: 4.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_did_you_like_it".tr,
                                      style: theme.textTheme.headlineMedium),
                                  SizedBox(height: 3.v),
                                  Text("lbl_843_tracks".tr,
                                      style: theme.textTheme.bodyLarge)
                                ])),
                        CustomImageView(
                            imagePath: ImageConstant.imgPlay,
                            height: 50.adaptSize,
                            width: 50.adaptSize,
                            margin: EdgeInsets.only(top: 99.v))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildFavorites(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 8.v);
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return FavoritesItemWidget(onTapFavouritesOption: () {
                onTapFavouritesOption(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return "/";
      case BottomBarEnum.Top:
        return AppRoutes.topPlaylistsScreen;
      case BottomBarEnum.Favorites:
        return AppRoutes.favoritesScreen;
      case BottomBarEnum.Search:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.topPlaylistsScreen:
        return TopPlaylistsScreen();
      case AppRoutes.favoritesScreen:
        return FavoritesScreen();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the artistsScreen when the action is triggered.
  onTapFavouritesOption(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.artistsScreen);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
