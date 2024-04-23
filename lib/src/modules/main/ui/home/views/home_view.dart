import 'package:flutter/material.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_colors.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_style_manager.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/responsive.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/toast.dart';
import 'package:hotel_pra_hoje/src/modules/main/domain/dtos/hotel_item_dto.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/home/controllers/home_controller.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/home/states/home_state.dart';
import 'package:hotel_pra_hoje/src/modules/main/ui/home/views/components/hotel_item_widget.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;
  const HomeView({super.key, required this.controller});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<HotelItemDto> hotelItemDto = [];

  //* O método initState sempre será chamado quando entrar na tela
  @override
  void initState() {
    //* Inicia todos os widgets da tela antes de entrar no método
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //* Chama método para buscar hotéis na controller
      widget.controller.getHotels();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: ValueListenableBuilder(
          valueListenable: widget.controller,
          builder: (_, state, __) {
            if (state is HomeErrorState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Toast.show(context, message: state.message, messageType: MessageTypes.error);
              });
            }
            if (state is HomeLoadedState) {
              hotelItemDto = state.hotelItemDto;
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 345.height,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.black)), color: Colors.grey),
                    child: const Text('Maps'),
                  ),
                  SizedBox(height: 30.height),
                  Text(
                    'Qualquer lugar',
                    style: getSemiBoldStyle(color: AppColors.white, fontSize: 16.sp),
                  ),
                  SizedBox(height: 24.height),
                  Text(
                    'Você está vendo hotéis disponíveis pra hoje, perto de você!',
                    style: getSemiBoldStyle(color: AppColors.white, fontSize: 16.sp),
                  ),
                  SizedBox(height: 24.height),
                  Text(
                    'Ver todos os filtros',
                    style: getSemiBoldStyle(color: AppColors.white, fontSize: 16.sp),
                  ),
                  SizedBox(height: 32.height),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 12.width, right: 12.width, bottom: 20.height),
                    itemCount: hotelItemDto.length,
                    itemBuilder: (context, index) {
                      final item = hotelItemDto[index];
                      return HotelItemWidget(dto: item);
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 16.height),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
