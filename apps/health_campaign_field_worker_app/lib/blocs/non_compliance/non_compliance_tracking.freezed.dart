// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'non_compliance_tracking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NonComplianceTrackingEvent {
  UserActionModel? get nonComplianceUserAction =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel? nonComplianceUserAction) create,
    required TResult Function(UserActionModel? nonComplianceUserAction) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel? nonComplianceUserAction)? create,
    TResult? Function(UserActionModel? nonComplianceUserAction)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel? nonComplianceUserAction)? create,
    TResult Function(UserActionModel? nonComplianceUserAction)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingCreateEvent value) create,
    required TResult Function(NonComplianceTrackingUpdateEvent value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingCreateEvent value)? create,
    TResult? Function(NonComplianceTrackingUpdateEvent value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingCreateEvent value)? create,
    TResult Function(NonComplianceTrackingUpdateEvent value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NonComplianceTrackingEventCopyWith<NonComplianceTrackingEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonComplianceTrackingEventCopyWith<$Res> {
  factory $NonComplianceTrackingEventCopyWith(NonComplianceTrackingEvent value,
          $Res Function(NonComplianceTrackingEvent) then) =
      _$NonComplianceTrackingEventCopyWithImpl<$Res,
          NonComplianceTrackingEvent>;
  @useResult
  $Res call({UserActionModel? nonComplianceUserAction});
}

/// @nodoc
class _$NonComplianceTrackingEventCopyWithImpl<$Res,
        $Val extends NonComplianceTrackingEvent>
    implements $NonComplianceTrackingEventCopyWith<$Res> {
  _$NonComplianceTrackingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_value.copyWith(
      nonComplianceUserAction: freezed == nonComplianceUserAction
          ? _value.nonComplianceUserAction
          : nonComplianceUserAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NonComplianceTrackingCreateEventImplCopyWith<$Res>
    implements $NonComplianceTrackingEventCopyWith<$Res> {
  factory _$$NonComplianceTrackingCreateEventImplCopyWith(
          _$NonComplianceTrackingCreateEventImpl value,
          $Res Function(_$NonComplianceTrackingCreateEventImpl) then) =
      __$$NonComplianceTrackingCreateEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserActionModel? nonComplianceUserAction});
}

/// @nodoc
class __$$NonComplianceTrackingCreateEventImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingEventCopyWithImpl<$Res,
        _$NonComplianceTrackingCreateEventImpl>
    implements _$$NonComplianceTrackingCreateEventImplCopyWith<$Res> {
  __$$NonComplianceTrackingCreateEventImplCopyWithImpl(
      _$NonComplianceTrackingCreateEventImpl _value,
      $Res Function(_$NonComplianceTrackingCreateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_$NonComplianceTrackingCreateEventImpl(
      nonComplianceUserAction: freezed == nonComplianceUserAction
          ? _value.nonComplianceUserAction
          : nonComplianceUserAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ));
  }
}

/// @nodoc

class _$NonComplianceTrackingCreateEventImpl
    implements NonComplianceTrackingCreateEvent {
  const _$NonComplianceTrackingCreateEventImpl({this.nonComplianceUserAction});

  @override
  final UserActionModel? nonComplianceUserAction;

  @override
  String toString() {
    return 'NonComplianceTrackingEvent.create(nonComplianceUserAction: $nonComplianceUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingCreateEventImpl &&
            (identical(
                    other.nonComplianceUserAction, nonComplianceUserAction) ||
                other.nonComplianceUserAction == nonComplianceUserAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nonComplianceUserAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonComplianceTrackingCreateEventImplCopyWith<
          _$NonComplianceTrackingCreateEventImpl>
      get copyWith => __$$NonComplianceTrackingCreateEventImplCopyWithImpl<
          _$NonComplianceTrackingCreateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel? nonComplianceUserAction) create,
    required TResult Function(UserActionModel? nonComplianceUserAction) update,
  }) {
    return create(nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel? nonComplianceUserAction)? create,
    TResult? Function(UserActionModel? nonComplianceUserAction)? update,
  }) {
    return create?.call(nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel? nonComplianceUserAction)? create,
    TResult Function(UserActionModel? nonComplianceUserAction)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(nonComplianceUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingCreateEvent value) create,
    required TResult Function(NonComplianceTrackingUpdateEvent value) update,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingCreateEvent value)? create,
    TResult? Function(NonComplianceTrackingUpdateEvent value)? update,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingCreateEvent value)? create,
    TResult Function(NonComplianceTrackingUpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingCreateEvent
    implements NonComplianceTrackingEvent {
  const factory NonComplianceTrackingCreateEvent(
          {final UserActionModel? nonComplianceUserAction}) =
      _$NonComplianceTrackingCreateEventImpl;

  @override
  UserActionModel? get nonComplianceUserAction;
  @override
  @JsonKey(ignore: true)
  _$$NonComplianceTrackingCreateEventImplCopyWith<
          _$NonComplianceTrackingCreateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NonComplianceTrackingUpdateEventImplCopyWith<$Res>
    implements $NonComplianceTrackingEventCopyWith<$Res> {
  factory _$$NonComplianceTrackingUpdateEventImplCopyWith(
          _$NonComplianceTrackingUpdateEventImpl value,
          $Res Function(_$NonComplianceTrackingUpdateEventImpl) then) =
      __$$NonComplianceTrackingUpdateEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserActionModel? nonComplianceUserAction});
}

