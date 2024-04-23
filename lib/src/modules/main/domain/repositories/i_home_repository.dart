import 'package:hotel_pra_hoje/src/core/domain/exceptions/repository_exception.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/dtos/hotel_item_dto.dart';

import '../../../../core/utilities/helpers/result.dart';

abstract interface class IHomeRepository {
  Future<Result<RepositoryException, List<HotelItemDto>>> getHotels();
}
