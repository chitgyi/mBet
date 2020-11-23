import 'package:json_annotation/json_annotation.dart';
part 'user_vo.g.dart';

@JsonSerializable()
class UserVO {
  final String name;

  @JsonKey(name: 'img_url')
  final String imgUrl;
  final String email;
  final int price;

  UserVO({
    this.name,
    this.email,
    this.imgUrl,
    this.price,
  });

  factory UserVO.fromJson(Map<String, dynamic> json) => _$UserVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserVOToJson(this);
}
