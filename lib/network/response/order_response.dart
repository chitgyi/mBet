import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse {
  final int code;
  final String message;
  final OrderDetailsResponse data;

  OrderResponse({
    this.code,
    this.data,
    this.message,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class OrderDetailsResponse {
  final List<Map<String, int>> failedIDs;
  final List<Map<String, int>> successIDs;

  OrderDetailsResponse({
    this.failedIDs,
    this.successIDs,
  });

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsResponseToJson(this);
}
