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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel? nonComplianceUserAction) create,
    required TResult Function(String? beneficiaryTag) search,
    required TResult Function() allSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel? nonComplianceUserAction)? create,
    TResult? Function(String? beneficiaryTag)? search,
    TResult? Function()? allSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel? nonComplianceUserAction)? create,
    TResult Function(String? beneficiaryTag)? search,
    TResult Function()? allSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingCreateEvent value) create,
    required TResult Function(NonComplianceTrackingSearchEvent value) search,
    required TResult Function(NonComplianceTrackingAllSearchEvent value)
        allSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingCreateEvent value)? create,
    TResult? Function(NonComplianceTrackingSearchEvent value)? search,
    TResult? Function(NonComplianceTrackingAllSearchEvent value)? allSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingCreateEvent value)? create,
    TResult Function(NonComplianceTrackingSearchEvent value)? search,
    TResult Function(NonComplianceTrackingAllSearchEvent value)? allSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonComplianceTrackingEventCopyWith<$Res> {
  factory $NonComplianceTrackingEventCopyWith(NonComplianceTrackingEvent value,
          $Res Function(NonComplianceTrackingEvent) then) =
      _$NonComplianceTrackingEventCopyWithImpl<$Res,
          NonComplianceTrackingEvent>;
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
}

/// @nodoc
abstract class _$$NonComplianceTrackingCreateEventImplCopyWith<$Res> {
  factory _$$NonComplianceTrackingCreateEventImplCopyWith(
          _$NonComplianceTrackingCreateEventImpl value,
          $Res Function(_$NonComplianceTrackingCreateEventImpl) then) =
      __$$NonComplianceTrackingCreateEventImplCopyWithImpl<$Res>;
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
    required TResult Function(String? beneficiaryTag) search,
    required TResult Function() allSearch,
  }) {
    return create(nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel? nonComplianceUserAction)? create,
    TResult? Function(String? beneficiaryTag)? search,
    TResult? Function()? allSearch,
  }) {
    return create?.call(nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel? nonComplianceUserAction)? create,
    TResult Function(String? beneficiaryTag)? search,
    TResult Function()? allSearch,
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
    required TResult Function(NonComplianceTrackingSearchEvent value) search,
    required TResult Function(NonComplianceTrackingAllSearchEvent value)
        allSearch,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingCreateEvent value)? create,
    TResult? Function(NonComplianceTrackingSearchEvent value)? search,
    TResult? Function(NonComplianceTrackingAllSearchEvent value)? allSearch,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingCreateEvent value)? create,
    TResult Function(NonComplianceTrackingSearchEvent value)? search,
    TResult Function(NonComplianceTrackingAllSearchEvent value)? allSearch,
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

  UserActionModel? get nonComplianceUserAction;
  @JsonKey(ignore: true)
  _$$NonComplianceTrackingCreateEventImplCopyWith<
          _$NonComplianceTrackingCreateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NonComplianceTrackingSearchEventImplCopyWith<$Res> {
  factory _$$NonComplianceTrackingSearchEventImplCopyWith(
          _$NonComplianceTrackingSearchEventImpl value,
          $Res Function(_$NonComplianceTrackingSearchEventImpl) then) =
      __$$NonComplianceTrackingSearchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? beneficiaryTag});
}

