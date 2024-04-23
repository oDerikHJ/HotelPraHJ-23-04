import 'dart:convert';

import 'package:hotel_pra_hoje/src/core/domain/exceptions/datasource_exception.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/http/http_failure.dart';
import 'package:hotel_pra_hoje/src/core/utilities/helpers/http/i_http.dart';

import '../infrastructure/datasources/i_home_datasource.dart';

class HomeDatasource implements IHomeDatasource {
  final IHttp http;
  HomeDatasource({
    required this.http,
  });

  //* Chamar endpoint API e pegar dados e retorna como uma Lista de Map;
  @override
  Future<List<Map>> getHotels() async {
    try {
      // final result = await http.get(endpoint: 'get-hoteis');
      // return (result.data['data'] as List).cast<Map>();
      return mockData;
    } on HttpFailure catch (e) {
      throw DatasourceException(e.message);
    }
  }
}

//! Retornar dados mocados

final List<Map<String, dynamic>> mockData = [
  {
    'id': 1,
    'image': "https://emiliano.com.br/wp-content/uploads/2023/12/emiliano.com.br-pagina-inicial-emiliano-tbf7271b.jpg",
    'hotel_name': "Hotel Maravilhoso",
    'price': 200,
    'available': 4.5,
  },
  {
    'id': 2,
    'image': "https://emiliano.com.br/wp-content/uploads/2023/12/emiliano.com.br-pagina-inicial-emiliano-tbf7271b.jpg",
    'hotel_name': "Hotel Fantástico",
    'price': 250,
    'available': 4.7,
  },
  {
    'id': 3,
    'image': "https://emiliano.com.br/wp-content/uploads/2023/12/emiliano.com.br-pagina-inicial-emiliano-tbf7271b.jpg",
    'hotel_name': "Hotel Incrível",
    'price': 300,
    'available': 4.9,
  },
  {
    'id': 4,
    'image': "https://emiliano.com.br/wp-content/uploads/2023/12/emiliano.com.br-pagina-inicial-emiliano-tbf7271b.jpg",
    'hotel_name': "Hotel Excelente",
    'price': 350,
    'available': 4.8,
  },
  {
    'id': 5,
    'image': "https://emiliano.com.br/wp-content/uploads/2023/12/emiliano.com.br-pagina-inicial-emiliano-tbf7271b.jpg",
    'hotel_name': "Hotel Surpreendente",
    'price': 400,
    'available': 5.0,
  },
];
