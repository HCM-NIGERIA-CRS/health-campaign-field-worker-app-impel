// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'non_compliance_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NonComplianceSearchEvent {
  String? get beneficiaryTag => throw _privateConstructorUsedError;
  String? get resourceTag => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? beneficiaryTag, String? resourceTag)
        search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? beneficiaryTag, String? resourceTag)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? beneficiaryTag, String? resourceTag)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceSearchCompleteEvent value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceSearchCompleteEvent value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceSearchCompleteEvent value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NonComplianceSearchEventCopyWith<NonComplianceSearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonComplianceSearchEventCopyWith<$Res> {
  factory $NonComplianceSearchEventCopyWith(NonComplianceSearchEvent value,
          $Res Function(NonComplianceSearchEvent) then) =
      _$NonComplianceSearchEventCopyWithImpl<$Res, NonComplianceSearchEvent>;
  @useResult
  $Res call({String? beneficiaryTag, String? resourceTag});
}

/// @nodoc
class _$NonComplianceSearchEventCopyWithImpl<$Res,
        $Val extends NonComplianceSearchEvent>
    implements $NonComplianceSearchEventCopyWith<$Res> {
  _$NonComplianceSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaryTag = freezed,
    Object? resourceTag = freezed,
  }) {
    return _then(_value.copyWith(
      beneficiaryTag: freezed == beneficiaryTag
          ? _value.beneficiaryTag
          : beneficiaryTag // ignore: cast_nullable_to_non_nullable
              as String?,
      resourceTag: freezed == resourceTag
          ? _value.resourceTag
          : resourceTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NonComplianceSearchCompleteEventImplCopyWith<$Res>
    implements $NonComplianceSearchEventCopyWith<$Res> {
  factory _$$NonComplianceSearchCompleteEventImplCopyWith(
          _$NonComplianceSearchCompleteEventImpl value,
          $Res Function(_$NonComplianceSearchCompleteEventImpl) then) =
      __$$NonComplianceSearchCompleteEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? beneficiaryTag, String? resourceTag});
}

/// @nodoc
class __$$NonComplianceSearchCompleteEventImplCopyWithImpl<$Res>
    extends _$NonComplianceSearchEventCopyWithImpl<$Res,
        _$NonComplianceSearchCompleteEventImpl>
    implements _$$NonComplianceSearchCompleteEventImplCopyWith<$Res> {
  __$$NonComplianceSearchCompleteEventImplCopyWithImpl(
      _$NonComplianceSearchCompleteEventImpl _value,
      $Res Function(_$NonComplianceSearchCompleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaryTag = freezed,
    Object? resourceTag = freezed,
  }) {
    return _then(_$NonComplianceSearchCompleteEventImpl(
      beneficiaryTag: freezed == beneficiaryTag
          ? _value.beneficiaryTag
          : beneficiaryTag // ignore: cast_nullable_to_non_nullable
              as String?,
      resourceTag: freezed == resourceTag
          ? _value.resourceTag
          : resourceTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NonComplianceSearchCompleteEventImpl
    implements NonComplianceSearchCompleteEvent {
  const _$NonComplianceSearchCompleteEventImpl(
      {this.beneficiaryTag, this.resourceTag});

  @override
  final String? beneficiaryTag;
  @override
  final String? resourceTag;

  @override
  String toString() {
    return 'NonComplianceSearchEvent.search(beneficiaryTag: $beneficiaryTag, resourceTag: $resourceTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceSearchCompleteEventImpl &&
            (identical(other.beneficiaryTag, beneficiaryTag) ||
                other.beneficiaryTag == beneficiaryTag) &&
            (identical(other.resourceTag, resourceTag) ||
                other.resourceTag == resourceTag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beneficiaryTag, resourceTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonComplianceSearchCompleteEventImplCopyWith<
          _$NonComplianceSearchCompleteEventImpl>
      get copyWith => __$$NonComplianceSearchCompleteEventImplCopyWithImpl<
          _$NonComplianceSearchCompleteEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? beneficiaryTag, String? resourceTag)
        search,
  }) {
    return search(beneficiaryTag, resourceTag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? beneficiaryTag, String? resourceTag)? search,
  }) {
    return search?.call(beneficiaryTag, resourceTag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? beneficiaryTag, String? resourceTag)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(beneficiaryTag, resourceTag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceSearchCompleteEvent value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceSearchCompleteEvent value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceSearchCompleteEvent value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class NonComplianceSearchCompleteEvent
    implements NonComplianceSearchEvent {
  const factory NonComplianceSearchCompleteEvent(
      {final String? beneficiaryTag,
      final String? resourceTag}) = _$NonComplianceSearchCompleteEventImpl;

  @override
  String? get beneficiaryTag;
  @override
  String? get resourceTag;
  @override
  @JsonKey(ignore: true)
  _$$NonComplianceSearchCompleteEventImplCopyWith<
          _$NonComplianceSearchCompleteEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NonComplianceSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonComplianceSearchInitState value) init,
    required TResult Function(NonComplianceSearchCompleteState value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceSearchInitState value)? init,
    TResult? Function(NonComplianceSearchCompleteState value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceSearchInitState value)? init,
    TResult Function(NonComplianceSearchCompleteState value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonComplianceSearchStateCopyWith<$Res> {
  factory $NonComplianceSearchStateCopyWith(NonComplianceSearchState value,
          $Res Function(NonComplianceSearchState) then) =
      _$NonComplianceSearchStateCopyWithImpl<$Res, NonComplianceSearchState>;
}

/// @nodoc
class _$NonComplianceSearchStateCopyWithImpl<$Res,
        $Val extends NonComplianceSearchState>
    implements $NonComplianceSearchStateCopyWith<$Res> {
  _$NonComplianceSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NonComplianceSearchInitStateImplCopyWith<$Res> {
  factory _$$NonComplianceSearchInitStateImplCopyWith(
          _$NonComplianceSearchInitStateImpl value,
          $Res Function(_$NonComplianceSearchInitStateImpl) then) =
      __$$NonComplianceSearchInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NonComplianceSearchInitStateImplCopyWithImpl<$Res>
    extends _$NonComplianceSearchStateCopyWithImpl<$Res,
        _$NonComplianceSearchInitStateImpl>
    implements _$$NonComplianceSearchInitStateImplCopyWith<$Res> {
  __$$NonComplianceSearchInitStateImplCopyWithImpl(
      _$NonComplianceSearchInitStateImpl _value,
      $Res Function(_$NonComplianceSearchInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NonComplianceSearchInitStateImpl
    implements NonComplianceSearchInitState {
  const _$NonComplianceSearchInitStateImpl();

  @override
  String toString() {
    return 'NonComplianceSearchState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceSearchInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        search,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
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
    required TResult Function(NonComplianceSearchInitState value) init,
    required TResult Function(NonComplianceSearchCompleteState value) search,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceSearchInitState value)? init,
    TResult? Function(NonComplianceSearchCompleteState value)? search,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceSearchInitState value)? init,
    TResult Function(NonComplianceSearchCompleteState value)? search,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class NonComplianceSearchInitState
    implements NonComplianceSearchState {
  const factory NonComplianceSearchInitState() =
      _$NonComplianceSearchInitStateImpl;
}

/// @nodoc
abstract class _$$NonComplianceSearchCompleteStateImplCopyWith<$Res> {
  factory _$$NonComplianceSearchCompleteStateImplCopyWith(
          _$NonComplianceSearchCompleteStateImpl value,
          $Res Function(_$NonComplianceSearchCompleteStateImpl) then) =
      __$$NonComplianceSearchCompleteStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, UserActionModel? nonComplianceUserAction});
}

/// @nodoc
class __$$NonComplianceSearchCompleteStateImplCopyWithImpl<$Res>
    extends _$NonComplianceSearchStateCopyWithImpl<$Res,
        _$NonComplianceSearchCompleteStateImpl>
    implements _$$NonComplianceSearchCompleteStateImplCopyWith<$Res> {
  __$$NonComplianceSearchCompleteStateImplCopyWithImpl(
      _$NonComplianceSearchCompleteStateImpl _value,
      $Res Function(_$NonComplianceSearchCompleteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? nonComplianceUserAction = freezed,
  }) {
    return _then(_$NonComplianceSearchCompleteStateImpl(
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

class _$NonComplianceSearchCompleteStateImpl
    implements NonComplianceSearchCompleteState {
  const _$NonComplianceSearchCompleteStateImpl(
      {this.loading = false, this.nonComplianceUserAction});

  @override
  @JsonKey()
  final bool loading;
  @override
  final UserActionModel? nonComplianceUserAction;

  @override
  String toString() {
    return 'NonComplianceSearchState.search(loading: $loading, nonComplianceUserAction: $nonComplianceUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonComplianceSearchCompleteStateImpl &&
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
  _$$NonComplianceSearchCompleteStateImplCopyWith<
          _$NonComplianceSearchCompleteStateImpl>
      get copyWith => __$$NonComplianceSearchCompleteStateImplCopyWithImpl<
          _$NonComplianceSearchCompleteStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? nonComplianceUserAction)
        search,
  }) {
    return search(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? nonComplianceUserAction)?
        search,
  }) {
    return search?.call(loading, nonComplianceUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? nonComplianceUserAction)?
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
    required TResult Function(NonComplianceSearchInitState value) init,
    required TResult Function(NonComplianceSearchCompleteState value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonComplianceSearchInitState value)? init,
    TResult? Function(NonComplianceSearchCompleteState value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonComplianceSearchInitState value)? init,
    TResult Function(NonComplianceSearchCompleteState value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class NonComplianceSearchCompleteState
    implements NonComplianceSearchState {
  const factory NonComplianceSearchCompleteState(
          {final bool loading,
          final UserActionModel? nonComplianceUserAction}) =
      _$NonComplianceSearchCompleteStateImpl;

  bool get loading;
  UserActionModel? get nonComplianceUserAction;
  @JsonKey(ignore: true)
  _$$NonComplianceSearchCompleteStateImplCopyWith<
          _$NonComplianceSearchCompleteStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
