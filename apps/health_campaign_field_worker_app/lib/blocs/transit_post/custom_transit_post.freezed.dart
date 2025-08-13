// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_transit_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomTransitPostEvent {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get locationAccuracy => throw _privateConstructorUsedError;
  String? get scannedResource => throw _privateConstructorUsedError;
  String? get drugType => throw _privateConstructorUsedError;
  int? get beneficiaryDelivered => throw _privateConstructorUsedError;
  List<AdditionalField>? get additionalFields =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? drugType,
            int? beneficiaryDelivered,
            List<AdditionalField>? additionalFields)
        submitDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? drugType,
            int? beneficiaryDelivered,
            List<AdditionalField>? additionalFields)?
        submitDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? drugType,
            int? beneficiaryDelivered,
            List<AdditionalField>? additionalFields)?
        submitDelivery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransitPostSubmitDeliveryEvent value)
        submitDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransitPostSubmitDeliveryEvent value)? submitDelivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransitPostSubmitDeliveryEvent value)? submitDelivery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomTransitPostEventCopyWith<CustomTransitPostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomTransitPostEventCopyWith<$Res> {
  factory $CustomTransitPostEventCopyWith(CustomTransitPostEvent value,
          $Res Function(CustomTransitPostEvent) then) =
      _$CustomTransitPostEventCopyWithImpl<$Res, CustomTransitPostEvent>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? scannedResource,
      String? drugType,
      int? beneficiaryDelivered,
      List<AdditionalField>? additionalFields});
}

/// @nodoc
class _$CustomTransitPostEventCopyWithImpl<$Res,
        $Val extends CustomTransitPostEvent>
    implements $CustomTransitPostEventCopyWith<$Res> {
  _$CustomTransitPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? scannedResource = freezed,
    Object? drugType = freezed,
    Object? beneficiaryDelivered = freezed,
    Object? additionalFields = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      scannedResource: freezed == scannedResource
          ? _value.scannedResource
          : scannedResource // ignore: cast_nullable_to_non_nullable
              as String?,
      drugType: freezed == drugType
          ? _value.drugType
          : drugType // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryDelivered: freezed == beneficiaryDelivered
          ? _value.beneficiaryDelivered
          : beneficiaryDelivered // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalFields: freezed == additionalFields
          ? _value.additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as List<AdditionalField>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransitPostSubmitDeliveryEventImplCopyWith<$Res>
    implements $CustomTransitPostEventCopyWith<$Res> {
  factory _$$TransitPostSubmitDeliveryEventImplCopyWith(
          _$TransitPostSubmitDeliveryEventImpl value,
          $Res Function(_$TransitPostSubmitDeliveryEventImpl) then) =
      __$$TransitPostSubmitDeliveryEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? scannedResource,
      String? drugType,
      int? beneficiaryDelivered,
      List<AdditionalField>? additionalFields});
}

/// @nodoc
class __$$TransitPostSubmitDeliveryEventImplCopyWithImpl<$Res>
    extends _$CustomTransitPostEventCopyWithImpl<$Res,
        _$TransitPostSubmitDeliveryEventImpl>
    implements _$$TransitPostSubmitDeliveryEventImplCopyWith<$Res> {
  __$$TransitPostSubmitDeliveryEventImplCopyWithImpl(
      _$TransitPostSubmitDeliveryEventImpl _value,
      $Res Function(_$TransitPostSubmitDeliveryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? scannedResource = freezed,
    Object? drugType = freezed,
    Object? beneficiaryDelivered = freezed,
    Object? additionalFields = freezed,
  }) {
    return _then(_$TransitPostSubmitDeliveryEventImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      scannedResource: freezed == scannedResource
          ? _value.scannedResource
          : scannedResource // ignore: cast_nullable_to_non_nullable
              as String?,
      drugType: freezed == drugType
          ? _value.drugType
          : drugType // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryDelivered: freezed == beneficiaryDelivered
          ? _value.beneficiaryDelivered
          : beneficiaryDelivered // ignore: cast_nullable_to_non_nullable
              as int?,
      additionalFields: freezed == additionalFields
          ? _value._additionalFields
          : additionalFields // ignore: cast_nullable_to_non_nullable
              as List<AdditionalField>?,
    ));
  }
}

