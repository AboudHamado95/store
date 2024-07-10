import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/core/common_widgets/snack_bar_widget.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/functions.dart';
import 'package:store_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:store_app/features/products/presentation/screens/search_screen.dart';
import 'package:store_app/features/products/presentation/screens/show_product_screen.dart';
import 'package:store_app/features/products/presentation/widgets/card_widget.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/features/products/presentation/widgets/search_bar_widget.dart';

class CardListWidget extends StatefulWidget {
  const CardListWidget({super.key});

  @override
  State<CardListWidget> createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  final ScrollController parentController = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 60.px),
          const SearchBarWidget(),
          SizedBox(height: 20.px),
          Expanded(
            child: SingleChildScrollView(
              controller: parentController,
              child: BlocConsumer<ProductsBloc, ProductsState>(
                buildWhen: (previous, current) {
                  return previous.props != current.props;
                },
                listener: (context, state) {
                  if (state is Empty) {
                  } else {
                    if (kDebugMode) {
                      print("ProductsState:$state");
                    }
                  }
                  if (state is Error) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      getSnackBarMethod(
                          title: 'Error:',
                          message: state.message,
                          icon: Icons.info,
                          colorIcon: AppColors.redColor,
                          backgroundColor: AppColors.greyColor);
                      context.read<ProductsBloc>().add(ClearEvent());
                    });
                  }
                  if (state is SuccessGetAllProductsState) {
                    BlocProvider.of<ProductsBloc>(context).productsEntity =
                        state.param;
                    // context.read<ProductsBloc>().add(ClearEvent());
                  }
                },
                builder: (context, state) {
                  return (state is Loading || state is Empty) &&
                          BlocProvider.of<ProductsBloc>(context)
                              .productsEntity
                              .data
                              .isEmpty
                      ? ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: List<Widget>.generate(4, (i) {
                            return Column(
                              children: [
                                Column(
                                  children: [
                                    Shimmer.fromColors(
                                        baseColor: const Color(0xFFFFFFFF),
                                        highlightColor: const Color.fromRGBO(
                                            119, 118, 118, 0.5490196078431373),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.px,
                                              vertical: 5.px),
                                          decoration: BoxDecoration(
                                              color: AppColors.greyColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.px)),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 80.px,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                        )),
                                    SizedBox(height: 10.px)
                                  ],
                                )
                              ],
                            );
                          }))
                      : Builder(builder: (context) {
                          BlocProvider.of<ProductsBloc>(context)
                              .productsEntity
                              .data
                              .sort((a, b) => b.rate.compareTo(a.rate));
                          return ListView.builder(
                              controller: parentController,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: BlocProvider.of<ProductsBloc>(context)
                                  .productsEntity
                                  .data
                                  .length,
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  onTap: () => goTo(
                                    context,
                                    (context) => ShowProductScreen(
                                      product:
                                          BlocProvider.of<ProductsBloc>(context)
                                              .productsEntity
                                              .data[index],
                                      id: BlocProvider.of<ProductsBloc>(context)
                                          .productsEntity
                                          .data[index]
                                          .id,
                                    ),
                                  ),
                                  child: CardWidget(
                                      product:
                                          BlocProvider.of<ProductsBloc>(context)
                                              .productsEntity
                                              .data[index],
                                      index: index),
                                );
                              }));
                        });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
