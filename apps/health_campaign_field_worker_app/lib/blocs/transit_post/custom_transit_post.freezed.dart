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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)
        handleSelection,
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)
        handleDelivery,
    required TResult Function(int curCount, int totalCount, String? action)
        handleDeliveryCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)?
        handleSelection,
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult? Function(int curCount, int totalCount, String? action)?
        handleDeliveryCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? transitPostType, String? transitPostName)?
        handleSelection,
    TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult Function(int curCount, int totalCount, String? action)?
        handleDeliveryCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomTransitPostSelectionEvent value)
        handleSelection,
    required TResult Function(CustomTransitPostDeliveryEvent value)
        handleDelivery,
    required TResult Function(CustomTransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomTransitPostSelectionEvent value)? handleSelection,
    TResult? Function(CustomTransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(CustomTransitPostDeliveryCountEvent value)?
        handleDeliveryCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomTransitPostSelectionEvent value)? handleSelection,
    TResult Function(CustomTransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(CustomTransitPostDeliveryCountEvent value)?
        handleDeliveryCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomTransitPostEventCopyWith<$Res> {
  factory $CustomTransitPostEventCopyWith(CustomTransitPostEvent value,
          $Res Function(CustomTransitPostEvent) then) =
      _$CustomTransitPostEventCopyWithImpl<$Res, CustomTransitPostEvent>;
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
}

/// @nodoc
abstract class _$$CustomTransitPostSelectionEventImplCopyWith<$Res> {
  factory _$$CustomTransitPostSelectionEventImplCopyWith(
          _$CustomTransitPostSelectionEventImpl value,
          $Res Function(_$CustomTransitPostSelectionEventImpl) then) =
      __$$CustomTransitPostSelectionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? transitPostType,
      String? transitPostName});
}

/// @nodoc
class __$$CustomTransitPostSelectionEventImplCopyWithImpl<$Res>
    extends _$CustomTransitPostEventCopyWithImpl<$Res,
        _$CustomTransitPostSelectionEventImpl>
    implements _$$CustomTransitPostSelectionEventImplCopyWith<$Res> {
  __$$CustomTransitPostSelectionEventImplCopyWithImpl(
      _$CustomTransitPostSelectionEventImpl _value,
      $Res Function(_$CustomTransitPostSelectionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? transitPostType = freezed,
    Object? transitPostName = freezed,
  }) {
    return _then(_$CustomTransitPostSelectionEventImpl(
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

class _$CustomTransitPostSelectionEventImpl
    implements CustomTransitPostSelectionEvent {
  const _$CustomTransitPostSelectionEventImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.transitPostType,
      this.transitPostName});

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
    return 'CustomTransitPostEvent.handleSelection(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, transitPostType: $transitPostType, transitPostName: $transitPostName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomTransitPostSelectionEventImpl &&
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
  int get hashCode => Object.hash(runtimeType, latitude, longitude,
      locationAccuracy, transitPostType, transitPostName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomTransitPostSelectionEventImplCopyWith<
          _$CustomTransitPostSelectionEventImpl>
      get copyWith => __$$CustomTransitPostSelectionEventImplCopyWithImpl<
          _$CustomTransitPostSelectionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)
        handleSelection,
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)
        handleDelivery,
    required TResult Function(int curCount, int totalCount, String? action)
        handleDeliveryCount,
  }) {
    return handleSelection(latitude, longitude, locationAccuracy,
        transitPostType, transitPostName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)?
        handleSelection,
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult? Function(int curCount, int totalCount, String? action)?
        handleDeliveryCount,
  }) {
    return handleSelection?.call(latitude, longitude, locationAccuracy,
        transitPostType, transitPostName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? transitPostType, String? transitPostName)?
        handleSelection,
    TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult Function(int curCount, int totalCount, String? action)?
        handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleSelection != null) {
      return handleSelection(latitude, longitude, locationAccuracy,
          transitPostType, transitPostName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomTransitPostSelectionEvent value)
        handleSelection,
    required TResult Function(CustomTransitPostDeliveryEvent value)
        handleDelivery,
    required TResult Function(CustomTransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomTransitPostSelectionEvent value)? handleSelection,
    TResult? Function(CustomTransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(CustomTransitPostDeliveryCountEvent value)?
        handleDeliveryCount,
  }) {
    return handleSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomTransitPostSelectionEvent value)? handleSelection,
    TResult Function(CustomTransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(CustomTransitPostDeliveryCountEvent value)?
        handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleSelection != null) {
      return handleSelection(this);
    }
    return orElse();
  }
}

