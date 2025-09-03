// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fixed_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FixedPostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? fixedPostType,
            String? fixedPostName)
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
            String? fixedPostType,
            String? fixedPostName)?
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
            String? fixedPostType, String? fixedPostName)?
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
    required TResult Function(FixedPostSelectionEvent value) handleSelection,
    required TResult Function(FixedPostDeliveryEvent value) handleDelivery,
    required TResult Function(FixedPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FixedPostSelectionEvent value)? handleSelection,
    TResult? Function(FixedPostDeliveryEvent value)? handleDelivery,
    TResult? Function(FixedPostDeliveryCountEvent value)? handleDeliveryCount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FixedPostSelectionEvent value)? handleSelection,
    TResult Function(FixedPostDeliveryEvent value)? handleDelivery,
    TResult Function(FixedPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixedPostEventCopyWith<$Res> {
  factory $FixedPostEventCopyWith(
          FixedPostEvent value, $Res Function(FixedPostEvent) then) =
      _$FixedPostEventCopyWithImpl<$Res, FixedPostEvent>;
}

/// @nodoc
class _$FixedPostEventCopyWithImpl<$Res, $Val extends FixedPostEvent>
    implements $FixedPostEventCopyWith<$Res> {
  _$FixedPostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FixedPostSelectionEventImplCopyWith<$Res> {
  factory _$$FixedPostSelectionEventImplCopyWith(
          _$FixedPostSelectionEventImpl value,
          $Res Function(_$FixedPostSelectionEventImpl) then) =
      __$$FixedPostSelectionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double locationAccuracy,
      String? fixedPostType,
      String? fixedPostName});
}

