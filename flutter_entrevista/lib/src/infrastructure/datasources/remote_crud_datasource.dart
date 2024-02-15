import 'package:dio/dio.dart';
import 'package:flutter_entrevista/src/config/constants.dart';
import 'package:flutter_entrevista/src/domain/datasources/crud_datasource.dart';
import 'package:flutter_entrevista/src/infrastructure/models/clients_response.dart';
import 'package:flutter_entrevista/src/infrastructure/network/dio_singleton.dart';

class RemoteCrudDatasource extends CrudDatasource<ClientsResponse> {
  final Dio _dio = DioSingleton().dioInstance;

  @override
  Future<ClientsResponse> getAll()async {
    try {
      final _resp= await  _dio.get(getAllClientsUrl);
      if(_resp.statusCode == 200) {
        final _clientsResponse = ClientsResponse.fromJson(_resp.data);

        return _clientsResponse;
      }
      throw Exception('Error en la petición');
    } catch (e) {
      throw Exception('Error generico');
    }
  }
}
