import 'package:hotel_pra_hoje/src/core/utilities/helpers/result.dart';
import 'package:hotel_pra_hoje/src/core/utilities/templates/base_controller.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/usecases/get_hotels_usecase.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/favorites/states/favorite_state.dart';

//* Controller onde fica os métodos e controlam a tela com a emição de estados

class FavoriteController extends BaseController<FavoriteState> {
  final IGetHotelsUsecase getHotelsUsecase;

  FavoriteController({required this.getHotelsUsecase}) : super(FavoriteInitialState());

  Future<void> getHotels() async {
    emit(FavoriteLoadingState());
    final response = await getHotelsUsecase();
    response.fold(
      failure: (error) {
        //? Tratar erro (exibir erro na tela)
        emit(FavoriteErrorState(message: error.message));
      },
      success: (hotelItemDto) {
        //? Tratar sucesso (exibir dados carregados)
        emit(FavoriteLoadedState(hotelItemDto: hotelItemDto)); //* Passa valores carregados para estado de carregado
      },
    );
  }
}
