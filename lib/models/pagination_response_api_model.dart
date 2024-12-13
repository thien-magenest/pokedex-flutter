import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon/common/types/model.dart';

part 'pagination_response_api_model.freezed.dart';
part 'pagination_response_api_model.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class PaginationResponseApiModel<T>
    with _$PaginationResponseApiModel<T> {
  const factory PaginationResponseApiModel({
    int? count,
    String? next,
    String? previous,
    List<T>? results,
  }) = _PaginationResponseApiModel;

  factory PaginationResponseApiModel.fromJson(
    JsonMap json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginationResponseApiModelFromJson<T>(json, fromJsonT);
}
