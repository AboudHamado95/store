import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/config/themes/theme_cubit.dart';
import 'package:store_app/core/constants/assets_paths.dart';

import '../../../../core/utils/font/font_manager.dart';
import '../../../../core/utils/hex_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomerReviewWidget extends StatelessWidget {
  const CustomerReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().globalAppTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0).copyWith(top: 0, left: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Icon(
                  Icons.person,
                  size: 40.px,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      'Peter Breis',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: FontManagerStyles.fontSize(15.px),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.px),
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'Add Comments',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              height: 2.px,
                              fontSize: FontManagerStyles.fontSize(12.px),
                              color: theme.accent1,
                            ),
                          ),
                          SizedBox(width: 10.px),
                          SvgPicture.asset(AssetsPaths.edit,
                              color: theme.accent1,
                              fit: BoxFit.scaleDown,
                              height: 14.px,
                              width: 14.px),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: index <= 2
                              ? HexColor('#EAB90E')
                              : HexColor('#DBDCE0'),
                          size: 20.px,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(6.px),
                    onTap: () {},
                    child: Text(
                      'Add Review',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        height: 2.px,
                        fontSize: FontManagerStyles.fontSize(13.px),
                        color: theme.accent1,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  '3 days ago',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: FontManagerStyles.fontSize(14.px),
                    color: Colors.black.withOpacity(.54),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                  'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    height: 2.px,
                    fontSize: FontManagerStyles.fontSize(12.px),
                    color: HexColor('#2A363D'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
