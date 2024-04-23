import 'package:flutter/material.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_assets.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_colors.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_style_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hotel_pra_hoje/src/core/utilities/constants/app_routes.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/responsive.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Modular.to.navigate(AppRoutes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(AppImages.splash,
                fit: BoxFit.cover),
          ),
          Column(
          children: <Widget>[
            const Expanded(
              flex: 100,
              child: SizedBox(),
            ),
            SizedBox(
              height: 16.height,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.width),
              child: Text(
                "Bem vindo ao",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontFamily: FontConstants.fontFamily,
                  color: AppColors.white,
                  fontSize: 43.sp,
                ),
              ),
            ),
            SizedBox(
              height: 2.height,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.width),
              child: Text(
                "Hotel\nPra Hoje",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontFamily: FontConstants.fontFamily,
                  color: AppColors.green,
                  height: 1,
                  fontSize: 64.sp,
                ),
              ),
            ),
            SizedBox(
              height: 5.height,
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.width), //! Desalinhado (???) - Verificar se é o jeito mais correto de ser feito
              child: Text( 
                "Sua solução instantânea para \numa estadia de última hora.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontFamily: FontConstants.fontFamily,
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Expanded(
              flex: 10,
              child: SizedBox(),
            ),
          ],
        ),
        ],
      ),
    );
  }
}