/// @nodoc
class __$$NonComplianceTrackingSearchEventImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingEventCopyWithImpl<$Res,
        _$NonComplianceTrackingSearchEventImpl>
    implements _$$NonComplianceTrackingSearchEventImplCopyWith<$Res> {
  __$$NonComplianceTrackingSearchEventImplCopyWithImpl(
      _$NonComplianceTrackingSearchEventImpl _value,
      $Res Function(_$NonComplianceTrackingSearchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaryTag = freezed,
  }) {
    return _then(_$NonComplianceTrackingSearchEventImpl(
      beneficiaryTag: freezed == beneficiaryTag
          ? _value.beneficiaryTag
          : beneficiaryTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NonComplianceTrackingSearchEventImpl
    implements NonComplianceTrackingSearchEvent {
  const _$NonComplianceTrackingSearchEventImpl({this.beneficiaryTag});

  @override
  final String? beneficiaryTag;

  @override
  String toString() {
    return 'NonComplianceTrackingEvent.search(beneficiaryTag: $beneficiaryTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingSearchEventImpl &&
            (identical(other.beneficiaryTag, beneficiaryTag) ||
                other.beneficiaryTag == beneficiaryTag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beneficiaryTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonComplianceTrackingSearchEventImplCopyWith<
          _$NonComplianceTrackingSearchEventImpl>
      get copyWith => __$$NonComplianceTrackingSearchEventImplCopyWithImpl<
          _$NonComplianceTrackingSearchEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel? nonComplianceUserAction) create,
    required TResult Function(String? beneficiaryTag) search,
    required TResult Function() allSearch,
  }) {
    return search(beneficiaryTag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel? nonComplianceUserAction)? create,
    TResult? Function(String? beneficiaryTag)? search,
    TResult? Function()? allSearch,
  }) {
    return search?.call(beneficiaryTag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel? nonComplianceUserAction)? create,
    TResult Function(String? beneficiaryTag)? search,
    TResult Function()? allSearch,
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
    required TResult Function(NonComplianceTrackingCreateEvent value) create,
    required TResult Function(NonComplianceTrackingSearchEvent value) search,
    required TResult Function(NonComplianceTrackingAllSearchEvent value)
        allSearch,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingCreateEvent value)? create,
    TResult? Function(NonComplianceTrackingSearchEvent value)? search,
    TResult? Function(NonComplianceTrackingAllSearchEvent value)? allSearch,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingCreateEvent value)? create,
    TResult Function(NonComplianceTrackingSearchEvent value)? search,
    TResult Function(NonComplianceTrackingAllSearchEvent value)? allSearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingSearchEvent
    implements NonComplianceTrackingEvent {
  const factory NonComplianceTrackingSearchEvent(
      {final String? beneficiaryTag}) = _$NonComplianceTrackingSearchEventImpl;

  String? get beneficiaryTag;
  @JsonKey(ignore: true)
  _$$NonComplianceTrackingSearchEventImplCopyWith<
          _$NonComplianceTrackingSearchEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NonComplianceTrackingAllSearchEventImplCopyWith<$Res> {
  factory _$$NonComplianceTrackingAllSearchEventImplCopyWith(
          _$NonComplianceTrackingAllSearchEventImpl value,
          $Res Function(_$NonComplianceTrackingAllSearchEventImpl) then) =
      __$$NonComplianceTrackingAllSearchEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NonComplianceTrackingAllSearchEventImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingEventCopyWithImpl<$Res,
        _$NonComplianceTrackingAllSearchEventImpl>
    implements _$$NonComplianceTrackingAllSearchEventImplCopyWith<$Res> {
  __$$NonComplianceTrackingAllSearchEventImplCopyWithImpl(
      _$NonComplianceTrackingAllSearchEventImpl _value,
      $Res Function(_$NonComplianceTrackingAllSearchEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NonComplianceTrackingAllSearchEventImpl
    implements NonComplianceTrackingAllSearchEvent {
  const _$NonComplianceTrackingAllSearchEventImpl();

  @override
  String toString() {
    return 'NonComplianceTrackingEvent.allSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingAllSearchEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserActionModel? nonComplianceUserAction) create,
    required TResult Function(String? beneficiaryTag) search,
    required TResult Function() allSearch,
  }) {
    return allSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserActionModel? nonComplianceUserAction)? create,
    TResult? Function(String? beneficiaryTag)? search,
    TResult? Function()? allSearch,
  }) {
    return allSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserActionModel? nonComplianceUserAction)? create,
    TResult Function(String? beneficiaryTag)? search,
    TResult Function()? allSearch,
    required TResult orElse(),
  }) {
    if (allSearch != null) {
      return allSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingCreateEvent value) create,
    required TResult Function(NonComplianceTrackingSearchEvent value) search,
    required TResult Function(NonComplianceTrackingAllSearchEvent value)
        allSearch,
  }) {
    return allSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingCreateEvent value)? create,
    TResult? Function(NonComplianceTrackingSearchEvent value)? search,
    TResult? Function(NonComplianceTrackingAllSearchEvent value)? allSearch,
  }) {
    return allSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingCreateEvent value)? create,
    TResult Function(NonComplianceTrackingSearchEvent value)? search,
    TResult Function(NonComplianceTrackingAllSearchEvent value)? allSearch,
    required TResult orElse(),
  }) {
    if (allSearch != null) {
      return allSearch(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingAllSearchEvent
    implements NonComplianceTrackingEvent {
  const factory NonComplianceTrackingAllSearchEvent() =
      _$NonComplianceTrackingAllSearchEventImpl;
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
        search,
    required TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)
        allSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
    TResult? Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
    TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingInitState value) init,
    required TResult Function(NonComplianceTrackingCreateState value) create,
    required TResult Function(NonComplianceTrackingSearchState value) search,
    required TResult Function(NonComplianceTrackingAllSearchState value)
        allSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingSearchState value)? search,
    TResult? Function(NonComplianceTrackingAllSearchState value)? allSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingSearchState value)? search,
    TResult Function(NonComplianceTrackingAllSearchState value)? allSearch,
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
        search,
    required TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)
        allSearch,
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
        search,
    TResult? Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
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
        search,
    TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
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
    required TResult Function(NonComplianceTrackingSearchState value) search,
    required TResult Function(NonComplianceTrackingAllSearchState value)
        allSearch,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingSearchState value)? search,
    TResult? Function(NonComplianceTrackingAllSearchState value)? allSearch,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingSearchState value)? search,
    TResult Function(NonComplianceTrackingAllSearchState value)? allSearch,
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
        search,
    required TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)
        allSearch,
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
        search,
    TResult? Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
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
        search,
    TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
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
    required TResult Function(NonComplianceTrackingSearchState value) search,
    required TResult Function(NonComplianceTrackingAllSearchState value)
        allSearch,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingSearchState value)? search,
    TResult? Function(NonComplianceTrackingAllSearchState value)? allSearch,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingSearchState value)? search,
    TResult Function(NonComplianceTrackingAllSearchState value)? allSearch,
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
abstract class _$$NonComplianceTrackingSearchStateImplCopyWith<$Res> {
  factory _$$NonComplianceTrackingSearchStateImplCopyWith(
          _$NonComplianceTrackingSearchStateImpl value,
          $Res Function(_$NonComplianceTrackingSearchStateImpl) then) =
      __$$NonComplianceTrackingSearchStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, UserActionModel? nonComplianceUserAction});
}