/// @nodoc
class __$$NonComplianceTrackingUpdateEventImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingEventCopyWithImpl<$Res,
        _$NonComplianceTrackingUpdateEventImpl>
    implements _$$NonComplianceTrackingUpdateEventImplCopyWith<$Res> {
  __$$NonComplianceTrackingUpdateEventImplCopyWithImpl(
      _$NonComplianceTrackingUpdateEventImpl _value,
      $Res Function(_$NonComplianceTrackingUpdateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_$NonComplianceTrackingUpdateEventImpl(
      nonComplianceUserAction: freezed == nonComplianceUserAction
          ? _value.nonComplianceUserAction
          : nonComplianceUserAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ));
  }
}

/// @nodoc

class _$NonComplianceTrackingUpdateEventImpl
    implements NonComplianceTrackingUpdateEvent {
  const _$NonComplianceTrackingUpdateEventImpl({this.nonComplianceUserAction});

  @override
  final UserActionModel? nonComplianceUserAction;

  @override
  String toString() {
    return 'NonComplianceTrackingEvent.update(nonComplianceUserAction: $nonComplianceUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingUpdateEventImpl &&
            (identical(
                    other.nonComplianceUserAction, nonComplianceUserAction) ||
                other.nonComplianceUserAction == nonComplianceUserAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nonComplianceUserAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonComplianceTrackingUpdateEventImplCopyWith<
          _$NonComplianceTrackingUpdateEventImpl>
      get copyWith => __$$NonComplianceTrackingUpdateEventImplCopyWithImpl<
          _$NonComplianceTrackingUpdateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel? nonComplianceUserAction) create,
    required TResult Function(UserActionModel? nonComplianceUserAction) update,
  }) {
    return update(nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel? nonComplianceUserAction)? create,
    TResult? Function(UserActionModel? nonComplianceUserAction)? update,
  }) {
    return update?.call(nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel? nonComplianceUserAction)? create,
    TResult Function(UserActionModel? nonComplianceUserAction)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(nonComplianceUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingCreateEvent value) create,
    required TResult Function(NonComplianceTrackingUpdateEvent value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingCreateEvent value)? create,
    TResult? Function(NonComplianceTrackingUpdateEvent value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingCreateEvent value)? create,
    TResult Function(NonComplianceTrackingUpdateEvent value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingUpdateEvent
    implements NonComplianceTrackingEvent {
  const factory NonComplianceTrackingUpdateEvent(
          {final UserActionModel? nonComplianceUserAction}) =
      _$NonComplianceTrackingUpdateEventImpl;

  @override
  UserActionModel? get nonComplianceUserAction;
  @override
  @JsonKey(ignore: true)
  _$$NonComplianceTrackingUpdateEventImplCopyWith<
          _$NonComplianceTrackingUpdateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NonComplianceTrackingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        create,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingInitState value) init,
    required TResult Function(NonComplianceTrackingCreateState value) create,
    required TResult Function(NonComplianceTrackingUpdateState value) update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingUpdateState value)? update,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingUpdateState value)? update,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonComplianceTrackingStateCopyWith<$Res> {
  factory $NonComplianceTrackingStateCopyWith(NonComplianceTrackingState value,
          $Res Function(NonComplianceTrackingState) then) =
      _$NonComplianceTrackingStateCopyWithImpl<$Res,
          NonComplianceTrackingState>;
}