abstract class CustomTransitPostSelectionEvent
    implements CustomTransitPostEvent {
  const factory CustomTransitPostSelectionEvent(
      {final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? transitPostType,
      final String? transitPostName}) = _$CustomTransitPostSelectionEventImpl;

  double get latitude;
  double get longitude;
  double get locationAccuracy;
  String? get transitPostType;
  String? get transitPostName;
  @JsonKey(ignore: true)
  _$$CustomTransitPostSelectionEventImplCopyWith<
          _$CustomTransitPostSelectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomTransitPostDeliveryEventImplCopyWith<$Res> {
  factory _$$CustomTransitPostDeliveryEventImplCopyWith(
          _$CustomTransitPostDeliveryEventImpl value,
          $Res Function(_$CustomTransitPostDeliveryEventImpl) then) =
      __$$CustomTransitPostDeliveryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? scannedResource,
      String? action,
      int? curCount,
      int? totalCount});
}

/// @nodoc
class __$$CustomTransitPostDeliveryEventImplCopyWithImpl<$Res>
    extends _$CustomTransitPostEventCopyWithImpl<$Res,
        _$CustomTransitPostDeliveryEventImpl>
    implements _$$CustomTransitPostDeliveryEventImplCopyWith<$Res> {
  __$$CustomTransitPostDeliveryEventImplCopyWithImpl(
      _$CustomTransitPostDeliveryEventImpl _value,
      $Res Function(_$CustomTransitPostDeliveryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? scannedResource = freezed,
    Object? action = freezed,
    Object? curCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$CustomTransitPostDeliveryEventImpl(
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
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      curCount: freezed == curCount
          ? _value.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CustomTransitPostDeliveryEventImpl
    implements CustomTransitPostDeliveryEvent {
  const _$CustomTransitPostDeliveryEventImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.scannedResource,
      this.action,
      this.curCount,
      this.totalCount});

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
  final String? action;
  @override
  final int? curCount;
  @override
  final int? totalCount;

  @override
  String toString() {
    return 'CustomTransitPostEvent.handleDelivery(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, scannedResource: $scannedResource, action: $action, curCount: $curCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomTransitPostDeliveryEventImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.scannedResource, scannedResource) ||
                other.scannedResource == scannedResource) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.curCount, curCount) ||
                other.curCount == curCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude,
      locationAccuracy, scannedResource, action, curCount, totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomTransitPostDeliveryEventImplCopyWith<
          _$CustomTransitPostDeliveryEventImpl>
      get copyWith => __$$CustomTransitPostDeliveryEventImplCopyWithImpl<
          _$CustomTransitPostDeliveryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)
        handleSelection,
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)
        handleDelivery,
    required TResult Function(int curCount, int totalCount, String? action)
        handleDeliveryCount,
  }) {
    return handleDelivery(latitude, longitude, locationAccuracy,
        scannedResource, action, curCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)?
        handleSelection,
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult? Function(int curCount, int totalCount, String? action)?
        handleDeliveryCount,
  }) {
    return handleDelivery?.call(latitude, longitude, locationAccuracy,
        scannedResource, action, curCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? transitPostType, String? transitPostName)?
        handleSelection,
    TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult Function(int curCount, int totalCount, String? action)?
        handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleDelivery != null) {
      return handleDelivery(latitude, longitude, locationAccuracy,
          scannedResource, action, curCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomTransitPostSelectionEvent value)
        handleSelection,
    required TResult Function(CustomTransitPostDeliveryEvent value)
        handleDelivery,
    required TResult Function(CustomTransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleDelivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomTransitPostSelectionEvent value)? handleSelection,
    TResult? Function(CustomTransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(CustomTransitPostDeliveryCountEvent value)?
        handleDeliveryCount,
  }) {
    return handleDelivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomTransitPostSelectionEvent value)? handleSelection,
    TResult Function(CustomTransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(CustomTransitPostDeliveryCountEvent value)?
        handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleDelivery != null) {
      return handleDelivery(this);
    }
    return orElse();
  }
}

abstract class CustomTransitPostDeliveryEvent
    implements CustomTransitPostEvent {
  const factory CustomTransitPostDeliveryEvent(
      {final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? scannedResource,
      final String? action,
      final int? curCount,
      final int? totalCount}) = _$CustomTransitPostDeliveryEventImpl;

  double get latitude;
  double get longitude;
  double get locationAccuracy;
  String? get scannedResource;
  String? get action;
  int? get curCount;
  int? get totalCount;
  @JsonKey(ignore: true)
  _$$CustomTransitPostDeliveryEventImplCopyWith<
          _$CustomTransitPostDeliveryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomTransitPostDeliveryCountEventImplCopyWith<$Res> {
  factory _$$CustomTransitPostDeliveryCountEventImplCopyWith(
          _$CustomTransitPostDeliveryCountEventImpl value,
          $Res Function(_$CustomTransitPostDeliveryCountEventImpl) then) =
      __$$CustomTransitPostDeliveryCountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int curCount, int totalCount, String? action});
}