/// @nodoc
class __$$FixedPostSelectionEventImplCopyWithImpl<$Res>
    extends _$FixedPostEventCopyWithImpl<$Res, _$FixedPostSelectionEventImpl>
    implements _$$FixedPostSelectionEventImplCopyWith<$Res> {
  __$$FixedPostSelectionEventImplCopyWithImpl(
      _$FixedPostSelectionEventImpl _value,
      $Res Function(_$FixedPostSelectionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? fixedPostType = freezed,
    Object? fixedPostName = freezed,
  }) {
    return _then(_$FixedPostSelectionEventImpl(
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
      fixedPostType: freezed == fixedPostType
          ? _value.fixedPostType
          : fixedPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      fixedPostName: freezed == fixedPostName
          ? _value.fixedPostName
          : fixedPostName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FixedPostSelectionEventImpl implements FixedPostSelectionEvent {
  const _$FixedPostSelectionEventImpl(
      {this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.fixedPostType,
      this.fixedPostName});

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
  final String? fixedPostType;
  @override
  final String? fixedPostName;

  @override
  String toString() {
    return 'FixedPostEvent.handleSelection(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, fixedPostType: $fixedPostType, fixedPostName: $fixedPostName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixedPostSelectionEventImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.fixedPostType, fixedPostType) ||
                other.fixedPostType == fixedPostType) &&
            (identical(other.fixedPostName, fixedPostName) ||
                other.fixedPostName == fixedPostName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude,
      locationAccuracy, fixedPostType, fixedPostName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FixedPostSelectionEventImplCopyWith<_$FixedPostSelectionEventImpl>
      get copyWith => __$$FixedPostSelectionEventImplCopyWithImpl<
          _$FixedPostSelectionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? fixedPostType,
            String? fixedPostName)
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
    return handleSelection(
        latitude, longitude, locationAccuracy, fixedPostType, fixedPostName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? fixedPostType,
            String? fixedPostName)?
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
    return handleSelection?.call(
        latitude, longitude, locationAccuracy, fixedPostType, fixedPostName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude, double locationAccuracy,
            String? fixedPostType, String? fixedPostName)?
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
      return handleSelection(
          latitude, longitude, locationAccuracy, fixedPostType, fixedPostName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FixedPostSelectionEvent value) handleSelection,
    required TResult Function(FixedPostDeliveryEvent value) handleDelivery,
    required TResult Function(FixedPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FixedPostSelectionEvent value)? handleSelection,
    TResult? Function(FixedPostDeliveryEvent value)? handleDelivery,
    TResult? Function(FixedPostDeliveryCountEvent value)? handleDeliveryCount,
  }) {
    return handleSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FixedPostSelectionEvent value)? handleSelection,
    TResult Function(FixedPostDeliveryEvent value)? handleDelivery,
    TResult Function(FixedPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleSelection != null) {
      return handleSelection(this);
    }
    return orElse();
  }
}

abstract class FixedPostSelectionEvent implements FixedPostEvent {
  const factory FixedPostSelectionEvent(
      {final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? fixedPostType,
      final String? fixedPostName}) = _$FixedPostSelectionEventImpl;

  double get latitude;
  double get longitude;
  double get locationAccuracy;
  String? get fixedPostType;
  String? get fixedPostName;
  @JsonKey(ignore: true)
  _$$FixedPostSelectionEventImplCopyWith<_$FixedPostSelectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FixedPostDeliveryEventImplCopyWith<$Res> {
  factory _$$FixedPostDeliveryEventImplCopyWith(
          _$FixedPostDeliveryEventImpl value,
          $Res Function(_$FixedPostDeliveryEventImpl) then) =
      __$$FixedPostDeliveryEventImplCopyWithImpl<$Res>;
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
class __$$FixedPostDeliveryEventImplCopyWithImpl<$Res>
    extends _$FixedPostEventCopyWithImpl<$Res, _$FixedPostDeliveryEventImpl>
    implements _$$FixedPostDeliveryEventImplCopyWith<$Res> {
  __$$FixedPostDeliveryEventImplCopyWithImpl(
      _$FixedPostDeliveryEventImpl _value,
      $Res Function(_$FixedPostDeliveryEventImpl) _then)
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
    return _then(_$FixedPostDeliveryEventImpl(
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

class _$FixedPostDeliveryEventImpl implements FixedPostDeliveryEvent {
  const _$FixedPostDeliveryEventImpl(
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
    return 'FixedPostEvent.handleDelivery(latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, scannedResource: $scannedResource, action: $action, curCount: $curCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixedPostDeliveryEventImpl &&
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
  _$$FixedPostDeliveryEventImplCopyWith<_$FixedPostDeliveryEventImpl>
      get copyWith => __$$FixedPostDeliveryEventImplCopyWithImpl<
          _$FixedPostDeliveryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? fixedPostType,
            String? fixedPostName)
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
            String? fixedPostType,
            String? fixedPostName)?
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
            String? fixedPostType, String? fixedPostName)?
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
    required TResult Function(FixedPostSelectionEvent value) handleSelection,
    required TResult Function(FixedPostDeliveryEvent value) handleDelivery,
    required TResult Function(FixedPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleDelivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FixedPostSelectionEvent value)? handleSelection,
    TResult? Function(FixedPostDeliveryEvent value)? handleDelivery,
    TResult? Function(FixedPostDeliveryCountEvent value)? handleDeliveryCount,
  }) {
    return handleDelivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FixedPostSelectionEvent value)? handleSelection,
    TResult Function(FixedPostDeliveryEvent value)? handleDelivery,
    TResult Function(FixedPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleDelivery != null) {
      return handleDelivery(this);
    }
    return orElse();
  }
}

abstract class FixedPostDeliveryEvent implements FixedPostEvent {
  const factory FixedPostDeliveryEvent(
      {final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? scannedResource,
      final String? action,
      final int? curCount,
      final int? totalCount}) = _$FixedPostDeliveryEventImpl;

  double get latitude;
  double get longitude;
  double get locationAccuracy;
  String? get scannedResource;
  String? get action;
  int? get curCount;
  int? get totalCount;
  @JsonKey(ignore: true)
  _$$FixedPostDeliveryEventImplCopyWith<_$FixedPostDeliveryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FixedPostDeliveryCountEventImplCopyWith<$Res> {
  factory _$$FixedPostDeliveryCountEventImplCopyWith(
          _$FixedPostDeliveryCountEventImpl value,
          $Res Function(_$FixedPostDeliveryCountEventImpl) then) =
      __$$FixedPostDeliveryCountEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int curCount, int totalCount, String? action});
}

