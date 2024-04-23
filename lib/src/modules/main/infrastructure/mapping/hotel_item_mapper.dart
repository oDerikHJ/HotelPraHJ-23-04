import 'package:hotel_pra_hoje/src/modules/main/domain/dtos/hotel_item_dto.dart';

class HotelItemMapper {
  static HotelItemDto fromMap({required Map map}) {
    return HotelItemDto(
      id: map['id'] ?? 0,
      image: map['image'] ?? '',
      hotelName: map['hotel_name'] ?? '',
      price: map['price'] ?? 0,
      available: map['available'] ?? 0.0,
    );
  }
}
