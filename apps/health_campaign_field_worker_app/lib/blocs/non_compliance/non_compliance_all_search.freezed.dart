// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'non_compliance_all_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NonComplianceAllSearchEvent {
  String? get beneficiaryTag => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? beneficiaryTag) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? beneficiaryTag)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? beneficiaryTag)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceAllSearchCompleteEvent value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceAllSearchCompleteEvent value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceAllSearchCompleteEvent value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NonComplianceAllSearchEventCopyWith<NonComplianceAllSearchEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonComplianceAllSearchEventCopyWith<$Res> {
  factory $NonComplianceAllSearchEventCopyWith(
          NonComplianceAllSearchEvent value,
          $Res Function(NonComplianceAllSearchEvent) then) =
      _$NonComplianceAllSearchEventCopyWithImpl<$Res,
          NonComplianceAllSearchEvent>;
  @useResult
  $Res call({String? beneficiaryTag});
}

/// @nodoc
class _$NonComplianceAllSearchEventCopyWithImpl<$Res,
        $Val extends NonComplianceAllSearchEvent>
    implements $NonComplianceAllSearchEventCopyWith<$Res> {
  _$NonComplianceAllSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaryTag = freezed,
  }) {
    return _then(_value.copyWith(
      beneficiaryTag: freezed == beneficiaryTag
          ? _value.beneficiaryTag
          : beneficiaryTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NonComplianceAllSearchCompleteEventImplCopyWith<$Res>
    implements $NonComplianceAllSearchEventCopyWith<$Res> {
  factory _$$NonComplianceAllSearchCompleteEventImplCopyWith(
          _$NonComplianceAllSearchCompleteEventImpl value,
          $Res Function(_$NonComplianceAllSearchCompleteEventImpl) then) =
      __$$NonComplianceAllSearchCompleteEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? beneficiaryTag});
}

/// @nodoc
class __$$NonComplianceAllSearchCompleteEventImplCopyWithImpl<$Res>
    extends _$NonComplianceAllSearchEventCopyWithImpl<$Res,
        _$NonComplianceAllSearchCompleteEventImpl>
    implements _$$NonComplianceAllSearchCompleteEventImplCopyWith<$Res> {
  __$$NonComplianceAllSearchCompleteEventImplCopyWithImpl(
      _$NonComplianceAllSearchCompleteEventImpl _value,
      $Res Function(_$NonComplianceAllSearchCompleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaryTag = freezed,
  }) {
    return _then(_$NonComplianceAllSearchCompleteEventImpl(
      beneficiaryTag: freezed == beneficiaryTag
          ? _value.beneficiaryTag
          : beneficiaryTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NonComplianceAllSearchCompleteEventImpl
    implements NonComplianceAllSearchCompleteEvent {
  const _$NonComplianceAllSearchCompleteEventImpl({this.beneficiaryTag});

  @override
  final String? beneficiaryTag;

  @override
  String toString() {
    return 'NonComplianceAllSearchEvent.search(beneficiaryTag: $beneficiaryTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceAllSearchCompleteEventImpl &&
            (identical(other.beneficiaryTag, beneficiaryTag) ||
                other.beneficiaryTag == beneficiaryTag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beneficiaryTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonComplianceAllSearchCompleteEventImplCopyWith<
          _$NonComplianceAllSearchCompleteEventImpl>
      get copyWith => __$$NonComplianceAllSearchCompleteEventImplCopyWithImpl<
          _$NonComplianceAllSearchCompleteEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? beneficiaryTag) search,
  }) {
    return search(beneficiaryTag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? beneficiaryTag)? search,
  }) {
    return search?.call(beneficiaryTag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? beneficiaryTag)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(beneficiaryTag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceAllSearchCompleteEvent value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceAllSearchCompleteEvent value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceAllSearchCompleteEvent value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class NonComplianceAllSearchCompleteEvent
    implements NonComplianceAllSearchEvent {
  const factory NonComplianceAllSearchCompleteEvent(
          {final String? beneficiaryTag}) =
      _$NonComplianceAllSearchCompleteEventImpl;

  @override
  String? get beneficiaryTag;
  @override
  @JsonKey(ignore: true)
  _$$NonComplianceAllSearchCompleteEventImplCopyWith<
          _$NonComplianceAllSearchCompleteEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NonComplianceAllSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)
        search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceAllSearchInitState value) init,
    required TResult Function(NonComplianceAllSearchCompleteState value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceAllSearchInitState value)? init,
    TResult? Function(NonComplianceAllSearchCompleteState value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceAllSearchInitState value)? init,
    TResult Function(NonComplianceAllSearchCompleteState value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonComplianceAllSearchStateCopyWith<$Res> {
  factory $NonComplianceAllSearchStateCopyWith(
          NonComplianceAllSearchState value,
          $Res Function(NonComplianceAllSearchState) then) =
      _$NonComplianceAllSearchStateCopyWithImpl<$Res,
          NonComplianceAllSearchState>;
}

/// @nodoc
class _$NonComplianceAllSearchStateCopyWithImpl<$Res,
        $Val extends NonComplianceAllSearchState>
    implements $NonComplianceAllSearchStateCopyWith<$Res> {
  _$NonComplianceAllSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NonComplianceAllSearchInitStateImplCopyWith<$Res> {
  factory _$$NonComplianceAllSearchInitStateImplCopyWith(
          _$NonComplianceAllSearchInitStateImpl value,
          $Res Function(_$NonComplianceAllSearchInitStateImpl) then) =
      __$$NonComplianceAllSearchInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NonComplianceAllSearchInitStateImplCopyWithImpl<$Res>
    extends _$NonComplianceAllSearchStateCopyWithImpl<$Res,
        _$NonComplianceAllSearchInitStateImpl>
    implements _$$NonComplianceAllSearchInitStateImplCopyWith<$Res> {
  __$$NonComplianceAllSearchInitStateImplCopyWithImpl(
      _$NonComplianceAllSearchInitStateImpl _value,
      $Res Function(_$NonComplianceAllSearchInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NonComplianceAllSearchInitStateImpl
    implements NonComplianceAllSearchInitState {
  const _$NonComplianceAllSearchInitStateImpl();

  @override
  String toString() {
    return 'NonComplianceAllSearchState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceAllSearchInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)
        search,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        search,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        search,
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
    required TResult Function(NonComplianceAllSearchInitState value) init,
    required TResult Function(NonComplianceAllSearchCompleteState value) search,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceAllSearchInitState value)? init,
    TResult? Function(NonComplianceAllSearchCompleteState value)? search,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceAllSearchInitState value)? init,
    TResult Function(NonComplianceAllSearchCompleteState value)? search,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class NonComplianceAllSearchInitState
    implements NonComplianceAllSearchState {
  const factory NonComplianceAllSearchInitState() =
      _$NonComplianceAllSearchInitStateImpl;
}

/// @nodoc
abstract class _$$NonComplianceAllSearchCompleteStateImplCopyWith<$Res> {
  factory _$$NonComplianceAllSearchCompleteStateImplCopyWith(
          _$NonComplianceAllSearchCompleteStateImpl value,
          $Res Function(_$NonComplianceAllSearchCompleteStateImpl) then) =
      __$$NonComplianceAllSearchCompleteStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, List<UserActionModel>? nonComplianceUserAction});
}

/// @nodoc
class __$$NonComplianceAllSearchCompleteStateImplCopyWithImpl<$Res>
    extends _$NonComplianceAllSearchStateCopyWithImpl<$Res,
        _$NonComplianceAllSearchCompleteStateImpl>
    implements _$$NonComplianceAllSearchCompleteStateImplCopyWith<$Res> {
  __$$NonComplianceAllSearchCompleteStateImplCopyWithImpl(
      _$NonComplianceAllSearchCompleteStateImpl _value,
      $Res Function(_$NonComplianceAllSearchCompleteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_$NonComplianceAllSearchCompleteStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      nonComplianceUserAction: freezed == nonComplianceUserAction
          ? _value._nonComplianceUserAction
          : nonComplianceUserAction // ignore: cast_nullable_to_non_nullable
              as List<UserActionModel>?,
    ));
  }
}

/// @nodoc

class _$NonComplianceAllSearchCompleteStateImpl
    implements NonComplianceAllSearchCompleteState {
  const _$NonComplianceAllSearchCompleteStateImpl(
      {this.loading = false,
      final List<UserActionModel>? nonComplianceUserAction})
      : _nonComplianceUserAction = nonComplianceUserAction;

  @override
  @JsonKey()
  final bool loading;
  final List<UserActionModel>? _nonComplianceUserAction;
  @override
  List<UserActionModel>? get nonComplianceUserAction {
    final value = _nonComplianceUserAction;
    if (value == null) return null;
    if (_nonComplianceUserAction is EqualUnmodifiableListView)
      return _nonComplianceUserAction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NonComplianceAllSearchState.search(loading: $loading, nonComplianceUserAction: $nonComplianceUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceAllSearchCompleteStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(
                other._nonComplianceUserAction, _nonComplianceUserAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
      const DeepCollectionEquality().hash(_nonComplianceUserAction));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonComplianceAllSearchCompleteStateImplCopyWith<
          _$NonComplianceAllSearchCompleteStateImpl>
      get copyWith => __$$NonComplianceAllSearchCompleteStateImplCopyWithImpl<
          _$NonComplianceAllSearchCompleteStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)
        search,
  }) {
    return search(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        search,
  }) {
    return search?.call(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(loading, nonComplianceUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceAllSearchInitState value) init,
    required TResult Function(NonComplianceAllSearchCompleteState value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceAllSearchInitState value)? init,
    TResult? Function(NonComplianceAllSearchCompleteState value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceAllSearchInitState value)? init,
    TResult Function(NonComplianceAllSearchCompleteState value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class NonComplianceAllSearchCompleteState
    implements NonComplianceAllSearchState {
  const factory NonComplianceAllSearchCompleteState(
          {final bool loading,
          final List<UserActionModel>? nonComplianceUserAction}) =
      _$NonComplianceAllSearchCompleteStateImpl;

  bool get loading;
  List<UserActionModel>? get nonComplianceUserAction;
  @JsonKey(ignore: true)
  _$$NonComplianceAllSearchCompleteStateImplCopyWith<
          _$NonComplianceAllSearchCompleteStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
