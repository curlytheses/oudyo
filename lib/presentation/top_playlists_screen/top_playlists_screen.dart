import '../top_playlists_screen/widgets/topplaylist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';
import 'package:oudyo/presentation/favorites_screen/favorites_screen.dart';
import 'package:oudyo/widgets/app_bar/appbar_leading_image.dart';
import 'package:oudyo/widgets/app_bar/appbar_title.dart';
import 'package:oudyo/widgets/app_bar/appbar_trailing_image.dart';
import 'package:oudyo/widgets/app_bar/custom_app_bar.dart';
import 'package:oudyo/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class TopPlaylistsScreen extends StatelessWidget {
  TopPlaylistsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 20.v),
                  _buildTopPlaylist(context)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 53.v,
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h, top: 14.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_top_playlists".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMenu,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 15.v))
        ]);
  }

  /// Section Widget
  Widget _buildTopPlaylist(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.v);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return TopplaylistItemWidget(onTapImgRenaissance: () {
                    onTapImgRenaissance(context);
                  });
                })));
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

  /// Navigates to the listScreen when the action is triggered.
  onTapImgRenaissance(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.listScreen);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
