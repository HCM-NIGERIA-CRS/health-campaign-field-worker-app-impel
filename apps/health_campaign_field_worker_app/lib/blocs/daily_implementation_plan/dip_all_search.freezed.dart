// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'dip_all_search.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

// /// @nodoc
// mixin _$DipAllSearchEvent {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(String? userAction) search,
//     required TResult Function() clearSearch,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(String? userAction)? search,
//     TResult? Function()? clearSearch,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(String? userAction)? search,
//     TResult Function()? clearSearch,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(DipAllSearchSettlementEvent value) search,
//     required TResult Function(DipAllSearchSettlementClearEvent value)
//         clearSearch,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(DipAllSearchSettlementEvent value)? search,
//     TResult? Function(DipAllSearchSettlementClearEvent value)? clearSearch,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(DipAllSearchSettlementEvent value)? search,
//     TResult Function(DipAllSearchSettlementClearEvent value)? clearSearch,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $DipAllSearchEventCopyWith<$Res> {
//   factory $DipAllSearchEventCopyWith(
//           DipAllSearchEvent value, $Res Function(DipAllSearchEvent) then) =
//       _$DipAllSearchEventCopyWithImpl<$Res, DipAllSearchEvent>;
// }

// /// @nodoc
// class _$DipAllSearchEventCopyWithImpl<$Res, $Val extends DipAllSearchEvent>
//     implements $DipAllSearchEventCopyWith<$Res> {
//   _$DipAllSearchEventCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
// }

// /// @nodoc
// abstract class _$$DipAllSearchSettlementEventImplCopyWith<$Res> {
//   factory _$$DipAllSearchSettlementEventImplCopyWith(
//           _$DipAllSearchSettlementEventImpl value,
//           $Res Function(_$DipAllSearchSettlementEventImpl) then) =
//       __$$DipAllSearchSettlementEventImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({String? userAction});
// }

// /// @nodoc
// class __$$DipAllSearchSettlementEventImplCopyWithImpl<$Res>
//     extends _$DipAllSearchEventCopyWithImpl<$Res,
//         _$DipAllSearchSettlementEventImpl>
//     implements _$$DipAllSearchSettlementEventImplCopyWith<$Res> {
//   __$$DipAllSearchSettlementEventImplCopyWithImpl(
//       _$DipAllSearchSettlementEventImpl _value,
//       $Res Function(_$DipAllSearchSettlementEventImpl) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? userAction = freezed,
//   }) {
//     return _then(_$DipAllSearchSettlementEventImpl(
//       userAction: freezed == userAction
//           ? _value.userAction
//           : userAction // ignore: cast_nullable_to_non_nullable
//               as String?,
//     ));
//   }
// }

// /// @nodoc

// class _$DipAllSearchSettlementEventImpl implements DipAllSearchSettlementEvent {
//   const _$DipAllSearchSettlementEventImpl({this.userAction});

//   @override
//   final String? userAction;

//   @override
//   String toString() {
//     return 'DipAllSearchEvent.search(userAction: $userAction)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$DipAllSearchSettlementEventImpl &&
//             (identical(other.userAction, userAction) ||
//                 other.userAction == userAction));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, userAction);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$DipAllSearchSettlementEventImplCopyWith<_$DipAllSearchSettlementEventImpl>
//       get copyWith => __$$DipAllSearchSettlementEventImplCopyWithImpl<
//           _$DipAllSearchSettlementEventImpl>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(String? userAction) search,
//     required TResult Function() clearSearch,
//   }) {
//     return search(userAction);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(String? userAction)? search,
//     TResult? Function()? clearSearch,
//   }) {
//     return search?.call(userAction);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(String? userAction)? search,
//     TResult Function()? clearSearch,
//     required TResult orElse(),
//   }) {
//     if (search != null) {
//       return search(userAction);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(DipAllSearchSettlementEvent value) search,
//     required TResult Function(DipAllSearchSettlementClearEvent value)
//         clearSearch,
//   }) {
//     return search(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(DipAllSearchSettlementEvent value)? search,
//     TResult? Function(DipAllSearchSettlementClearEvent value)? clearSearch,
//   }) {
//     return search?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(DipAllSearchSettlementEvent value)? search,
//     TResult Function(DipAllSearchSettlementClearEvent value)? clearSearch,
//     required TResult orElse(),
//   }) {
//     if (search != null) {
//       return search(this);
//     }
//     return orElse();
//   }
// }