/// @nodoc
class __$$FixedPostDeliveryCountEventImplCopyWithImpl<$Res>
    extends _$FixedPostEventCopyWithImpl<$Res,
        _$FixedPostDeliveryCountEventImpl>
    implements _$$FixedPostDeliveryCountEventImplCopyWith<$Res> {
  __$$FixedPostDeliveryCountEventImplCopyWithImpl(
      _$FixedPostDeliveryCountEventImpl _value,
      $Res Function(_$FixedPostDeliveryCountEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curCount = null,
    Object? totalCount = null,
    Object? action = freezed,
  }) {
    return _then(_$FixedPostDeliveryCountEventImpl(
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

class _$FixedPostDeliveryCountEventImpl implements FixedPostDeliveryCountEvent {
  const _$FixedPostDeliveryCountEventImpl(
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
    return 'FixedPostEvent.handleDeliveryCount(curCount: $curCount, totalCount: $totalCount, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixedPostDeliveryCountEventImpl &&
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
  _$$FixedPostDeliveryCountEventImplCopyWith<_$FixedPostDeliveryCountEventImpl>
      get copyWith => __$$FixedPostDeliveryCountEventImplCopyWithImpl<
          _$FixedPostDeliveryCountEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double latitude,
            double longitude,
            double locationAccuracy,
            String? fixedPostType,
            String? fixedPostName)
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
            String? fixedPostType,
            String? fixedPostName)?
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
            String? fixedPostType, String? fixedPostName)?
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
    required TResult Function(FixedPostSelectionEvent value) handleSelection,
    required TResult Function(FixedPostDeliveryEvent value) handleDelivery,
    required TResult Function(FixedPostDeliveryCountEvent value)
        handleDeliveryCount,
  }) {
    return handleDeliveryCount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FixedPostSelectionEvent value)? handleSelection,
    TResult? Function(FixedPostDeliveryEvent value)? handleDelivery,
    TResult? Function(FixedPostDeliveryCountEvent value)? handleDeliveryCount,
  }) {
    return handleDeliveryCount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FixedPostSelectionEvent value)? handleSelection,
    TResult Function(FixedPostDeliveryEvent value)? handleDelivery,
    TResult Function(FixedPostDeliveryCountEvent value)? handleDeliveryCount,
    required TResult orElse(),
  }) {
    if (handleDeliveryCount != null) {
      return handleDeliveryCount(this);
    }
    return orElse();
  }
}

abstract class FixedPostDeliveryCountEvent implements FixedPostEvent {
  const factory FixedPostDeliveryCountEvent(
      {final int curCount,
      final int totalCount,
      final String? action}) = _$FixedPostDeliveryCountEventImpl;

