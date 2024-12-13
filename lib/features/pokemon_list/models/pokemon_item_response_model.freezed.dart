// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_item_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonItemResponseModel _$PokemonItemResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PokemonItemResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PokemonItemResponseModel {
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this PokemonItemResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonItemResponseModelCopyWith<PokemonItemResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonItemResponseModelCopyWith<$Res> {
  factory $PokemonItemResponseModelCopyWith(PokemonItemResponseModel value,
          $Res Function(PokemonItemResponseModel) then) =
      _$PokemonItemResponseModelCopyWithImpl<$Res, PokemonItemResponseModel>;
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class _$PokemonItemResponseModelCopyWithImpl<$Res,
        $Val extends PokemonItemResponseModel>
    implements $PokemonItemResponseModelCopyWith<$Res> {
  _$PokemonItemResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonItemResponseModelImplCopyWith<$Res>
    implements $PokemonItemResponseModelCopyWith<$Res> {
  factory _$$PokemonItemResponseModelImplCopyWith(
          _$PokemonItemResponseModelImpl value,
          $Res Function(_$PokemonItemResponseModelImpl) then) =
      __$$PokemonItemResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? url});
}

/// @nodoc
class __$$PokemonItemResponseModelImplCopyWithImpl<$Res>
    extends _$PokemonItemResponseModelCopyWithImpl<$Res,
        _$PokemonItemResponseModelImpl>
    implements _$$PokemonItemResponseModelImplCopyWith<$Res> {
  __$$PokemonItemResponseModelImplCopyWithImpl(
      _$PokemonItemResponseModelImpl _value,
      $Res Function(_$PokemonItemResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? url = freezed,
  }) {
    return _then(_$PokemonItemResponseModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonItemResponseModelImpl implements _PokemonItemResponseModel {
  const _$PokemonItemResponseModelImpl({this.name, this.url});

  factory _$PokemonItemResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonItemResponseModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? url;

  @override
  String toString() {
    return 'PokemonItemResponseModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonItemResponseModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokemonItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonItemResponseModelImplCopyWith<_$PokemonItemResponseModelImpl>
      get copyWith => __$$PokemonItemResponseModelImplCopyWithImpl<
          _$PokemonItemResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonItemResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PokemonItemResponseModel implements PokemonItemResponseModel {
  const factory _PokemonItemResponseModel(
      {final String? name, final String? url}) = _$PokemonItemResponseModelImpl;

  factory _PokemonItemResponseModel.fromJson(Map<String, dynamic> json) =
      _$PokemonItemResponseModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get url;

  /// Create a copy of PokemonItemResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonItemResponseModelImplCopyWith<_$PokemonItemResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
