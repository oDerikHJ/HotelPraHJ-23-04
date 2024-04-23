//* Estados que a tela pode ter, esses estados é chamado na controller

import 'package:hotel_pra_hoje/src/modules/main/domain/dtos/hotel_item_dto.dart';

class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState {
  final List<HotelItemDto> hotelItemDto;
  FavoriteLoadedState({
    required this.hotelItemDto,
  });
}

class FavoriteErrorState extends FavoriteState {
  final String message;
  FavoriteErrorState({
    required this.message,
  });
}