  int get curCount;
  int get totalCount;
  String? get action;
  @JsonKey(ignore: true)
  _$$FixedPostDeliveryCountEventImplCopyWith<_$FixedPostDeliveryCountEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FixedPostState {
  dynamic get loading => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get locationAccuracy => throw _privateConstructorUsedError;
  String? get fixedPostType => throw _privateConstructorUsedError;
  String? get fixedPostName => throw _privateConstructorUsedError;
  int? get curCount => throw _privateConstructorUsedError;
  int? get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FixedPostStateCopyWith<FixedPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixedPostStateCopyWith<$Res> {
  factory $FixedPostStateCopyWith(
          FixedPostState value, $Res Function(FixedPostState) then) =
      _$FixedPostStateCopyWithImpl<$Res, FixedPostState>;
  @useResult
  $Res call(
      {dynamic loading,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? fixedPostType,
      String? fixedPostName,
      int? curCount,
      int? totalCount});
}

/// @nodoc
class _$FixedPostStateCopyWithImpl<$Res, $Val extends FixedPostState>
    implements $FixedPostStateCopyWith<$Res> {
  _$FixedPostStateCopyWithImpl(this._value, this._then);

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
    Object? fixedPostType = freezed,
    Object? fixedPostName = freezed,
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
      fixedPostType: freezed == fixedPostType
          ? _value.fixedPostType
          : fixedPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      fixedPostName: freezed == fixedPostName
          ? _value.fixedPostName
          : fixedPostName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FixedPostStateImplCopyWith<$Res>
    implements $FixedPostStateCopyWith<$Res> {
  factory _$$FixedPostStateImplCopyWith(_$FixedPostStateImpl value,
          $Res Function(_$FixedPostStateImpl) then) =
      __$$FixedPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic loading,
      double latitude,
      double longitude,
      double locationAccuracy,
      String? fixedPostType,
      String? fixedPostName,
      int? curCount,
      int? totalCount});
}

/// @nodoc
class __$$FixedPostStateImplCopyWithImpl<$Res>
    extends _$FixedPostStateCopyWithImpl<$Res, _$FixedPostStateImpl>
    implements _$$FixedPostStateImplCopyWith<$Res> {
  __$$FixedPostStateImplCopyWithImpl(
      _$FixedPostStateImpl _value, $Res Function(_$FixedPostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? locationAccuracy = null,
    Object? fixedPostType = freezed,
    Object? fixedPostName = freezed,
    Object? curCount = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$FixedPostStateImpl(
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
      fixedPostType: freezed == fixedPostType
          ? _value.fixedPostType
          : fixedPostType // ignore: cast_nullable_to_non_nullable
              as String?,
      fixedPostName: freezed == fixedPostName
          ? _value.fixedPostName
          : fixedPostName // ignore: cast_nullable_to_non_nullable
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

class _$FixedPostStateImpl implements _FixedPostState {
  const _$FixedPostStateImpl(
      {this.loading = false,
      this.latitude = 0,
      this.longitude = 0,
      this.locationAccuracy = 0,
      this.fixedPostType,
      this.fixedPostName,
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
  final String? fixedPostType;
  @override
  final String? fixedPostName;
  @override
  final int? curCount;
  @override
  final int? totalCount;

  @override
  String toString() {
    return 'FixedPostState(loading: $loading, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, fixedPostType: $fixedPostType, fixedPostName: $fixedPostName, curCount: $curCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FixedPostStateImpl &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.fixedPostType, fixedPostType) ||
                other.fixedPostType == fixedPostType) &&
            (identical(other.fixedPostName, fixedPostName) ||
                other.fixedPostName == fixedPostName) &&
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
      fixedPostType,
      fixedPostName,
      curCount,
      totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FixedPostStateImplCopyWith<_$FixedPostStateImpl> get copyWith =>
      __$$FixedPostStateImplCopyWithImpl<_$FixedPostStateImpl>(
          this, _$identity);
}

abstract class _FixedPostState implements FixedPostState {
  const factory _FixedPostState(
      {final dynamic loading,
      final double latitude,
      final double longitude,
      final double locationAccuracy,
      final String? fixedPostType,
      final String? fixedPostName,
      final int? curCount,
      final int? totalCount}) = _$FixedPostStateImpl;

  @override
  dynamic get loading;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get locationAccuracy;
  @override
  String? get fixedPostType;
  @override
  String? get fixedPostName;
  @override
  int? get curCount;
  @override
  int? get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$FixedPostStateImplCopyWith<_$FixedPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
