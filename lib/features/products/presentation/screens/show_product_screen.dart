import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/config/themes/theme_cubit.dart';
import 'package:store_app/core/common_widgets/store_button.dart';

import 'package:store_app/core/constants/assets_paths.dart';
import 'package:store_app/core/utils/hex_color.dart';
import 'package:store_app/features/products/data/models/products_model.dart';
import 'package:store_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:store_app/features/products/presentation/widgets/customer_review_widget.dart';

import '../../../../core/utils/font/font_manager.dart';

class ShowProductScreen extends StatefulWidget {
  const ShowProductScreen({Key? key, required this.product, required this.id})
      : super(key: key);
  final Datum product;
  final int id;

  @override
  State<ShowProductScreen> createState() => ShowProductScreenState();
}

class ShowProductScreenState extends State<ShowProductScreen> {
  @override
  void initState() {
    // context.read<ProductsBloc>().add(GetProductByIdEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().globalAppTheme;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 60.px),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 27.px, right: 32.px, left: 32.px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: FontManagerStyles.fontSize(14.px),
                          color: HexColor('#423D3D'),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: FontManagerStyles.s16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.px),
            child: SizedBox(
              height: Device.height -
                  MediaQuery.of(context).padding.top * 2 -
                  54.px,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30.px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.star,
                                color: theme.accent1,
                                size: 25.px,
                              ),
                              SizedBox(width: 8.px),
                              Text(
                                widget.product.rate
                                    .toStringAsFixed(1)
                                    .toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontManagerStyles.fontSize(25.px),
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.px),
                          Row(
                            children: [
                              Text(
                                widget.product.comments.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: FontManagerStyles.fontSize(12.px),
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 8.px),
                              Text(
                                'Comments',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontManagerStyles.fontSize(12.px),
                                  color: HexColor('#989898'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            'Rate product',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: FontManagerStyles.fontSize(12.px),
                              color: HexColor('#222222'),
                            ),
                          ),
                          SizedBox(height: 10.px),
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200.px,
                            height: 120.px,
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
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40.px),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: FontManagerStyles.fontSize(12.px),
                      color: HexColor('#222222'),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  Row(
                    children: [
                      Text(
                        'Most Recent Customer Review',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: FontManagerStyles.fontSize(14.px),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.px),
                  const CustomerReviewWidget(),
                  SizedBox(height: 16.px),
                  Row(
                    children: [
                      Text(
                        'View all 3 reviews',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: FontManagerStyles.fontSize(14.px),
                            color: HexColor('#686868'),
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox(height: 1.px)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.px),
                    child: ClinicButton(
                      buttonText: 'ADD TO ORDER',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