/// @nodoc
class __$$CustomTransitPostDeliveryCountEventImplCopyWithImpl<$Res>
    extends _$CustomTransitPostEventCopyWithImpl<$Res,
        _$CustomTransitPostDeliveryCountEventImpl>
    implements _$$CustomTransitPostDeliveryCountEventImplCopyWith<$Res> {
  __$$CustomTransitPostDeliveryCountEventImplCopyWithImpl(
      _$CustomTransitPostDeliveryCountEventImpl _value,
      $Res Function(_$CustomTransitPostDeliveryCountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curCount = null,
    Object? totalCount = null,
    Object? action = freezed,
  }) {
    return _then(_$CustomTransitPostDeliveryCountEventImpl(
      curCount: null == curCount
          ? _value.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CustomTransitPostDeliveryCountEventImpl
    implements CustomTransitPostDeliveryCountEvent {
  const _$CustomTransitPostDeliveryCountEventImpl(
      {this.curCount = 0, this.totalCount = 0, this.action});

  @override
  @JsonKey()
  final int curCount;
  @override
  @JsonKey()
  final int totalCount;
  @override
  final String? action;

  @override
  String toString() {
    return 'CustomTransitPostEvent.handleDeliveryCount(curCount: $curCount, totalCount: $totalCount, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomTransitPostDeliveryCountEventImpl &&
            (identical(other.curCount, curCount) ||
                other.curCount == curCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, curCount, totalCount, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomTransitPostDeliveryCountEventImplCopyWith<
          _$CustomTransitPostDeliveryCountEventImpl>
      get copyWith => __$$CustomTransitPostDeliveryCountEventImplCopyWithImpl<
          _$CustomTransitPostDeliveryCountEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)
        handleSelection,
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)
        handleDelivery,
    required TResult Function(int curCount, int totalCount, String? action)
        handleDeliveryCount,
  }) {
    return handleDeliveryCount(curCount, totalCount, action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? transitPostType,
            String? transitPostName)?
        handleSelection,
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult? Function(int curCount, int totalCount, String? action)?
        handleDeliveryCount,
  }) {
    return handleDeliveryCount?.call(curCount, totalCount, action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? transitPostType, String? transitPostName)?
        handleSelection,
    TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? scannedResource,
            String? action,
            int? curCount,
            int? totalCount)?
        handleDelivery,
    TResult Function(int curCount, int totalCount, String? action)?
        handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleDeliveryCount != null) {
      return handleDeliveryCount(curCount, totalCount, action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CustomTransitPostSelectionEvent value)
        handleSelection,
    required TResult Function(CustomTransitPostDeliveryEvent value)
        handleDelivery,
    required TResult Function(CustomTransitPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleDeliveryCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CustomTransitPostSelectionEvent value)? handleSelection,
    TResult? Function(CustomTransitPostDeliveryEvent value)? handleDelivery,
    TResult? Function(CustomTransitPostDeliveryCountEvent value)?
        handleDeliveryCount,
  }) {
    return handleDeliveryCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CustomTransitPostSelectionEvent value)? handleSelection,
    TResult Function(CustomTransitPostDeliveryEvent value)? handleDelivery,
    TResult Function(CustomTransitPostDeliveryCountEvent value)?
        handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleDeliveryCount != null) {
      return handleDeliveryCount(this);
    }
    return orElse();
  }
}

abstract class CustomTransitPostDeliveryCountEvent
    implements CustomTransitPostEvent {
  const factory CustomTransitPostDeliveryCountEvent(
      {final int curCount,
      final int totalCount,
      final String? action}) = _$CustomTransitPostDeliveryCountEventImpl;

  int get curCount;
  int get totalCount;
  String? get action;
  @JsonKey(ignore: true)
  _$$CustomTransitPostDeliveryCountEventImplCopyWith<
          _$CustomTransitPostDeliveryCountEventImpl>
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
  int? get curCount => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

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
      String? transitPostName,
      int? curCount,
      int? totalCount});
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
    Object? curCount = freezed,
    Object? totalCount = freezed,
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
      curCount: freezed == curCount
          ? _value.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      String? transitPostName,
      int? curCount,
      int? totalCount});
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
    Object? curCount = freezed,
    Object? totalCount = freezed,
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
      curCount: freezed == curCount
          ? _value.curCount
          : curCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
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
      this.transitPostName,
      this.curCount,
      this.totalCount});

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
  final int? curCount;
  @override
  final int? totalCount;

  @override
  String toString() {
    return 'CustomTransitPostState(loading: $loading, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, transitPostType: $transitPostType, transitPostName: $transitPostName, curCount: $curCount, totalCount: $totalCount)';
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
                other.transitPostName == transitPostName) &&
            (identical(other.curCount, curCount) ||
                other.curCount == curCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      latitude,
      longitude,
      locationAccuracy,
      transitPostType,
      transitPostName,
      curCount,
      totalCount);

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
      final String? transitPostName,
      final int? curCount,
      final int? totalCount}) = _$CustomTransitPostStateImpl;

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
  int? get curCount;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$CustomTransitPostStateImplCopyWith<_$CustomTransitPostStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
