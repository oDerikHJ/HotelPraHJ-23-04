import 'package:hotel_pra_hoje/src/core/utilities/helpers/result.dart';
import 'package:hotel_pra_hoje/src/core/utilities/templates/base_controller.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/usecases/get_hotels_usecase.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/home/states/home_state.dart';

//* Controller onde fica os métodos e controlam a tela com a emição de estados

class HomeController extends BaseController<HomeState> {
  final IGetHotelsUsecase getHotelsUsecase;

  HomeController({required this.getHotelsUsecase}) : super(HomeInitialState());

  Future<void> getHotels() async {
    emit(HomeLoadingState());
    final response = await getHotelsUsecase();
    response.fold(
      failure: (error) {
        //? Tratar erro (exibir erro na tela)
        emit(HomeErrorState(message: error.message));
      },
      success: (hotelItemDto) {
        //? Tratar sucesso (exibir dados carregados)
        emit(HomeLoadedState(hotelItemDto: hotelItemDto)); //* Passa valores carregados para estado de carregado
      },
    );
  }
}
