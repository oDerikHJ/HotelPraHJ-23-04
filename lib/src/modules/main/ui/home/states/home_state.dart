//* Estados que a tela pode ter, esses estados é chamado na controller

import 'package:hotel_pra_hoje/src/modules/main/domain/dtos/hotel_item_dto.dart';

class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<HotelItemDto> hotelItemDto;
  HomeLoadedState({
    required this.hotelItemDto,
  });
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState({
    required this.message,
  });
}
