// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dip_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DipSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? beneficiaryTag) search,
    required TResult Function() clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? beneficiaryTag)? search,
    TResult? Function()? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? beneficiaryTag)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DipSearchSettlementEvent value) search,
    required TResult Function(DipSearchSettlementClearEvent value) clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DipSearchSettlementEvent value)? search,
    TResult? Function(DipSearchSettlementClearEvent value)? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DipSearchSettlementEvent value)? search,
    TResult Function(DipSearchSettlementClearEvent value)? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DipSearchEventCopyWith<$Res> {
  factory $DipSearchEventCopyWith(
          DipSearchEvent value, $Res Function(DipSearchEvent) then) =
      _$DipSearchEventCopyWithImpl<$Res, DipSearchEvent>;
}

/// @nodoc
class _$DipSearchEventCopyWithImpl<$Res, $Val extends DipSearchEvent>
    implements $DipSearchEventCopyWith<$Res> {
  _$DipSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DipSearchSettlementEventImplCopyWith<$Res> {
  factory _$$DipSearchSettlementEventImplCopyWith(
          _$DipSearchSettlementEventImpl value,
          $Res Function(_$DipSearchSettlementEventImpl) then) =
      __$$DipSearchSettlementEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? beneficiaryTag});
}

/// @nodoc
class __$$DipSearchSettlementEventImplCopyWithImpl<$Res>
    extends _$DipSearchEventCopyWithImpl<$Res, _$DipSearchSettlementEventImpl>
    implements _$$DipSearchSettlementEventImplCopyWith<$Res> {
  __$$DipSearchSettlementEventImplCopyWithImpl(
      _$DipSearchSettlementEventImpl _value,
      $Res Function(_$DipSearchSettlementEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beneficiaryTag = freezed,
  }) {
    return _then(_$DipSearchSettlementEventImpl(
      beneficiaryTag: freezed == beneficiaryTag
          ? _value.beneficiaryTag
          : beneficiaryTag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DipSearchSettlementEventImpl implements DipSearchSettlementEvent {
  const _$DipSearchSettlementEventImpl({this.beneficiaryTag});

  @override
  final String? beneficiaryTag;

  @override
  String toString() {
    return 'DipSearchEvent.search(beneficiaryTag: $beneficiaryTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DipSearchSettlementEventImpl &&
            (identical(other.beneficiaryTag, beneficiaryTag) ||
                other.beneficiaryTag == beneficiaryTag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beneficiaryTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DipSearchSettlementEventImplCopyWith<_$DipSearchSettlementEventImpl>
      get copyWith => __$$DipSearchSettlementEventImplCopyWithImpl<
          _$DipSearchSettlementEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? beneficiaryTag) search,
    required TResult Function() clearSearch,
  }) {
    return search(beneficiaryTag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? beneficiaryTag)? search,
    TResult? Function()? clearSearch,
  }) {
    return search?.call(beneficiaryTag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? beneficiaryTag)? search,
    TResult Function()? clearSearch,
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
    required TResult Function(DipSearchSettlementEvent value) search,
    required TResult Function(DipSearchSettlementClearEvent value) clearSearch,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DipSearchSettlementEvent value)? search,
    TResult? Function(DipSearchSettlementClearEvent value)? clearSearch,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DipSearchSettlementEvent value)? search,
    TResult Function(DipSearchSettlementClearEvent value)? clearSearch,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class DipSearchSettlementEvent implements DipSearchEvent {
  const factory DipSearchSettlementEvent({final String? beneficiaryTag}) =
      _$DipSearchSettlementEventImpl;

  String? get beneficiaryTag;
  @JsonKey(ignore: true)
  _$$DipSearchSettlementEventImplCopyWith<_$DipSearchSettlementEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DipSearchSettlementClearEventImplCopyWith<$Res> {
  factory _$$DipSearchSettlementClearEventImplCopyWith(
          _$DipSearchSettlementClearEventImpl value,
          $Res Function(_$DipSearchSettlementClearEventImpl) then) =
      __$$DipSearchSettlementClearEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DipSearchSettlementClearEventImplCopyWithImpl<$Res>
    extends _$DipSearchEventCopyWithImpl<$Res,
        _$DipSearchSettlementClearEventImpl>
    implements _$$DipSearchSettlementClearEventImplCopyWith<$Res> {
  __$$DipSearchSettlementClearEventImplCopyWithImpl(
      _$DipSearchSettlementClearEventImpl _value,
      $Res Function(_$DipSearchSettlementClearEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DipSearchSettlementClearEventImpl
    implements DipSearchSettlementClearEvent {
  const _$DipSearchSettlementClearEventImpl();

  @override
  String toString() {
    return 'DipSearchEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DipSearchSettlementClearEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? beneficiaryTag) search,
    required TResult Function() clearSearch,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? beneficiaryTag)? search,
    TResult? Function()? clearSearch,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? beneficiaryTag)? search,
    TResult Function()? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DipSearchSettlementEvent value) search,
    required TResult Function(DipSearchSettlementClearEvent value) clearSearch,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DipSearchSettlementEvent value)? search,
    TResult? Function(DipSearchSettlementClearEvent value)? clearSearch,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DipSearchSettlementEvent value)? search,
    TResult Function(DipSearchSettlementClearEvent value)? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class DipSearchSettlementClearEvent implements DipSearchEvent {
  const factory DipSearchSettlementClearEvent() =
      _$DipSearchSettlementClearEventImpl;
}

/// @nodoc
mixin _$DipSearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? selectedDipUserAction)
        search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? selectedDipUserAction)?
        search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? selectedDipUserAction)?
        search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DipSearchInitState value) init,
    required TResult Function(DipSearchSettlementState value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DipSearchInitState value)? init,
    TResult? Function(DipSearchSettlementState value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DipSearchInitState value)? init,
    TResult Function(DipSearchSettlementState value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DipSearchStateCopyWith<$Res> {
  factory $DipSearchStateCopyWith(
          DipSearchState value, $Res Function(DipSearchState) then) =
      _$DipSearchStateCopyWithImpl<$Res, DipSearchState>;
}

/// @nodoc
class _$DipSearchStateCopyWithImpl<$Res, $Val extends DipSearchState>
    implements $DipSearchStateCopyWith<$Res> {
  _$DipSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DipSearchInitStateImplCopyWith<$Res> {
  factory _$$DipSearchInitStateImplCopyWith(_$DipSearchInitStateImpl value,
          $Res Function(_$DipSearchInitStateImpl) then) =
      __$$DipSearchInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DipSearchInitStateImplCopyWithImpl<$Res>
    extends _$DipSearchStateCopyWithImpl<$Res, _$DipSearchInitStateImpl>
    implements _$$DipSearchInitStateImplCopyWith<$Res> {
  __$$DipSearchInitStateImplCopyWithImpl(_$DipSearchInitStateImpl _value,
      $Res Function(_$DipSearchInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DipSearchInitStateImpl implements DipSearchInitState {
  const _$DipSearchInitStateImpl();

  @override
  String toString() {
    return 'DipSearchState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DipSearchInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? selectedDipUserAction)
        search,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? selectedDipUserAction)?
        search,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? selectedDipUserAction)?
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
    required TResult Function(DipSearchInitState value) init,
    required TResult Function(DipSearchSettlementState value) search,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DipSearchInitState value)? init,
    TResult? Function(DipSearchSettlementState value)? search,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DipSearchInitState value)? init,
    TResult Function(DipSearchSettlementState value)? search,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class DipSearchInitState implements DipSearchState {
  const factory DipSearchInitState() = _$DipSearchInitStateImpl;
}

/// @nodoc
abstract class _$$DipSearchSettlementStateImplCopyWith<$Res> {
  factory _$$DipSearchSettlementStateImplCopyWith(
          _$DipSearchSettlementStateImpl value,
          $Res Function(_$DipSearchSettlementStateImpl) then) =
      __$$DipSearchSettlementStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, UserActionModel? selectedDipUserAction});
}

/// @nodoc
class __$$DipSearchSettlementStateImplCopyWithImpl<$Res>
    extends _$DipSearchStateCopyWithImpl<$Res, _$DipSearchSettlementStateImpl>
    implements _$$DipSearchSettlementStateImplCopyWith<$Res> {
  __$$DipSearchSettlementStateImplCopyWithImpl(
      _$DipSearchSettlementStateImpl _value,
      $Res Function(_$DipSearchSettlementStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? selectedDipUserAction = freezed,
  }) {
    return _then(_$DipSearchSettlementStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedDipUserAction: freezed == selectedDipUserAction
          ? _value.selectedDipUserAction
          : selectedDipUserAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ));
  }
}

/// @nodoc

class _$DipSearchSettlementStateImpl implements DipSearchSettlementState {
  const _$DipSearchSettlementStateImpl(
      {this.loading = false, this.selectedDipUserAction = null});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final UserActionModel? selectedDipUserAction;

  @override
  String toString() {
    return 'DipSearchState.search(loading: $loading, selectedDipUserAction: $selectedDipUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DipSearchSettlementStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.selectedDipUserAction, selectedDipUserAction) ||
                other.selectedDipUserAction == selectedDipUserAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, selectedDipUserAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DipSearchSettlementStateImplCopyWith<_$DipSearchSettlementStateImpl>
      get copyWith => __$$DipSearchSettlementStateImplCopyWithImpl<
          _$DipSearchSettlementStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            bool loading, UserActionModel? selectedDipUserAction)
        search,
  }) {
    return search(loading, selectedDipUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(bool loading, UserActionModel? selectedDipUserAction)?
        search,
  }) {
    return search?.call(loading, selectedDipUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(bool loading, UserActionModel? selectedDipUserAction)?
        search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(loading, selectedDipUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DipSearchInitState value) init,
    required TResult Function(DipSearchSettlementState value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DipSearchInitState value)? init,
    TResult? Function(DipSearchSettlementState value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DipSearchInitState value)? init,
    TResult Function(DipSearchSettlementState value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class DipSearchSettlementState implements DipSearchState {
  const factory DipSearchSettlementState(
          {final bool loading, final UserActionModel? selectedDipUserAction}) =
      _$DipSearchSettlementStateImpl;

  bool get loading;
  UserActionModel? get selectedDipUserAction;
  @JsonKey(ignore: true)
  _$$DipSearchSettlementStateImplCopyWith<_$DipSearchSettlementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
