import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_model.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@unfreezed
class Company with _$Company {
  @JsonSerializable(explicitToJson: true)
  factory Company({
    String? id,
    required String name,
    required ImageModel logo,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}