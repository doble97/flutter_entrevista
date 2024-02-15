import 'package:flutter_entrevista/src/domain/datasources/crud_datasource.dart';
import 'package:flutter_entrevista/src/domain/entities/client.dart';
import 'package:flutter_entrevista/src/domain/repositories/crud_repository.dart';
import 'package:flutter_entrevista/src/infrastructure/models/clients_response.dart';

class RemoteCrudRepository extends CrudRepository<Client>{
  final CrudDatasource datasource;

  RemoteCrudRepository({required this.datasource});

  

  @override
  Future<List<Client>?> getAll() async {
      final ClientsResponse _resp = await datasource.getAll();
      return _resp.data;
  }

}