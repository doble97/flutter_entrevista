import 'package:flutter/material.dart';
import 'package:flutter_entrevista/src/infrastructure/datasources/remote_crud_datasource.dart';
import 'package:flutter_entrevista/src/infrastructure/repositories/remote_crud_repository.dart';
import 'package:flutter_entrevista/src/presentation/widgets/base_view.dart';

class OfficeScreen extends StatelessWidget {
  static String name = 'Office Screen';
  const OfficeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        appBar: AppBar(
          title: Text(name),
        ),
        child: FutureBuilder(
            future: RemoteCrudRepository(datasource: RemoteCrudDatasource())
                .getAll(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                if(snapshot.data!.isEmpty){
                  return Center(child: Text('No tienes asignados clientes que visitar'),);
                }
                return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Dirección'),
                      subtitle: Text(snapshot.data![index].address),
                        trailing: Icon(Icons.touch_app),

                    ),
                  );

                },);
              }
              if(snapshot.hasError){
                return Center(child: Text('Hubo un error'),);
              }
              return Center(child: CircularProgressIndicator.adaptive());
            }));
  }
}