/// @nodoc

class _$TransitPostSubmitDeliveryEventImpl
    implements TransitPostSubmitDeliveryEvent {
  const _$TransitPostSubmitDeliveryEventImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.scannedResource,
      this.drugType,
      this.beneficiaryDelivered,
      final List<AdditionalField>? additionalFields})
      : _additionalFields = additionalFields;

  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final double locationAccuracy;
  @override
  final String? scannedResource;
  @override
  final String? drugType;
  @override
  final int? beneficiaryDelivered;
  final List<AdditionalField>? _additionalFields;
  @override
  List<AdditionalField>? get additionalFields {
    final value = _additionalFields;
    if (value == null) return null;
    if (_additionalFields is EqualUnmodifiableListView)
      return _additionalFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CustomTransitPostEvent.submitDelivery(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, scannedResource: $scannedResource, drugType: $drugType, beneficiaryDelivered: $beneficiaryDelivered, additionalFields: $additionalFields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransitPostSubmitDeliveryEventImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.scannedResource, scannedResource) ||
                other.scannedResource == scannedResource) &&
            (identical(other.drugType, drugType) ||
                other.drugType == drugType) &&
            (identical(other.beneficiaryDelivered, beneficiaryDelivered) ||
                other.beneficiaryDelivered == beneficiaryDelivered) &&
            const DeepCollectionEquality()
                .equals(other._additionalFields, _additionalFields));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      latitude,
      longitude,
      locationAccuracy,
      scannedResource,
      drugType,
      beneficiaryDelivered,
      const DeepCollectionEquality().hash(_additionalFields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransitPostSubmitDeliveryEventImplCopyWith<
          _$TransitPostSubmitDeliveryEventImpl>
      get copyWith => __$$TransitPostSubmitDeliveryEventImplCopyWithImpl<
          _$TransitPostSubmitDeliveryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? drugType,
            int? beneficiaryDelivered,
            List<AdditionalField>? additionalFields)
        submitDelivery,
  }) {
    return submitDelivery(latitude, longitude, locationAccuracy,
        scannedResource, drugType, beneficiaryDelivered, additionalFields);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? drugType,
            int? beneficiaryDelivered,
            List<AdditionalField>? additionalFields)?
        submitDelivery,
  }) {
    return submitDelivery?.call(latitude, longitude, locationAccuracy,
        scannedResource, drugType, beneficiaryDelivered, additionalFields);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? drugType,
            int? beneficiaryDelivered,
            List<AdditionalField>? additionalFields)?
        submitDelivery,
    required TResult orElse(),
  }) {
    if (submitDelivery != null) {
      return submitDelivery(latitude, longitude, locationAccuracy,
          scannedResource, drugType, beneficiaryDelivered, additionalFields);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransitPostSubmitDeliveryEvent value)
        submitDelivery,
  }) {
    return submitDelivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransitPostSubmitDeliveryEvent value)? submitDelivery,
  }) {
    return submitDelivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransitPostSubmitDeliveryEvent value)? submitDelivery,
    required TResult orElse(),
  }) {
    if (submitDelivery != null) {
      return submitDelivery(this);
    }
    return orElse();
  }
}

