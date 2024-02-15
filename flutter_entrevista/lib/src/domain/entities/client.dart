
class Client {
    int id;
    String address;
    int clientId;
    DateTime createdAt;
    DateTime updatedAt;
    Pivot pivot;

    Client({
        required this.id,
        required this.address,
        required this.clientId,
        required this.createdAt,
        required this.updatedAt,
        required this.pivot,
    });

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        address: json["address"],
        clientId: json["client_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "client_id": clientId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
    };
}

class Pivot {
    int userId;
    int officeId;

    Pivot({
        required this.userId,
        required this.officeId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        officeId: json["office_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "office_id": officeId,
    };
}