/// @nodoc
class _$NonComplianceTrackingStateCopyWithImpl<$Res,
        $Val extends NonComplianceTrackingState>
    implements $NonComplianceTrackingStateCopyWith<$Res> {
  _$NonComplianceTrackingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NonComplianceTrackingInitStateImplCopyWith<$Res> {
  factory _$$NonComplianceTrackingInitStateImplCopyWith(
          _$NonComplianceTrackingInitStateImpl value,
          $Res Function(_$NonComplianceTrackingInitStateImpl) then) =
      __$$NonComplianceTrackingInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NonComplianceTrackingInitStateImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingStateCopyWithImpl<$Res,
        _$NonComplianceTrackingInitStateImpl>
    implements _$$NonComplianceTrackingInitStateImplCopyWith<$Res> {
  __$$NonComplianceTrackingInitStateImplCopyWithImpl(
      _$NonComplianceTrackingInitStateImpl _value,
      $Res Function(_$NonComplianceTrackingInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NonComplianceTrackingInitStateImpl
    implements NonComplianceTrackingInitState {
  const _$NonComplianceTrackingInitStateImpl();

  @override
  String toString() {
    return 'NonComplianceTrackingState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        create,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        update,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        update,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        update,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingInitState value) init,
    required TResult Function(NonComplianceTrackingCreateState value) create,
    required TResult Function(NonComplianceTrackingUpdateState value) update,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingUpdateState value)? update,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingUpdateState value)? update,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingInitState
    implements NonComplianceTrackingState {
  const factory NonComplianceTrackingInitState() =
      _$NonComplianceTrackingInitStateImpl;
}

/// @nodoc
abstract class _$$NonComplianceTrackingCreateStateImplCopyWith<$Res> {
  factory _$$NonComplianceTrackingCreateStateImplCopyWith(
          _$NonComplianceTrackingCreateStateImpl value,
          $Res Function(_$NonComplianceTrackingCreateStateImpl) then) =
      __$$NonComplianceTrackingCreateStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, UserActionModel? nonComplianceUserAction});
}

/// @nodoc
class __$$NonComplianceTrackingCreateStateImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingStateCopyWithImpl<$Res,
        _$NonComplianceTrackingCreateStateImpl>
    implements _$$NonComplianceTrackingCreateStateImplCopyWith<$Res> {
  __$$NonComplianceTrackingCreateStateImplCopyWithImpl(
      _$NonComplianceTrackingCreateStateImpl _value,
      $Res Function(_$NonComplianceTrackingCreateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_$NonComplianceTrackingCreateStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      nonComplianceUserAction: freezed == nonComplianceUserAction
          ? _value.nonComplianceUserAction
          : nonComplianceUserAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ));
  }
}

/// @nodoc

class _$NonComplianceTrackingCreateStateImpl
    implements NonComplianceTrackingCreateState {
  const _$NonComplianceTrackingCreateStateImpl(
      {this.loading = false, this.nonComplianceUserAction});

  @override
  @JsonKey()
  final bool loading;
  @override
  final UserActionModel? nonComplianceUserAction;

  @override
  String toString() {
    return 'NonComplianceTrackingState.create(loading: $loading, nonComplianceUserAction: $nonComplianceUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingCreateStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(
                    other.nonComplianceUserAction, nonComplianceUserAction) ||
                other.nonComplianceUserAction == nonComplianceUserAction));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, nonComplianceUserAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonComplianceTrackingCreateStateImplCopyWith<
          _$NonComplianceTrackingCreateStateImpl>
      get copyWith => __$$NonComplianceTrackingCreateStateImplCopyWithImpl<
          _$NonComplianceTrackingCreateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        create,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        update,
  }) {
    return create(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        update,
  }) {
    return create?.call(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(loading, nonComplianceUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingInitState value) init,
    required TResult Function(NonComplianceTrackingCreateState value) create,
    required TResult Function(NonComplianceTrackingUpdateState value) update,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingUpdateState value)? update,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingUpdateState value)? update,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingCreateState
    implements NonComplianceTrackingState {
  const factory NonComplianceTrackingCreateState(
          {final bool loading,
          final UserActionModel? nonComplianceUserAction}) =
      _$NonComplianceTrackingCreateStateImpl;

  bool get loading;
  UserActionModel? get nonComplianceUserAction;
  @JsonKey(ignore: true)
  _$$NonComplianceTrackingCreateStateImplCopyWith<
          _$NonComplianceTrackingCreateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NonComplianceTrackingUpdateStateImplCopyWith<$Res> {
  factory _$$NonComplianceTrackingUpdateStateImplCopyWith(
          _$NonComplianceTrackingUpdateStateImpl value,
          $Res Function(_$NonComplianceTrackingUpdateStateImpl) then) =
      __$$NonComplianceTrackingUpdateStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, UserActionModel? nonComplianceUserAction});
}

