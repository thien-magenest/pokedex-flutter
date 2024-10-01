import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/common/types/model.dart';

part 'pagination_response_api_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResponseApiModel<T> {
  final int? count;
  final String? next;
  final String? previous;
  final List<T>? results;

  PaginationResponseApiModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PaginationResponseApiModel.fromJson(
    JsonMap json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginationResponseApiModelFromJson<T>(json, fromJsonT);

  JsonMap toJson(JsonMap Function(T) toJsonT) =>
      _$PaginationResponseApiModelToJson(this, toJsonT);
}