// abstract class DipAllSearchSettlementEvent implements DipAllSearchEvent {
//   const factory DipAllSearchSettlementEvent({final String? userAction}) =
//       _$DipAllSearchSettlementEventImpl;

//   String? get userAction;
//   @JsonKey(ignore: true)
//   _$$DipAllSearchSettlementEventImplCopyWith<_$DipAllSearchSettlementEventImpl>
//       get copyWith => throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class _$$DipAllSearchSettlementClearEventImplCopyWith<$Res> {
//   factory _$$DipAllSearchSettlementClearEventImplCopyWith(
//           _$DipAllSearchSettlementClearEventImpl value,
//           $Res Function(_$DipAllSearchSettlementClearEventImpl) then) =
//       __$$DipAllSearchSettlementClearEventImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$DipAllSearchSettlementClearEventImplCopyWithImpl<$Res>
//     extends _$DipAllSearchEventCopyWithImpl<$Res,
//         _$DipAllSearchSettlementClearEventImpl>
//     implements _$$DipAllSearchSettlementClearEventImplCopyWith<$Res> {
//   __$$DipAllSearchSettlementClearEventImplCopyWithImpl(
//       _$DipAllSearchSettlementClearEventImpl _value,
//       $Res Function(_$DipAllSearchSettlementClearEventImpl) _then)
//       : super(_value, _then);
// }

// /// @nodoc

// class _$DipAllSearchSettlementClearEventImpl
//     implements DipAllSearchSettlementClearEvent {
//   const _$DipAllSearchSettlementClearEventImpl();

//   @override
//   String toString() {
//     return 'DipAllSearchEvent.clearSearch()';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$DipAllSearchSettlementClearEventImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function(String? userAction) search,
//     required TResult Function() clearSearch,
//   }) {
//     return clearSearch();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function(String? userAction)? search,
//     TResult? Function()? clearSearch,
//   }) {
//     return clearSearch?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function(String? userAction)? search,
//     TResult Function()? clearSearch,
//     required TResult orElse(),
//   }) {
//     if (clearSearch != null) {
//       return clearSearch();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(DipAllSearchSettlementEvent value) search,
//     required TResult Function(DipAllSearchSettlementClearEvent value)
//         clearSearch,
//   }) {
//     return clearSearch(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(DipAllSearchSettlementEvent value)? search,
//     TResult? Function(DipAllSearchSettlementClearEvent value)? clearSearch,
//   }) {
//     return clearSearch?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(DipAllSearchSettlementEvent value)? search,
//     TResult Function(DipAllSearchSettlementClearEvent value)? clearSearch,
//     required TResult orElse(),
//   }) {
//     if (clearSearch != null) {
//       return clearSearch(this);
//     }
//     return orElse();
//   }
// }

// abstract class DipAllSearchSettlementClearEvent implements DipAllSearchEvent {
//   const factory DipAllSearchSettlementClearEvent() =
//       _$DipAllSearchSettlementClearEventImpl;
// }

// /// @nodoc
// mixin _$DipAllSearchState {
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() init,
//     required TResult Function(
//             bool loading, List<UserActionModel>? allDipUserAction)
//         search,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? init,
//     TResult? Function(bool loading, List<UserActionModel>? allDipUserAction)?
//         search,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? init,
//     TResult Function(bool loading, List<UserActionModel>? allDipUserAction)?
//         search,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(DipAllSearchInitState value) init,
//     required TResult Function(DipAllSearchSettlementState value) search,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(DipAllSearchInitState value)? init,
//     TResult? Function(DipAllSearchSettlementState value)? search,
//   }) =>
//       throw _privateConstructorUsedError;
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(DipAllSearchInitState value)? init,
//     TResult Function(DipAllSearchSettlementState value)? search,
//     required TResult orElse(),
//   }) =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $DipAllSearchStateCopyWith<$Res> {
//   factory $DipAllSearchStateCopyWith(
//           DipAllSearchState value, $Res Function(DipAllSearchState) then) =
//       _$DipAllSearchStateCopyWithImpl<$Res, DipAllSearchState>;
// }

