import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  final int code;
  final String message;
  final dynamic data;
  final ResponseMetaData meta;

  ApiResponse({
    this.code,
    this.data,
    this.message,
    this.meta,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}

@JsonSerializable()
class ResponseMetaData {
  final int total;

  @JsonKey(name: 'next_page_url')
  final String nextPageUrl;

  @JsonKey(name: 'pre_page_url')
  final String prePageUrl;

  @JsonKey(name: 'last_page_no')
  final int lastPageNumber;

  @JsonKey(name: 'per_page')
  final int numberOfPerPage;

  ResponseMetaData({
    this.total,
    this.prePageUrl,
    this.nextPageUrl,
    this.lastPageNumber,
    this.numberOfPerPage,
  });
  factory ResponseMetaData.fromJson(Map<String, dynamic> json) =>
      _$ResponseMetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseMetaDataToJson(this);
}
