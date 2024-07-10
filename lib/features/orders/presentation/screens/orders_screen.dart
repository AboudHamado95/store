// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/core/common_widgets/snack_bar_widget.dart';
import 'package:store_app/core/constants/assets_paths.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/font/font_manager.dart';
import 'package:store_app/core/utils/hex_color.dart';
import 'package:store_app/features/orders/data/models/order_model.dart';
import 'package:store_app/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:store_app/features/orders/presentation/widgets/order_card_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  ScrollController parentController = ScrollController();
  @override
  void initState() {
    // context.read<HomeBloc>().add(
    //     GetCategoriesBySectionIdEvent(sectionId: widget.selectedSectionId));
    // context.read<AccountBloc>().add(AllSectionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.px, vertical: 17.px),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height:
                  Device.height - MediaQuery.of(context).padding.top - 34.px,
              child: Column(
                children: [
                  Text(
                    'Orders',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: FontManagerStyles.fontSize(13),
                    ),
                  ),
                  SizedBox(height: 30.px),
                  BlocConsumer<OrderBloc, OrdersState>(
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
                          context.read<OrderBloc>().add(ClearEvent());
                        });
                      }
                      if (state is SuccessGetAllOrdersState) {
                        BlocProvider.of<OrderBloc>(context).orderEntity =
                            state.param;
                        // context.read<ProductsBloc>().add(ClearEvent());
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: SizedBox(
                          child: state is Loading
                              ? ListView(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  children: List<Widget>.generate(4, (i) {
                                    return Column(
                                      children: [
                                        Column(
                                          children: [
                                            Shimmer.fromColors(
                                                baseColor:
                                                    const Color(0xFFFFFFFF),
                                                highlightColor:
                                                    const Color.fromRGBO(
                                                        119,
                                                        118,
                                                        118,
                                                        0.5490196078431373),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 25.px,
                                                      vertical: 5.px),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.greyColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.px)),
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 100.px,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              width: 150.px,
                                                            ),
                                                            SizedBox(
                                                                width: 12.px),
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
                              : ListView.builder(
                                  controller: parentController,
                                  shrinkWrap: true,
                                  itemCount: BlocProvider.of<OrderBloc>(context)
                                      .orderEntity
                                      .data
                                      .length,
                                  itemBuilder: ((context, index) {
                                    return OrderCardWidget(
                                      index: index,
                                      order: BlocProvider.of<OrderBloc>(context)
                                          .orderEntity
                                          .data[index],
                                    );
                                  })),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 100.px)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
