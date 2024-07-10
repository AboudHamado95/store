import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:store_app/config/themes/theme_cubit.dart';
import 'package:store_app/core/utils/hex_color.dart';
import 'package:store_app/features/orders/data/models/order_model.dart';

import '../../../../core/constants/assets_paths.dart';
import '../../../../core/utils/font/font_manager.dart';

class OrderCardWidget extends StatefulWidget {
  const OrderCardWidget({super.key, required this.index, required this.order});
  final int index;
  final Datum order;
  @override
  State<OrderCardWidget> createState() => _OrderCardWidgetState();
}

class _OrderCardWidgetState extends State<OrderCardWidget> {
  final List items = [
    SvgPicture.asset(AssetsPaths.wishlist),
    const Icon(Icons.delete)
  ];
  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeCubit>().globalAppTheme;
    return Column(
      children: [
        Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.2,
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: HexColor('#BE0606'),
                foregroundColor: Colors.white,
                spacing: 1,
                icon: Icons.delete,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.px),
                    bottomRight: Radius.circular(12.px)),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(6.px),
            height: 100.px,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.px),
                color: HexColor('#F4F4F4')),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40.px,
                  width: 40.px,
                  decoration: BoxDecoration(
                      color: HexColor('#EFEAF5'), shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    AssetsPaths.orderImg,
                    height: 15.px,
                    width: 15.px,
                    fit: BoxFit.scaleDown,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.order.product.title,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: FontManagerStyles.fontSize(13),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: widget.order.status == 'Done'
                                            ? HexColor('#007405')
                                                .withOpacity(.14)
                                            : HexColor('#FFA800')
                                                .withOpacity(.14),
                                        borderRadius:
                                            BorderRadius.circular(24.px)),
                                    child: Text(
                                      widget.order.status,
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: widget.order.status == 'Done'
                                            ? HexColor('#007405')
                                            : HexColor('#FFA800'),
                                        fontWeight: FontWeight.w300,
                                        fontSize: FontManagerStyles.fontSize(9),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.px),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Device.width - 150.px,
                                  child: Wrap(
                                    children: [
                                      Text(
                                        widget.order.product.description,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: HexColor('#858585'),
                                            fontSize:
                                                FontManagerStyles.fontSize(12),
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.px)
      ],
    );
  }
}
