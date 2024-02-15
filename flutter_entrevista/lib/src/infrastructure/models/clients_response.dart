

import 'package:flutter_entrevista/src/domain/entities/client.dart';

class ClientsResponse {
    List<Client> data;

    ClientsResponse({
        required this.data,
    });

    factory ClientsResponse.fromJson(Map<String, dynamic> json) => ClientsResponse(
        data: List<Client>.from(json["data"].map((x) => Client.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

// {
//   "data": [
//     {
//       "id": 1,
//       "address": "Plaza Principal, Ciudad C",
//       "client_id": 1,
//       "created_at": "2024-02-13T23:57:40.000000Z",
//       "updated_at": "2024-02-13T23:57:40.000000Z",
//       "pivot": {
//         "user_id": 1,
//         "office_id": 1
//       }
//     },
//     {
//       "id": 3,
//       "address": "Calle 123, Ciudad A",
//       "client_id": 2,
//       "created_at": "2024-02-13T23:57:40.000000Z",
//       "updated_at": "2024-02-13T23:57:40.000000Z",
//       "pivot": {
//         "user_id": 1,
//         "office_id": 3
//       }
//     }
//   ]
// }