// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_app/core/common_widgets/snack_bar_widget.dart';
import 'package:store_app/core/constants/assets_paths.dart';
import 'package:store_app/core/constants/style.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/font/font_manager.dart';
import 'package:store_app/core/utils/hex_color.dart';
import 'package:store_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:store_app/features/products/presentation/controller/product_controller.dart';
import 'package:store_app/features/products/presentation/widgets/card_widget.dart';
import 'package:store_app/injection.dart';

final productController = Get.put(ProductsController());

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController filterController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    filterController.addListener(() {
      productController
          .changeFilterControllerValue(filterController.text.trim());
    });
    super.initState();
  }

  @override
  void dispose() {
    filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.px),
          child: SizedBox(
            height: Device.height - 16.px - MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back)),
                  ],
                ),
                SizedBox(height: 10.px),
                Text(
                  'What are you looking for ?',
                  style: FontManagerStyles.androidTitleScreen,
                ),
                SizedBox(height: 20.px),
                Form(
                  key: formKey,
                  child: SizedBox(
                    width: Device.width,
                    height: 50.px,
                    child: TextFormField(
                      controller: filterController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryColor, width: 2.w),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.px),
                            child: Image.asset(
                              AssetsPaths.searchIcon,
                              height: 4.px,
                              width: 7.px,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.zero,
                            child: InkWell(
                              onTap: () {
                                if (filterController.text != '') {
                                  validateServiceTypeMethod(context);
                                } else {
                                  getSnackBarMethod(
                                      backgroundColor: AppColors.whiteColor,
                                      colorIcon: Colors.red,
                                      icon: Icons.error,
                                      message:
                                          'Please enter title in search bar!',
                                      title: 'Filter products');
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.px),
                                    bottomRight: Radius.circular(8.px),
                                  ),
                                ),
                                child: Icon(Icons.arrow_forward,
                                    color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                          hintText: 'Filter by title',
                          hintStyle: TextStyle(
                              fontSize: FontManagerStyles.fontSize(12)),
                          fillColor: Colors.grey[200],
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.px),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
                Expanded(
                  child: BlocConsumer<ProductsBloc, ProductsState>(
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
                      if (state is SuccessGetAllProductsByTitleState) {
                        // context.read<ProductsBloc>().add(ClearEvent());
                      }
                    },
                    builder: (context, state) {
                      return state is Loading
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
                                            highlightColor:
                                                const Color.fromRGBO(119, 118,
                                                    118, 0.5490196078431373),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25.px,
                                                  vertical: 5.px),
                                              decoration: BoxDecoration(
                                                  color: AppColors.greyColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.px)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 80.px,
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
                                                        SizedBox(width: 12.px),
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 100.px,
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
                          : state is SuccessGetAllProductsState &&
                                  BlocProvider.of<ProductsBloc>(context)
                                      .filterProductsEntity
                                      .data
                                      .isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      BlocProvider.of<ProductsBloc>(context)
                                          .filterProductsEntity
                                          .data
                                          .length,
                                  itemBuilder: ((context, index) {
                                    return CardWidget(
                                        product: BlocProvider.of<ProductsBloc>(
                                                context)
                                            .filterProductsEntity
                                            .data[index],
                                        index: index);
                                  }))
                              : Container();
                      // : Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateServiceTypeMethod(BuildContext context) {
    if (formKey.currentState!.validate()) {
      getIt<ProductsBloc>()
          .add(FilterProductsByTitleEvent(rate: filterController.text.trim()));
    }
  }
}
