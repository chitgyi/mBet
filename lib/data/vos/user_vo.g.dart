// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVO _$UserVOFromJson(Map<String, dynamic> json) {
  return UserVO(
    name: json['name'] as String,
    email: json['email'] as String,
    imgUrl: json['img_url'] as String,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$UserVOToJson(UserVO instance) => <String, dynamic>{
      'name': instance.name,
      'img_url': instance.imgUrl,
      'email': instance.email,
      'price': instance.price,
    };
