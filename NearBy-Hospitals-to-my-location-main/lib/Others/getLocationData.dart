import 'dart:convert';

GetLocationData getLocationDataFromJson(String str) => GetLocationData.fromJson(json.decode(str));

String getLocationDataToJson(GetLocationData data) => json.encode(data.toJson());

class GetLocationData {
  GetLocationData({
    this.id,
    this.userId,
    this.lat,
    this.lan,
    this.timestamp,
  });

  int? id;
  String? userId;
  double? lat;
  double? lan;
  dynamic timestamp;

  factory GetLocationData.fromJson(Map<String, dynamic> json) => GetLocationData(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
    lan: json["lan"] == null ? null : json["lan"].toDouble(),
    timestamp: json["Timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "lat": lat == null ? null : lat,
    "lan": lan == null ? null : lan,
    "Timestamp": timestamp,
  };
}
