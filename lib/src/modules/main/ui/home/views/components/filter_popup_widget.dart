import 'package:flutter/material.dart';
import 'package:hotel_pra_hoje/src/core/app/theme/app_colors.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/responsive.dart';

class FilterPopup extends StatefulWidget {
  const FilterPopup({Key? key}) : super(key: key);

  @override
  _FilterPopupState createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  String _selectedOption = 'relevance'; 
  RangeValues _currentRangeValues = const RangeValues(300, 800);
  final List<String> _selectedPropertyTypes = [];
  final List<String> _selectedOffersTypes = [];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.width),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Filtros Gerais', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text(
                      'Ordenado Por',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.start,
                    ),
                    RadioListTile<String>(
                      title: const Text('Relevância'),
                      value: 'relevance',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _selectedOption = value;
                          });
                        }
                      },
                      activeColor: AppColors.darkBlue,
                    ),
                    RadioListTile<String>(
                      title: const Text('Menor preço'),
                      value: 'low_price',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _selectedOption = value;
                          });
                        }
                      },
                      activeColor: AppColors.darkBlue,
                    ),
                    RadioListTile<String>(
                      title: const Text('Melhor avaliações'),
                      value: 'best_reviews',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _selectedOption = value;
                          });
                        }
                      },
                      activeColor: AppColors.darkBlue,
                    ),
                    RadioListTile<String>(
                      title: const Text('Mais avaliados'),
                      value: 'most_reviewed',
                      groupValue: _selectedOption,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _selectedOption = value;
                          });
                        }
                      },
                      activeColor: AppColors.darkBlue,
                    ),
                    const Divider(),
                    Text('Faixa de Preço', style: Theme.of(context).textTheme.titleMedium),
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 100,
                      max: 1000,
                      divisions: 9,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                      activeColor: AppColors.darkBlue,
                    ),
                    const Divider(),
                    Text('Tipo de Propriedades', style: Theme.of(context).textTheme.titleMedium),
                    CheckboxListTile(
                      title: const Text('Pousadas'),
                      value: _selectedPropertyTypes.contains('Pousadas'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            _selectedPropertyTypes.add('Pousadas');
                          } else {
                            _selectedPropertyTypes.remove('Pousadas');
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.darkBlue,
                    ),
                    CheckboxListTile(
                      title: const Text('Hotéis de estrada'),
                      value: _selectedPropertyTypes.contains('Hotéis de estrada'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            _selectedPropertyTypes.add('Hotéis de estrada');
                          } else {
                            _selectedPropertyTypes.remove('Hotéis de estrada');
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.darkBlue,
                    ),
                    CheckboxListTile(
                      title: const Text('Hostels'),
                      value: _selectedPropertyTypes.contains('Hostels'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            _selectedPropertyTypes.add('Hostels');
                          } else {
                            _selectedPropertyTypes.remove('Hostels');
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.darkBlue,
                    ),
                    CheckboxListTile(
                      title: const Text('Casas'),
                      value: _selectedPropertyTypes.contains('Casas'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            _selectedPropertyTypes.add('Casas');
                          } else {
                            _selectedPropertyTypes.remove('Casas');
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.darkBlue,
                    ),
                    CheckboxListTile(
                      title: const Text('Resorts'),
                      value: _selectedPropertyTypes.contains('Resorts'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            _selectedPropertyTypes.add('Resorts');
                          } else {
                            _selectedPropertyTypes.remove('Resorts');
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.darkBlue,
                    ),
                    CheckboxListTile(
                      title: const Text('Outros'),
                      value: _selectedPropertyTypes.contains('Outros'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            _selectedPropertyTypes.add('Outros');
                          } else {
                            _selectedPropertyTypes.remove('Outros');
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.darkBlue,
                    ),
                    const Divider(),
                    Text('Ofertas', style: Theme.of(context).textTheme.titleMedium),
                    CheckboxListTile(
                      title: const Text('Cancelamento Gratuito'),
                      value: _selectedOffersTypes.contains('Cancelamento Gratuito'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            _selectedOffersTypes.add('Cancelamento Gratuito');
                          } else {
                            _selectedOffersTypes.remove('Cancelamento Gratuito');
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.darkBlue,
                    ),
                    CheckboxListTile(
                      title: const Text('Apenas Ofertas'),
                      value: _selectedOffersTypes.contains('Apenas Ofertas'),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null && value) {
                            _selectedOffersTypes.add('Apenas Ofertas');
                          } else {
                            _selectedOffersTypes.remove('Apenas Ofertas');
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.darkBlue,
                    ),
                    const Divider(),
                    // AQ

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Fechar',
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implemente a função de salvar aqui
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
