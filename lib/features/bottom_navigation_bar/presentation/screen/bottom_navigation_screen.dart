// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/core/utils/assets_manager.dart';
import 'package:store_app/core/utils/hex_color.dart';
import 'package:store_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:store_app/features/orders/presentation/screens/orders_screen.dart';

import '../../../../config/themes/theme_cubit.dart';
import '../../../../core/constants/assets_paths.dart';
import '../../../../core/utils/font/font_manager.dart';
import '../../../products/presentation/screens/home_page_screen.dart';
import '../cubit/bottom_navigation_cubit.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  BottomNavigationBarScreenState createState() =>
      BottomNavigationBarScreenState();
}

class BottomNavigationBarScreenState extends State<BottomNavigationBarScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().globalAppTheme;
    return BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, selectedIndex) {
      return Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: TabBar(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          indicatorColor: HexColor('EBB376'),
          labelColor: HexColor('EBB376'),
          unselectedLabelColor: theme.accent2,
          labelStyle: TextStyle(
              fontSize: FontManagerStyles.fontSize(8),
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(
              fontSize: FontManagerStyles.fontSize(8),
              fontWeight: FontWeight.w300),
          tabs: [
            Tab(
              icon: SizedBox(
                  height: 2.6.h,
                  child: SvgPicture.asset(
                    ImgAssets.profileImg,
                    color: selectedIndex == 0
                        ? HexColor('EBB376')
                        : theme.fontColorBlack,
                  )),
              text: '',
            ),
            Tab(
              icon: SvgPicture.asset(
                ImgAssets.wishlistImg,
                color: selectedIndex == 1
                    ? HexColor('EBB376')
                    : theme.fontColorBlack,
              ),
              text: '',
            ),
            Tab(
              icon: SvgPicture.asset(
                ImgAssets.homeImg,
                color: selectedIndex == 2
                    ? HexColor('EBB376')
                    : theme.fontColorBlack,
              ),
              text: '',
            ),
            Tab(
              icon: SvgPicture.asset(
                ImgAssets.archiveImg,
                color: selectedIndex == 3
                    ? HexColor('EBB376')
                    : theme.fontColorBlack,
              ),
              text: '',
            ),
            Tab(
              icon: SvgPicture.asset(
                ImgAssets.searchImg,
                color: selectedIndex == 4
                    ? HexColor('EBB376')
                    : theme.fontColorBlack,
              ),
              text: '',
            ),
          ],
          onTap: (index) {
            var cubit = context.read<BottomNavigationCubit>();
            cubit.selectTab(index);
          },
        ),
        body: SafeArea(
          top: false,
          child: TabBarView(
            controller: tabController,
            children: [
              Container(),
              Container(),
              HomeScreen(),
              Container(),
              Container()
            ],
          ),
        ),
      );
    });
  }
}
