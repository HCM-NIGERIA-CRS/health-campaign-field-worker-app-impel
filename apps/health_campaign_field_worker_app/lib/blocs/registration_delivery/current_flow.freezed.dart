// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_flow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentFlowEvent {
  Set<String>? get currentFlows => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<String>? currentFlows) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Set<String>? currentFlows)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<String>? currentFlows)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentFlowSetEvent value) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentFlowSetEvent value)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentFlowSetEvent value)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentFlowEventCopyWith<CurrentFlowEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentFlowEventCopyWith<$Res> {
  factory $CurrentFlowEventCopyWith(
          CurrentFlowEvent value, $Res Function(CurrentFlowEvent) then) =
      _$CurrentFlowEventCopyWithImpl<$Res, CurrentFlowEvent>;
  @useResult
  $Res call({Set<String>? currentFlows});
}

/// @nodoc
class _$CurrentFlowEventCopyWithImpl<$Res, $Val extends CurrentFlowEvent>
    implements $CurrentFlowEventCopyWith<$Res> {
  _$CurrentFlowEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFlows = freezed,
  }) {
    return _then(_value.copyWith(
      currentFlows: freezed == currentFlows
          ? _value.currentFlows
          : currentFlows // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentFlowSetEventImplCopyWith<$Res>
    implements $CurrentFlowEventCopyWith<$Res> {
  factory _$$CurrentFlowSetEventImplCopyWith(_$CurrentFlowSetEventImpl value,
          $Res Function(_$CurrentFlowSetEventImpl) then) =
      __$$CurrentFlowSetEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<String>? currentFlows});
}

/// @nodoc
class __$$CurrentFlowSetEventImplCopyWithImpl<$Res>
    extends _$CurrentFlowEventCopyWithImpl<$Res, _$CurrentFlowSetEventImpl>
    implements _$$CurrentFlowSetEventImplCopyWith<$Res> {
  __$$CurrentFlowSetEventImplCopyWithImpl(_$CurrentFlowSetEventImpl _value,
      $Res Function(_$CurrentFlowSetEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFlows = freezed,
  }) {
    return _then(_$CurrentFlowSetEventImpl(
      currentFlows: freezed == currentFlows
          ? _value._currentFlows
          : currentFlows // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
    ));
  }
}

/// @nodoc

class _$CurrentFlowSetEventImpl implements CurrentFlowSetEvent {
  const _$CurrentFlowSetEventImpl({final Set<String>? currentFlows})
      : _currentFlows = currentFlows;

  final Set<String>? _currentFlows;
  @override
  Set<String>? get currentFlows {
    final value = _currentFlows;
    if (value == null) return null;
    if (_currentFlows is EqualUnmodifiableSetView) return _currentFlows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  String toString() {
    return 'CurrentFlowEvent.set(currentFlows: $currentFlows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentFlowSetEventImpl &&
            const DeepCollectionEquality()
                .equals(other._currentFlows, _currentFlows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_currentFlows));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentFlowSetEventImplCopyWith<_$CurrentFlowSetEventImpl> get copyWith =>
      __$$CurrentFlowSetEventImplCopyWithImpl<_$CurrentFlowSetEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<String>? currentFlows) set,
  }) {
    return set(currentFlows);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Set<String>? currentFlows)? set,
  }) {
    return set?.call(currentFlows);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<String>? currentFlows)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(currentFlows);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentFlowSetEvent value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentFlowSetEvent value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentFlowSetEvent value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class CurrentFlowSetEvent implements CurrentFlowEvent {
  const factory CurrentFlowSetEvent({final Set<String>? currentFlows}) =
      _$CurrentFlowSetEventImpl;

  @override
  Set<String>? get currentFlows;
  @override
  @JsonKey(ignore: true)
  _$$CurrentFlowSetEventImplCopyWith<_$CurrentFlowSetEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentFlowState {
  Set<String>? get currentFlows => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<String>? currentFlows) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Set<String>? currentFlows)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<String>? currentFlows)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentFlowSetState value) set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentFlowSetState value)? set,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentFlowSetState value)? set,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentFlowStateCopyWith<CurrentFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentFlowStateCopyWith<$Res> {
  factory $CurrentFlowStateCopyWith(
          CurrentFlowState value, $Res Function(CurrentFlowState) then) =
      _$CurrentFlowStateCopyWithImpl<$Res, CurrentFlowState>;
  @useResult
  $Res call({Set<String>? currentFlows});
}

/// @nodoc
class _$CurrentFlowStateCopyWithImpl<$Res, $Val extends CurrentFlowState>
    implements $CurrentFlowStateCopyWith<$Res> {
  _$CurrentFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFlows = freezed,
  }) {
    return _then(_value.copyWith(
      currentFlows: freezed == currentFlows
          ? _value.currentFlows
          : currentFlows // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentFlowSetStateImplCopyWith<$Res>
    implements $CurrentFlowStateCopyWith<$Res> {
  factory _$$CurrentFlowSetStateImplCopyWith(_$CurrentFlowSetStateImpl value,
          $Res Function(_$CurrentFlowSetStateImpl) then) =
      __$$CurrentFlowSetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<String>? currentFlows});
}

/// @nodoc
class __$$CurrentFlowSetStateImplCopyWithImpl<$Res>
    extends _$CurrentFlowStateCopyWithImpl<$Res, _$CurrentFlowSetStateImpl>
    implements _$$CurrentFlowSetStateImplCopyWith<$Res> {
  __$$CurrentFlowSetStateImplCopyWithImpl(_$CurrentFlowSetStateImpl _value,
      $Res Function(_$CurrentFlowSetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFlows = freezed,
  }) {
    return _then(_$CurrentFlowSetStateImpl(
      currentFlows: freezed == currentFlows
          ? _value._currentFlows
          : currentFlows // ignore: cast_nullable_to_non_nullable
              as Set<String>?,
    ));
  }
}

/// @nodoc

class _$CurrentFlowSetStateImpl implements CurrentFlowSetState {
  const _$CurrentFlowSetStateImpl({final Set<String>? currentFlows})
      : _currentFlows = currentFlows;

  final Set<String>? _currentFlows;
  @override
  Set<String>? get currentFlows {
    final value = _currentFlows;
    if (value == null) return null;
    if (_currentFlows is EqualUnmodifiableSetView) return _currentFlows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  String toString() {
    return 'CurrentFlowState.set(currentFlows: $currentFlows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentFlowSetStateImpl &&
            const DeepCollectionEquality()
                .equals(other._currentFlows, _currentFlows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_currentFlows));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentFlowSetStateImplCopyWith<_$CurrentFlowSetStateImpl> get copyWith =>
      __$$CurrentFlowSetStateImplCopyWithImpl<_$CurrentFlowSetStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Set<String>? currentFlows) set,
  }) {
    return set(currentFlows);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Set<String>? currentFlows)? set,
  }) {
    return set?.call(currentFlows);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Set<String>? currentFlows)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(currentFlows);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentFlowSetState value) set,
  }) {
    return set(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentFlowSetState value)? set,
  }) {
    return set?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentFlowSetState value)? set,
    required TResult orElse(),
  }) {
    if (set != null) {
      return set(this);
    }
    return orElse();
  }
}

abstract class CurrentFlowSetState implements CurrentFlowState {
  const factory CurrentFlowSetState({final Set<String>? currentFlows}) =
      _$CurrentFlowSetStateImpl;

  @override
  Set<String>? get currentFlows;
  @override
  @JsonKey(ignore: true)
  _$$CurrentFlowSetStateImplCopyWith<_$CurrentFlowSetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
