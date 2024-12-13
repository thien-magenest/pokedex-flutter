// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationResponseApiModelImpl<T>
    _$$PaginationResponseApiModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
        _$PaginationResponseApiModelImpl<T>(
          count: (json['count'] as num?)?.toInt(),
          next: json['next'] as String?,
          previous: json['previous'] as String?,
          results: (json['results'] as List<dynamic>?)?.map(fromJsonT).toList(),
        );

Map<String, dynamic> _$$PaginationResponseApiModelImplToJson<T>(
  _$PaginationResponseApiModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map(toJsonT).toList(),
    };