/// @nodoc
class __$$NonComplianceTrackingSearchStateImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingStateCopyWithImpl<$Res,
        _$NonComplianceTrackingSearchStateImpl>
    implements _$$NonComplianceTrackingSearchStateImplCopyWith<$Res> {
  __$$NonComplianceTrackingSearchStateImplCopyWithImpl(
      _$NonComplianceTrackingSearchStateImpl _value,
      $Res Function(_$NonComplianceTrackingSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_$NonComplianceTrackingSearchStateImpl(
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

class _$NonComplianceTrackingSearchStateImpl
    implements NonComplianceTrackingSearchState {
  const _$NonComplianceTrackingSearchStateImpl(
      {this.loading = false, this.nonComplianceUserAction});

  @override
  @JsonKey()
  final bool loading;
  @override
  final UserActionModel? nonComplianceUserAction;

  @override
  String toString() {
    return 'NonComplianceTrackingState.search(loading: $loading, nonComplianceUserAction: $nonComplianceUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingSearchStateImpl &&
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
  _$$NonComplianceTrackingSearchStateImplCopyWith<
          _$NonComplianceTrackingSearchStateImpl>
      get copyWith => __$$NonComplianceTrackingSearchStateImplCopyWithImpl<
          _$NonComplianceTrackingSearchStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        create,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        search,
    required TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)
        allSearch,
  }) {
    return search(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
    TResult? Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
  }) {
    return search?.call(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
    TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
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
    required TResult Function(NonComplianceTrackingInitState value) init,
    required TResult Function(NonComplianceTrackingCreateState value) create,
    required TResult Function(NonComplianceTrackingSearchState value) search,
    required TResult Function(NonComplianceTrackingAllSearchState value)
        allSearch,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingSearchState value)? search,
    TResult? Function(NonComplianceTrackingAllSearchState value)? allSearch,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingSearchState value)? search,
    TResult Function(NonComplianceTrackingAllSearchState value)? allSearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingSearchState
    implements NonComplianceTrackingState {
  const factory NonComplianceTrackingSearchState(
          {final bool loading,
          final UserActionModel? nonComplianceUserAction}) =
      _$NonComplianceTrackingSearchStateImpl;

  bool get loading;
  UserActionModel? get nonComplianceUserAction;
  @JsonKey(ignore: true)
  _$$NonComplianceTrackingSearchStateImplCopyWith<
          _$NonComplianceTrackingSearchStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NonComplianceTrackingAllSearchStateImplCopyWith<$Res> {
  factory _$$NonComplianceTrackingAllSearchStateImplCopyWith(
          _$NonComplianceTrackingAllSearchStateImpl value,
          $Res Function(_$NonComplianceTrackingAllSearchStateImpl) then) =
      __$$NonComplianceTrackingAllSearchStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, List<UserActionModel>? nonComplianceUserAction});
}

/// @nodoc
class __$$NonComplianceTrackingAllSearchStateImplCopyWithImpl<$Res>
    extends _$NonComplianceTrackingStateCopyWithImpl<$Res,
        _$NonComplianceTrackingAllSearchStateImpl>
    implements _$$NonComplianceTrackingAllSearchStateImplCopyWith<$Res> {
  __$$NonComplianceTrackingAllSearchStateImplCopyWithImpl(
      _$NonComplianceTrackingAllSearchStateImpl _value,
      $Res Function(_$NonComplianceTrackingAllSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_$NonComplianceTrackingAllSearchStateImpl(
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

class _$NonComplianceTrackingAllSearchStateImpl
    implements NonComplianceTrackingAllSearchState {
  const _$NonComplianceTrackingAllSearchStateImpl(
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
    return 'NonComplianceTrackingState.allSearch(loading: $loading, nonComplianceUserAction: $nonComplianceUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceTrackingAllSearchStateImpl &&
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
  _$$NonComplianceTrackingAllSearchStateImplCopyWith<
          _$NonComplianceTrackingAllSearchStateImpl>
      get copyWith => __$$NonComplianceTrackingAllSearchStateImplCopyWithImpl<
          _$NonComplianceTrackingAllSearchStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        create,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        search,
    required TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)
        allSearch,
  }) {
    return allSearch(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
    TResult? Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
  }) {
    return allSearch?.call(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        create,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
    TResult Function(
            bool loading, List<UserActionModel>? nonComplianceUserAction)?
        allSearch,
    required TResult orElse(),
  }) {
    if (allSearch != null) {
      return allSearch(loading, nonComplianceUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceTrackingInitState value) init,
    required TResult Function(NonComplianceTrackingCreateState value) create,
    required TResult Function(NonComplianceTrackingSearchState value) search,
    required TResult Function(NonComplianceTrackingAllSearchState value)
        allSearch,
  }) {
    return allSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceTrackingInitState value)? init,
    TResult? Function(NonComplianceTrackingCreateState value)? create,
    TResult? Function(NonComplianceTrackingSearchState value)? search,
    TResult? Function(NonComplianceTrackingAllSearchState value)? allSearch,
  }) {
    return allSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceTrackingInitState value)? init,
    TResult Function(NonComplianceTrackingCreateState value)? create,
    TResult Function(NonComplianceTrackingSearchState value)? search,
    TResult Function(NonComplianceTrackingAllSearchState value)? allSearch,
    required TResult orElse(),
  }) {
    if (allSearch != null) {
      return allSearch(this);
    }
    return orElse();
  }
}

abstract class NonComplianceTrackingAllSearchState
    implements NonComplianceTrackingState {
  const factory NonComplianceTrackingAllSearchState(
          {final bool loading,
          final List<UserActionModel>? nonComplianceUserAction}) =
      _$NonComplianceTrackingAllSearchStateImpl;

  bool get loading;
  List<UserActionModel>? get nonComplianceUserAction;
  @JsonKey(ignore: true)
  _$$NonComplianceTrackingAllSearchStateImplCopyWith<
          _$NonComplianceTrackingAllSearchStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
