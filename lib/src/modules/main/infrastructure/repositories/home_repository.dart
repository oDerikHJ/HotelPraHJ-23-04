import 'package:hotel_pra_hoje/src/core/domain/exceptions/datasource_exception.dart';
import 'package:hotel_pra_hoje/src/core/domain/exceptions/repository_exception.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/result.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/dtos/hotel_item_dto.dart';
import 'package:hotel_pra_hoje/src/modules/main/infrastructure/datasources/i_home_datasource.dart';
import 'package:hotel_pra_hoje/src/modules/main/infrastructure/mapping/hotel_item_mapper.dart';
import '../../domain/repositories/i_home_repository.dart';

//* Chama o datasource, pega os dados, converte mapa para objeto e retorna;

class HomeRepository implements IHomeRepository {
  final IHomeDatasource datasource;
  HomeRepository({
    required this.datasource,
  });

  @override
  Future<Result<RepositoryException, List<HotelItemDto>>> getHotels() async {
    try {
      final result = await datasource.getHotels();
      final hotelItemDto = result.map((e) => HotelItemMapper.fromMap(map: e)).toList();
      return (null, hotelItemDto);
    } on DatasourceException catch (e) {
      return (RepositoryException(e.message), null);
    }
  }
}
