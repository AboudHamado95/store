import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/config/themes/theme_cubit.dart';
import 'package:store_app/core/constants/style.dart';
import 'package:store_app/core/utils/functions.dart';
import 'package:store_app/core/utils/hex_color.dart';
import 'package:store_app/features/products/presentation/screens/search_screen.dart';

import '../../../../core/constants/assets_paths.dart';
import '../../../../core/utils/font/font_manager.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().globalAppTheme;
    return InkWell(
      onTap: () {
        goTo(context, (context) => const SearchScreen());
      },
      child: Container(
        decoration: BoxDecoration(
            color: HexColor('#F5F5F5'),
            borderRadius: BorderRadius.circular(8.px)),
        height: 45.px,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                AssetsPaths.searchIcon,
                height: 14.px,
                width: 17.px,
                fit: BoxFit.scaleDown,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.px),
                child: Text(
                  'Search',
                  style: FontManagerStyles.androidTitleScreen.copyWith(
                    color: HexColor('#272727'),
                    fontSize: FontManagerStyles.fontSize(12),
                  ),
                ),
              ),
            ),
            Padding(
               padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                  height: 14.px,
                  width: 17.px,
                  child: SvgPicture.asset(
                    AssetsPaths.filterIcon,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
