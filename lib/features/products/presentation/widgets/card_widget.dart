import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/config/themes/theme_cubit.dart';
import 'package:store_app/core/utils/hex_color.dart';
import 'package:store_app/features/products/data/models/products_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/constants/assets_paths.dart';
import '../../../../core/utils/font/font_manager.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.index, required this.product});
  final int index;
  final Datum product;
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final List items = [
    SvgPicture.asset(AssetsPaths.wishlist),
    const Icon(Icons.delete)
  ];
  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().globalAppTheme;
    return Column(
      children: [
        SizedBox(
          height: 100.px,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.px),
                  bottomLeft: Radius.circular(8.px),
                ),
                child: SizedBox(
                  width: 130.px,
                  height: 80.px,
                  child: CachedNetworkImage(
                    imageUrl: widget.product.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return SpinKitFadingCircle(
                        color: theme.accent1,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 12.px),
              Expanded(
                child: SizedBox(
                  height: 80.px,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 140.px,
                            child: Text(
                              widget.product.title,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: FontManagerStyles.fontSize(13),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.px),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.product.description,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: HexColor('#858585'),
                                      fontSize: FontManagerStyles.fontSize(12),
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  RatingBar(
                                    itemSize: 15.px,
                                    ignoreGestures: true,
                                    direction: Axis.horizontal,
                                    initialRating: widget.product.rate,
                                    itemCount: 5,
                                    maxRating: 5,
                                    allowHalfRating: true,
                                    ratingWidget: RatingWidget(
                                      empty: SizedBox(
                                          height: 10.px,
                                          width: 10.px,
                                          child: SvgPicture.asset(
                                            'assets/images/full_star.svg',
                                            color: Colors.grey[400],
                                          )),
                                      full: SizedBox(
                                          height: 10.px,
                                          width: 10.px,
                                          child: SvgPicture.asset(
                                              'assets/images/full_star.svg')),
                                      half: SizedBox(
                                          height: 10.px,
                                          width: 10.px,
                                          child: SvgPicture.asset(
                                              'assets/images/half_star.svg')),
                                    ),
                                    onRatingUpdate: (value) {},
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10.px)
      ],
    );
  }
}