abstract class TransitPostSubmitDeliveryEvent
    implements CustomTransitPostEvent {
  const factory TransitPostSubmitDeliveryEvent(
          {final double latitude,
          final double longitude,
          final double locationAccuracy,
          final String? scannedResource,
          final String? drugType,
          final int? beneficiaryDelivered,
          final List<AdditionalField>? additionalFields}) =
      _$TransitPostSubmitDeliveryEventImpl;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get locationAccuracy;
  @override
  String? get scannedResource;
  @override
  String? get drugType;
  @override
  int? get beneficiaryDelivered;
  @override
  List<AdditionalField>? get additionalFields;
  @override
  @JsonKey(ignore: true)
  _$$TransitPostSubmitDeliveryEventImplCopyWith<
          _$TransitPostSubmitDeliveryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomTransitPostState {
  dynamic get loading => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get locationAccuracy => throw _privateConstructorUsedError;
  String? get transitPostType => throw _privateConstructorUsedError;
  String? get transitPostName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomTransitPostStateCopyWith<CustomTransitPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomTransitPostStateCopyWith<$Res> {
  factory $CustomTransitPostStateCopyWith(CustomTransitPostState value,
          $Res Function(CustomTransitPostState) then) =
      _$CustomTransitPostStateCopyWithImpl<$Res, CustomTransitPostState>;
  @useResult
  $Res call(
      {dynamic loading,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? transitPostType,
      String? transitPostName});
}

/// @nodoc
class _$CustomTransitPostStateCopyWithImpl<$Res,
        $Val extends CustomTransitPostState>
    implements $CustomTransitPostStateCopyWith<$Res> {
  _$CustomTransitPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? transitPostType = freezed,
    Object? transitPostName = freezed,
  }) {
    return _then(_value.copyWith(
      loading: freezed == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      transitPostType: freezed == transitPostType
          ? _value.transitPostType
          : transitPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      transitPostName: freezed == transitPostName
          ? _value.transitPostName
          : transitPostName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomTransitPostStateImplCopyWith<$Res>
    implements $CustomTransitPostStateCopyWith<$Res> {
  factory _$$CustomTransitPostStateImplCopyWith(
          _$CustomTransitPostStateImpl value,
          $Res Function(_$CustomTransitPostStateImpl) then) =
      __$$CustomTransitPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic loading,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? transitPostType,
      String? transitPostName});
}

/// @nodoc
class __$$CustomTransitPostStateImplCopyWithImpl<$Res>
    extends _$CustomTransitPostStateCopyWithImpl<$Res,
        _$CustomTransitPostStateImpl>
    implements _$$CustomTransitPostStateImplCopyWith<$Res> {
  __$$CustomTransitPostStateImplCopyWithImpl(
      _$CustomTransitPostStateImpl _value,
      $Res Function(_$CustomTransitPostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? transitPostType = freezed,
    Object? transitPostName = freezed,
  }) {
    return _then(_$CustomTransitPostStateImpl(
      loading: freezed == loading ? _value.loading! : loading,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double,
      transitPostType: freezed == transitPostType
          ? _value.transitPostType
          : transitPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      transitPostName: freezed == transitPostName
          ? _value.transitPostName
          : transitPostName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CustomTransitPostStateImpl implements _CustomTransitPostState {
  const _$CustomTransitPostStateImpl(
      {this.loading = false,
      this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.transitPostType,
      this.transitPostName});

  @override
  @JsonKey()
  final dynamic loading;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  @JsonKey()
  final double locationAccuracy;
  @override
  final String? transitPostType;
  @override
  final String? transitPostName;

  @override
  String toString() {
    return 'CustomTransitPostState(loading: $loading, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, transitPostType: $transitPostType, transitPostName: $transitPostName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomTransitPostStateImpl &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.transitPostType, transitPostType) ||
                other.transitPostType == transitPostType) &&
            (identical(other.transitPostName, transitPostName) ||
                other.transitPostName == transitPostName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      latitude,
      longitude,
      locationAccuracy,
      transitPostType,
      transitPostName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomTransitPostStateImplCopyWith<_$CustomTransitPostStateImpl>
      get copyWith => __$$CustomTransitPostStateImplCopyWithImpl<
          _$CustomTransitPostStateImpl>(this, _$identity);
}

abstract class _CustomTransitPostState implements CustomTransitPostState {
  const factory _CustomTransitPostState(
      {final dynamic loading,
      final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? transitPostType,
      final String? transitPostName}) = _$CustomTransitPostStateImpl;

  @override
  dynamic get loading;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get locationAccuracy;
  @override
  String? get transitPostType;
  @override
  String? get transitPostName;
  @override
  @JsonKey(ignore: true)
  _$$CustomTransitPostStateImplCopyWith<_$CustomTransitPostStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
