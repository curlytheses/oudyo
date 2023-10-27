import '../home_page_screen/widgets/newreleaseslist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:oudyo/core/app_export.dart';
import 'package:oudyo/presentation/favorites_screen/favorites_screen.dart';
import 'package:oudyo/presentation/top_playlists_screen/top_playlists_screen.dart';
import 'package:oudyo/widgets/app_bar/appbar_title.dart';
import 'package:oudyo/widgets/app_bar/appbar_trailing_image.dart';
import 'package:oudyo/widgets/app_bar/custom_app_bar.dart';
import 'package:oudyo/widgets/custom_bottom_bar.dart';
import 'package:oudyo/widgets/custom_elevated_button.dart';
import 'package:oudyo/presentation/playlist_bottomsheet/playlist_bottomsheet.dart';

// ignore_for_file: must_be_immutable
class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

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
                  SizedBox(height: 26.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 24.h, right: 24.h, bottom: 5.v),
                              child: Column(children: [
                                Container(
                                    width: 243.h,
                                    margin: EdgeInsets.only(
                                        left: 49.h, right: 50.h),
                                    child: Text(
                                        "msg_listen_to_music_without".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.headlineMedium!
                                            .copyWith(height: 1.50))),
                                SizedBox(height: 34.v),
                                CustomElevatedButton(
                                    height: 40.v,
                                    width: 236.h,
                                    text: "lbl_trial_version".tr,
                                    buttonStyle: CustomButtonStyles
                                        .fillOnPrimaryContainerTL20,
                                    buttonTextStyle:
                                        CustomTextStyles.bodyLargeBlack900),
                                SizedBox(height: 41.v),
                                Text("msg_free_for_3_months".tr,
                                    style: CustomTextStyles
                                        .bodyMediumOnPrimaryContainer),
                                SizedBox(height: 44.v),
                                _buildNewReleases(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarTitle(text: "lbl_dashboard".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMenu,
              margin: EdgeInsets.fromLTRB(24.h, 14.v, 24.h, 13.v))
        ]);
  }

  /// Section Widget
  Widget _buildNewReleasesList(BuildContext context) {
    return SizedBox(
        height: 230.v,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 24.h);
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              return NewreleaseslistItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildNewReleases(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("lbl_new_releases".tr, style: theme.textTheme.headlineSmall),
        GestureDetector(
            onTap: () {
              onTapTxtViewAll(context);
            },
            child: Padding(
                padding: EdgeInsets.only(top: 5.v, bottom: 6.v),
                child: Text("lbl_view_all".tr,
                    style: CustomTextStyles.bodyMediumOnPrimaryContainer)))
      ]),
      SizedBox(height: 20.v),
      _buildNewReleasesList(context)
    ]);
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

  /// Shows a modal bottom sheet with [PlaylistBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapTxtViewAll(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => PlaylistBottomsheet(),
        isScrollControlled: true);
  }
}
