// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_response_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationResponseApiModel<T> _$PaginationResponseApiModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PaginationResponseApiModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginationResponseApiModel<T> {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<T>? get results => throw _privateConstructorUsedError;

  /// Serializes this PaginationResponseApiModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PaginationResponseApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationResponseApiModelCopyWith<T, PaginationResponseApiModel<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationResponseApiModelCopyWith<T, $Res> {
  factory $PaginationResponseApiModelCopyWith(
          PaginationResponseApiModel<T> value,
          $Res Function(PaginationResponseApiModel<T>) then) =
      _$PaginationResponseApiModelCopyWithImpl<T, $Res,
          PaginationResponseApiModel<T>>;
  @useResult
  $Res call({int? count, String? next, String? previous, List<T>? results});
}

/// @nodoc
class _$PaginationResponseApiModelCopyWithImpl<T, $Res,
        $Val extends PaginationResponseApiModel<T>>
    implements $PaginationResponseApiModelCopyWith<T, $Res> {
  _$PaginationResponseApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationResponseApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationResponseApiModelImplCopyWith<T, $Res>
    implements $PaginationResponseApiModelCopyWith<T, $Res> {
  factory _$$PaginationResponseApiModelImplCopyWith(
          _$PaginationResponseApiModelImpl<T> value,
          $Res Function(_$PaginationResponseApiModelImpl<T>) then) =
      __$$PaginationResponseApiModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? count, String? next, String? previous, List<T>? results});
}

/// @nodoc
class __$$PaginationResponseApiModelImplCopyWithImpl<T, $Res>
    extends _$PaginationResponseApiModelCopyWithImpl<T, $Res,
        _$PaginationResponseApiModelImpl<T>>
    implements _$$PaginationResponseApiModelImplCopyWith<T, $Res> {
  __$$PaginationResponseApiModelImplCopyWithImpl(
      _$PaginationResponseApiModelImpl<T> _value,
      $Res Function(_$PaginationResponseApiModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PaginationResponseApiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$PaginationResponseApiModelImpl<T>(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginationResponseApiModelImpl<T>
    implements _PaginationResponseApiModel<T> {
  const _$PaginationResponseApiModelImpl(
      {this.count, this.next, this.previous, final List<T>? results})
      : _results = results;

  factory _$PaginationResponseApiModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PaginationResponseApiModelImplFromJson(json, fromJsonT);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<T>? _results;
  @override
  List<T>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaginationResponseApiModel<$T>(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationResponseApiModelImpl<T> &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of PaginationResponseApiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationResponseApiModelImplCopyWith<T,
          _$PaginationResponseApiModelImpl<T>>
      get copyWith => __$$PaginationResponseApiModelImplCopyWithImpl<T,
          _$PaginationResponseApiModelImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginationResponseApiModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _PaginationResponseApiModel<T>
    implements PaginationResponseApiModel<T> {
  const factory _PaginationResponseApiModel(
      {final int? count,
      final String? next,
      final String? previous,
      final List<T>? results}) = _$PaginationResponseApiModelImpl<T>;

  factory _PaginationResponseApiModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PaginationResponseApiModelImpl<T>.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<T>? get results;

  /// Create a copy of PaginationResponseApiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationResponseApiModelImplCopyWith<T,
          _$PaginationResponseApiModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