// /// @nodoc
// class _$DipAllSearchStateCopyWithImpl<$Res, $Val extends DipAllSearchState>
//     implements $DipAllSearchStateCopyWith<$Res> {
//   _$DipAllSearchStateCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;
// }

// /// @nodoc
// abstract class _$$DipAllSearchInitStateImplCopyWith<$Res> {
//   factory _$$DipAllSearchInitStateImplCopyWith(
//           _$DipAllSearchInitStateImpl value,
//           $Res Function(_$DipAllSearchInitStateImpl) then) =
//       __$$DipAllSearchInitStateImplCopyWithImpl<$Res>;
// }

// /// @nodoc
// class __$$DipAllSearchInitStateImplCopyWithImpl<$Res>
//     extends _$DipAllSearchStateCopyWithImpl<$Res, _$DipAllSearchInitStateImpl>
//     implements _$$DipAllSearchInitStateImplCopyWith<$Res> {
//   __$$DipAllSearchInitStateImplCopyWithImpl(_$DipAllSearchInitStateImpl _value,
//       $Res Function(_$DipAllSearchInitStateImpl) _then)
//       : super(_value, _then);
// }

// /// @nodoc

// class _$DipAllSearchInitStateImpl implements DipAllSearchInitState {
//   const _$DipAllSearchInitStateImpl();

//   @override
//   String toString() {
//     return 'DipAllSearchState.init()';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$DipAllSearchInitStateImpl);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() init,
//     required TResult Function(
//             bool loading, List<UserActionModel>? allDipUserAction)
//         search,
//   }) {
//     return init();
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? init,
//     TResult? Function(bool loading, List<UserActionModel>? allDipUserAction)?
//         search,
//   }) {
//     return init?.call();
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? init,
//     TResult Function(bool loading, List<UserActionModel>? allDipUserAction)?
//         search,
//     required TResult orElse(),
//   }) {
//     if (init != null) {
//       return init();
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(DipAllSearchInitState value) init,
//     required TResult Function(DipAllSearchSettlementState value) search,
//   }) {
//     return init(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(DipAllSearchInitState value)? init,
//     TResult? Function(DipAllSearchSettlementState value)? search,
//   }) {
//     return init?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(DipAllSearchInitState value)? init,
//     TResult Function(DipAllSearchSettlementState value)? search,
//     required TResult orElse(),
//   }) {
//     if (init != null) {
//       return init(this);
//     }
//     return orElse();
//   }
// }

// abstract class DipAllSearchInitState implements DipAllSearchState {
//   const factory DipAllSearchInitState() = _$DipAllSearchInitStateImpl;
// }

// /// @nodoc
// abstract class _$$DipAllSearchSettlementStateImplCopyWith<$Res> {
//   factory _$$DipAllSearchSettlementStateImplCopyWith(
//           _$DipAllSearchSettlementStateImpl value,
//           $Res Function(_$DipAllSearchSettlementStateImpl) then) =
//       __$$DipAllSearchSettlementStateImplCopyWithImpl<$Res>;
//   @useResult
//   $Res call({bool loading, List<UserActionModel>? allDipUserAction});
// }

// /// @nodoc
// class __$$DipAllSearchSettlementStateImplCopyWithImpl<$Res>
//     extends _$DipAllSearchStateCopyWithImpl<$Res,
//         _$DipAllSearchSettlementStateImpl>
//     implements _$$DipAllSearchSettlementStateImplCopyWith<$Res> {
//   __$$DipAllSearchSettlementStateImplCopyWithImpl(
//       _$DipAllSearchSettlementStateImpl _value,
//       $Res Function(_$DipAllSearchSettlementStateImpl) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? loading = null,
//     Object? allDipUserAction = freezed,
//   }) {
//     return _then(_$DipAllSearchSettlementStateImpl(
//       loading: null == loading
//           ? _value.loading
//           : loading // ignore: cast_nullable_to_non_nullable
//               as bool,
//       allDipUserAction: freezed == allDipUserAction
//           ? _value._allDipUserAction
//           : allDipUserAction // ignore: cast_nullable_to_non_nullable
//               as List<UserActionModel>?,
//     ));
//   }
// }

