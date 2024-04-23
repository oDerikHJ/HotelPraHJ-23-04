import 'package:flutter/material.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_colors.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_style_manager.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/responsive.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/dtos/hotel_item_dto.dart';

class FavoriteItemWidget extends StatelessWidget {
  final HotelItemDto dto;

  const FavoriteItemWidget({super.key, required this.dto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 120.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.blue,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(dto.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 10.width),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dto.hotelName, style: getBoldStyle(color: AppColors.white, fontSize: 16.sp)),
                    Text(
                      'R\$${dto.price}\n/noite',
                      style: getBoldStyle(color: AppColors.green, fontSize: 16.sp),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 5.width),
                        Text(dto.available.toString(), style: getBoldStyle(color: AppColors.green, fontSize: 16.sp)),
                      ],
                    ),
                    Icon(Icons.save, color: AppColors.green),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
