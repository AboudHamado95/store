// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/core/constants/style.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/assets_manager.dart';
import 'package:store_app/core/utils/font/font_manager.dart';
import 'package:store_app/core/utils/hex_color.dart';
import 'package:store_app/features/home/data/models/offers_model.dart';
import 'package:store_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:store_app/features/products/presentation/widgets/card_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    if (BlocProvider.of<HomeBloc>(context).model == null) {
      BlocProvider.of<HomeBloc>(context).add(GetOffersEvent());
    }
    super.initState();
  }

  final ScrollController parentController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200.px,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      ImgAssets.planetTopImg,
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(ImgAssets.planetBottomImg)),
                Positioned(
                    top: -15.px,
                    left: 0,
                    right: 0,
                    // bottom: 0,
                    child: SvgPicture.asset(
                      ImgAssets.rectangleHomeImg,
                      height: 150.px,
                      // fit: BoxFit.scaleDown,
                    )),
                Positioned(
                    top: 15.px,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          ImgAssets.rectangleHomeImg,
                          height: 150.px,

                          // fit: BoxFit.scaleDown,
                        ),
                      ],
                    )),
                Positioned(
                    child: Column(
                  children: [
                    80.px.vSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(ImgAssets.personImg),
                              8.px.hSpace,
                              Text(
                                'Hi rama',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontManagerStyles.fontSize(14.px),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(ImgAssets.communicationImg),
                              30.px.hSpace,
                              SvgPicture.asset(ImgAssets.menuImg),
                            ],
                          )
                        ],
                      ),
                    ),
                    // 50.px.vSpace,
                  ],
                ))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.px),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Best offers',
                          style: TextStyle(
                            color: HexColor('4A4A4A'),
                            fontWeight: FontWeight.w500,
                            fontSize: FontManagerStyles.fontSize(14.px),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: HexColor('EBB376'),
                          ))),
                          child: Text(
                            'See more',
                            style: TextStyle(
                              color: HexColor('EBB376'),
                              fontWeight: FontWeight.w500,
                              fontSize: FontManagerStyles.fontSize(14.px),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.px.vSpace,
                    const BestOffersWidget(),
                    30.px.vSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended',
                          style: TextStyle(
                            color: HexColor('4A4A4A'),
                            fontWeight: FontWeight.w500,
                            fontSize: FontManagerStyles.fontSize(14.px),
                          ),
                        ),
                      ],
                    ),
                    20.px.vSpace,
                    SizedBox(
                      height: 250.px,
                      width: double.maxFinite,
                      child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const RecommendedWidget();
                          }),
                    ),
                    // 30.px.vSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cosmetic clinics',
                          style: TextStyle(
                            color: HexColor('4A4A4A'),
                            fontWeight: FontWeight.w500,
                            fontSize: FontManagerStyles.fontSize(14.px),
                          ),
                        ),
                      ],
                    ),
                    20.px.vSpace,
                    SizedBox(
                      height: 250.px,
                      width: double.maxFinite,
                      child: BlocConsumer<HomeBloc, HomeState>(
                        listener: (context, state) {
                          if (state is SuccessGetOffersState) {
                            BlocProvider.of<HomeBloc>(context).model =
                                state.model;
                          }
                        },
                        builder: (context, state) {
                          return state is Loading || state is HomeInitial
                              ? ListView(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  children: List<Widget>.generate(4, (i) {
                                    return Column(
                                      children: [
                                        Column(
                                          children: [
                                            const ClinicLoading(),
                                            SizedBox(height: 10.px)
                                          ],
                                        )
                                      ],
                                    );
                                  }))
                              : BlocProvider.of<HomeBloc>(context)
                                          .model
                                          ?.content
                                          ?.offers ==
                                      null
                                  ? Container()
                                  : ListView.builder(
                                      itemCount:
                                          BlocProvider.of<HomeBloc>(context)
                                              .model!
                                              .content!
                                              .offers!
                                              .length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return CosmeticClinicsWidget(
                                            model: BlocProvider.of<HomeBloc>(
                                                    context)
                                                .model!
                                                .content!
                                                .offers,
                                            index: index);
                                      });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Salon',
                          style: TextStyle(
                            color: HexColor('4A4A4A'),
                            fontWeight: FontWeight.w500,
                            fontSize: FontManagerStyles.fontSize(14.px),
                          ),
                        ),
                      ],
                    ),
                    20.px.vSpace,
                    SizedBox(
                      height: 220.px,
                      width: double.maxFinite,
                      child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const SalonWidget();
                          }),
                    ),
                    // 25.px.vSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClinicLoading extends StatelessWidget {
  const ClinicLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color(0xFFFFFFFF),
        highlightColor: const Color.fromRGBO(119, 118, 118, 0.5490196078431373),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.px, vertical: 5.px),
          decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(10.px)),
          child: Column(
            children: [
              SizedBox(
                width: 300.px,
                height: 300.px,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.px,
                    ),
                    SizedBox(width: 12.px),
                    Expanded(
                      child: SizedBox(
                        height: 80.px,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class BestOffersWidget extends StatelessWidget {
  const BestOffersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.px)),
      child: Stack(
        children: [
          Image.asset(ImgAssets.bestOfferImg),
          Positioned(
              right: 20.px,
              child: Stack(
                children: [
                  Image.asset(
                    ImgAssets.offImg,
                    fit: BoxFit.scaleDown,
                  ),
                  Positioned(
                    top: 30.px,
                    right: 30.px,
                    child: Text(
                      'OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: FontManagerStyles.fontSize(14.px),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11.px),
      width: 300.px,
      height: 300.px,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(ImgAssets.raghadImg),
                  4.px.hSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Raghad Cosmetics',
                        style: TextStyle(
                          color: HexColor('4A4A4A'),
                          fontWeight: FontWeight.w500,
                          fontSize: FontManagerStyles.fontSize(10.px),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: HexColor('2B5070'),
                            size: 8.px,
                          ),
                          4.px.hSpace,
                          Text(
                            'Damascus ,Al Shahbander...',
                            style: TextStyle(
                              color: HexColor('878787'),
                              fontWeight: FontWeight.w500,
                              fontSize: FontManagerStyles.fontSize(8.px),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: HexColor('EBB376'),
                        ))),
                        child: Text(
                          'Skin Care',
                          style: TextStyle(
                            color: HexColor('EBB376'),
                            fontWeight: FontWeight.w500,
                            fontSize: FontManagerStyles.fontSize(10.px),
                          ),
                        ),
                      ),
                    ],
                  ),
                  1.px.vSpace
                ],
              )
            ],
          ),
          12.px.vSpace,
          Image.asset(
            ImgAssets.recommendedImg,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          10.px.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    ImgAssets.wishlistImg,
                    height: 10.px,
                    width: 8.px,
                  ),
                  7.px.hSpace,
                  Text(
                    '2,456 Likes',
                    style: TextStyle(
                      color: HexColor('878787'),
                      fontWeight: FontWeight.w500,
                      fontSize: FontManagerStyles.fontSize(8.px),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.star_outline_rounded,
                    size: 14.px,
                  ),
                  7.px.hSpace,
                  Text(
                    '4.5 (38 Review)',
                    style: TextStyle(
                      color: HexColor('525252'),
                      fontWeight: FontWeight.w500,
                      fontSize: FontManagerStyles.fontSize(8.px),
                    ),
                  ),
                ],
              )
            ],
          ),
          10.px.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'More Details',
                style: TextStyle(
                  color: HexColor('EBB376'),
                  fontWeight: FontWeight.w400,
                  fontSize: FontManagerStyles.fontSize(10.px),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CosmeticClinicsWidget extends StatelessWidget {
  const CosmeticClinicsWidget({
    required this.model,
    required this.index,
    super.key,
  });
  final List<Offer>? model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11.px),
      width: 300.px,
      height: 300.px,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(ImgAssets.raghadImg),
                  4.px.hSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model![index].title ?? '',
                        style: TextStyle(
                          color: HexColor('4A4A4A'),
                          fontWeight: FontWeight.w500,
                          fontSize: FontManagerStyles.fontSize(10.px),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: HexColor('2B5070'),
                            size: 8.px,
                          ),
                          4.px.hSpace,
                          Text(
                            model![index].description ?? '',
                            style: TextStyle(
                              color: HexColor('878787'),
                              fontWeight: FontWeight.w500,
                              fontSize: FontManagerStyles.fontSize(8.px),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: HexColor('EBB376'),
                        ))),
                        child: Text(
                          'Skin Care',
                          style: TextStyle(
                            color: HexColor('EBB376'),
                            fontWeight: FontWeight.w500,
                            fontSize: FontManagerStyles.fontSize(10.px),
                          ),
                        ),
                      ),
                    ],
                  ),
                  1.px.vSpace
                ],
              )
            ],
          ),
          12.px.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 145.px,
                child: Image.asset(
                  ImgAssets.clinic1Img,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 60.px,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60.px,
                          child: Image.asset(
                            ImgAssets.clinic2Img,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                        4.px.hSpace,
                        SizedBox(
                          width: 60.px,
                          child: Image.asset(
                            ImgAssets.clinic3Img,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 128.px,
                    height: 70.px,
                    child: Image.asset(
                      ImgAssets.clinic4Img,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ],
              )
            ],
          ),
          10.px.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    ImgAssets.wishlistImg,
                    height: 10.px,
                    width: 8.px,
                  ),
                  7.px.hSpace,
                  Text(
                    model![index].likes.toString(),
                    style: TextStyle(
                      color: HexColor('878787'),
                      fontWeight: FontWeight.w500,
                      fontSize: FontManagerStyles.fontSize(8.px),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.star_outline_rounded,
                    size: 14.px,
                  ),
                  7.px.hSpace,
                  Text(
                    model![index].reviews.toString(),
                    style: TextStyle(
                      color: HexColor('525252'),
                      fontWeight: FontWeight.w500,
                      fontSize: FontManagerStyles.fontSize(8.px),
                    ),
                  ),
                ],
              )
            ],
          ),
          10.px.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'More Details',
                style: TextStyle(
                  color: HexColor('EBB376'),
                  fontWeight: FontWeight.w400,
                  fontSize: FontManagerStyles.fontSize(10.px),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SalonWidget extends StatelessWidget {
  const SalonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(11.px),
      width: 200.px,
      height: 300.px,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                ImgAssets.salon1Img,
              ),
              Positioned(
                  bottom: 0,
                  left: 8.px,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Place name ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: FontManagerStyles.fontSize(13.px),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 8.px,
                          ),
                          4.px.hSpace,
                          Text(
                            'Damascus',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: FontManagerStyles.fontSize(8.px),
                            ),
                          ),
                        ],
                      ),
                      4.px.vSpace,
                    ],
                  ))
            ],
          ),
          10.px.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    ImgAssets.wishlistImg,
                    height: 10.px,
                    width: 8.px,
                  ),
                  7.px.hSpace,
                  Text(
                    '2,456 Likes',
                    style: TextStyle(
                      color: HexColor('878787'),
                      fontWeight: FontWeight.w500,
                      fontSize: FontManagerStyles.fontSize(8.px),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.star_outline_rounded,
                    size: 14.px,
                  ),
                  7.px.hSpace,
                  Text(
                    '4.5 (38 Review)',
                    style: TextStyle(
                      color: HexColor('525252'),
                      fontWeight: FontWeight.w500,
                      fontSize: FontManagerStyles.fontSize(8.px),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