// /// @nodoc

// class _$DipAllSearchSettlementStateImpl implements DipAllSearchSettlementState {
//   const _$DipAllSearchSettlementStateImpl(
//       {this.loading = false,
//       final List<UserActionModel>? allDipUserAction = null})
//       : _allDipUserAction = allDipUserAction;

//   @override
//   @JsonKey()
//   final bool loading;
//   final List<UserActionModel>? _allDipUserAction;
//   @override
//   @JsonKey()
//   List<UserActionModel>? get allDipUserAction {
//     final value = _allDipUserAction;
//     if (value == null) return null;
//     if (_allDipUserAction is EqualUnmodifiableListView)
//       return _allDipUserAction;
//     // ignore: implicit_dynamic_type
//     return EqualUnmodifiableListView(value);
//   }

//   @override
//   String toString() {
//     return 'DipAllSearchState.search(loading: $loading, allDipUserAction: $allDipUserAction)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$DipAllSearchSettlementStateImpl &&
//             (identical(other.loading, loading) || other.loading == loading) &&
//             const DeepCollectionEquality()
//                 .equals(other._allDipUserAction, _allDipUserAction));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, loading,
//       const DeepCollectionEquality().hash(_allDipUserAction));

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$DipAllSearchSettlementStateImplCopyWith<_$DipAllSearchSettlementStateImpl>
//       get copyWith => __$$DipAllSearchSettlementStateImplCopyWithImpl<
//           _$DipAllSearchSettlementStateImpl>(this, _$identity);

//   @override
//   @optionalTypeArgs
//   TResult when<TResult extends Object?>({
//     required TResult Function() init,
//     required TResult Function(
//             bool loading, List<UserActionModel>? allDipUserAction)
//         search,
//   }) {
//     return search(loading, allDipUserAction);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? whenOrNull<TResult extends Object?>({
//     TResult? Function()? init,
//     TResult? Function(bool loading, List<UserActionModel>? allDipUserAction)?
//         search,
//   }) {
//     return search?.call(loading, allDipUserAction);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeWhen<TResult extends Object?>({
//     TResult Function()? init,
//     TResult Function(bool loading, List<UserActionModel>? allDipUserAction)?
//         search,
//     required TResult orElse(),
//   }) {
//     if (search != null) {
//       return search(loading, allDipUserAction);
//     }
//     return orElse();
//   }

//   @override
//   @optionalTypeArgs
//   TResult map<TResult extends Object?>({
//     required TResult Function(DipAllSearchInitState value) init,
//     required TResult Function(DipAllSearchSettlementState value) search,
//   }) {
//     return search(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult? mapOrNull<TResult extends Object?>({
//     TResult? Function(DipAllSearchInitState value)? init,
//     TResult? Function(DipAllSearchSettlementState value)? search,
//   }) {
//     return search?.call(this);
//   }

//   @override
//   @optionalTypeArgs
//   TResult maybeMap<TResult extends Object?>({
//     TResult Function(DipAllSearchInitState value)? init,
//     TResult Function(DipAllSearchSettlementState value)? search,
//     required TResult orElse(),
//   }) {
//     if (search != null) {
//       return search(this);
//     }
//     return orElse();
//   }
// }

// abstract class DipAllSearchSettlementState implements DipAllSearchState {
//   const factory DipAllSearchSettlementState(
//           {final bool loading, final List<UserActionModel>? allDipUserAction}) =
//       _$DipAllSearchSettlementStateImpl;

//   bool get loading;
//   List<UserActionModel>? get allDipUserAction;
//   @JsonKey(ignore: true)
//   _$$DipAllSearchSettlementStateImplCopyWith<_$DipAllSearchSettlementStateImpl>
//       get copyWith => throw _privateConstructorUsedError;
// }