/// @nodoc
class __$$NonComplianceTrackingUpdateStateImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingStateCopyWithImpl<$Res,
        _$NonComplianceTrackingUpdateStateImpl>
    implements _$$NonComplianceTrackingUpdateStateImplCopyWith<$Res> {
  __$$NonComplianceTrackingUpdateStateImplCopyWithImpl(
      _$NonComplianceTrackingUpdateStateImpl _value,
      $Res Function(_$NonComplianceTrackingUpdateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_$NonComplianceTrackingUpdateStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      nonComplianceUserAction: freezed == nonComplianceUserAction
          ? _value.nonComplianceUserAction
          : nonComplianceUserAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ));
  }
}

/// @nodoc

class _$NonComplianceTrackingUpdateStateImpl
    implements NonComplianceTrackingUpdateState {
  const _$NonComplianceTrackingUpdateStateImpl(
      {this.loading = false, this.nonComplianceUserAction});

  @override
  @JsonKey()
  final bool loading;
  @override
  final UserActionModel? nonComplianceUserAction;

  @override
  String toString() {
    return 'NonComplianceTrackingState.update(loading: $loading, nonComplianceUserAction: $nonComplianceUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingUpdateStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(
                    other.nonComplianceUserAction, nonComplianceUserAction) ||
                other.nonComplianceUserAction == nonComplianceUserAction));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, nonComplianceUserAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonComplianceTrackingUpdateStateImplCopyWith<
          _$NonComplianceTrackingUpdateStateImpl>
      get copyWith => __$$NonComplianceTrackingUpdateStateImplCopyWithImpl<
          _$NonComplianceTrackingUpdateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        create,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        update,
  }) {
    return update(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        update,
  }) {
    return update?.call(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(loading, nonComplianceUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingInitState value) init,
    required TResult Function(NonComplianceTrackingCreateState value) create,
    required TResult Function(NonComplianceTrackingUpdateState value) update,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingUpdateState value)? update,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingUpdateState value)? update,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingUpdateState
    implements NonComplianceTrackingState {
  const factory NonComplianceTrackingUpdateState(
          {final bool loading,
          final UserActionModel? nonComplianceUserAction}) =
      _$NonComplianceTrackingUpdateStateImpl;

  bool get loading;
  UserActionModel? get nonComplianceUserAction;
  @JsonKey(ignore: true)
  _$$NonComplianceTrackingUpdateStateImplCopyWith<
          _$NonComplianceTrackingUpdateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
