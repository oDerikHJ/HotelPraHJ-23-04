import 'package:hotel_pra_hoje/src/core/domain/exceptions/application_exception.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/dtos/hotel_item_dto.dart';

import '../../../../core/utilities/helpers/result.dart';
import '../repositories/i_home_repository.dart';

abstract interface class IGetHotelsUsecase {
  Future<Result<ApplicationException, List<HotelItemDto>>> call();
}

//* Chama o repository pegando valores e deixar disponivel para a controller;
class GetHotelsUsecase implements IGetHotelsUsecase {
  final IHomeRepository repository;
  GetHotelsUsecase({
    required this.repository,
  });

  @override
  Future<Result<ApplicationException, List<HotelItemDto>>> call() async {
    final response = await repository.getHotels();
    if (response.isFailure) {
      final failure = response.getFailure;
      return (ApplicationException(failure!.message), null);
    }
    return (null, response.getSuccess);
  }
}
