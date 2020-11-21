// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse(
    code: json['code'] as int,
    data: json['data'],
    message: json['message'] as String,
    meta: json['meta'] == null
        ? null
        : ResponseMetaData.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

ResponseMetaData _$ResponseMetaDataFromJson(Map<String, dynamic> json) {
  return ResponseMetaData(
    total: json['total'] as int,
    prePageUrl: json['pre_page_url'] as String,
    nextPageUrl: json['next_page_url'] as String,
    lastPageNumber: json['last_page_no'] as int,
    numberOfPerPage: json['per_page'] as int,
  );
}

Map<String, dynamic> _$ResponseMetaDataToJson(ResponseMetaData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'next_page_url': instance.nextPageUrl,
      'pre_page_url': instance.prePageUrl,
      'last_page_no': instance.lastPageNumber,
      'per_page': instance.numberOfPerPage,
    };
