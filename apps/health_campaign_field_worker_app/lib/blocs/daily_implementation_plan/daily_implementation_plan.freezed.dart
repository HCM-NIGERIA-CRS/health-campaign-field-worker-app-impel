// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_implementation_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DailyImplementationPlanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int date, String administrativeUnit,
            String wfpSupervisor, List<String> selectedSettlements)
        handleSelectSettlements,
    required TResult Function(List<SettlementModel> settlementData)
        handleSelectSettlementsDate,
    required TResult Function(UserActionModel dipUserAction) handleCreate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int date, String administrativeUnit, String wfpSupervisor,
            List<String> selectedSettlements)?
        handleSelectSettlements,
    TResult? Function(List<SettlementModel> settlementData)?
        handleSelectSettlementsDate,
    TResult? Function(UserActionModel dipUserAction)? handleCreate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int date, String administrativeUnit, String wfpSupervisor,
            List<String> selectedSettlements)?
        handleSelectSettlements,
    TResult Function(List<SettlementModel> settlementData)?
        handleSelectSettlementsDate,
    TResult Function(UserActionModel dipUserAction)? handleCreate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            DailyImplementationPlanSelectSettlementsEvent value)
        handleSelectSettlements,
    required TResult Function(
            DailyImplementationPlanSelectSettlementsDateEvent value)
        handleSelectSettlementsDate,
    required TResult Function(DailyImplementationPlanCreateEvent value)
        handleCreate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyImplementationPlanSelectSettlementsEvent value)?
        handleSelectSettlements,
    TResult? Function(DailyImplementationPlanSelectSettlementsDateEvent value)?
        handleSelectSettlementsDate,
    TResult? Function(DailyImplementationPlanCreateEvent value)? handleCreate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyImplementationPlanSelectSettlementsEvent value)?
        handleSelectSettlements,
    TResult Function(DailyImplementationPlanSelectSettlementsDateEvent value)?
        handleSelectSettlementsDate,
    TResult Function(DailyImplementationPlanCreateEvent value)? handleCreate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyImplementationPlanEventCopyWith<$Res> {
  factory $DailyImplementationPlanEventCopyWith(
          DailyImplementationPlanEvent value,
          $Res Function(DailyImplementationPlanEvent) then) =
      _$DailyImplementationPlanEventCopyWithImpl<$Res,
          DailyImplementationPlanEvent>;
}

/// @nodoc
class _$DailyImplementationPlanEventCopyWithImpl<$Res,
        $Val extends DailyImplementationPlanEvent>
    implements $DailyImplementationPlanEventCopyWith<$Res> {
  _$DailyImplementationPlanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DailyImplementationPlanSelectSettlementsEventImplCopyWith<
    $Res> {
  factory _$$DailyImplementationPlanSelectSettlementsEventImplCopyWith(
          _$DailyImplementationPlanSelectSettlementsEventImpl value,
          $Res Function(_$DailyImplementationPlanSelectSettlementsEventImpl)
              then) =
      __$$DailyImplementationPlanSelectSettlementsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int date,
      String administrativeUnit,
      String wfpSupervisor,
      List<String> selectedSettlements});
}

/// @nodoc
class __$$DailyImplementationPlanSelectSettlementsEventImplCopyWithImpl<$Res>
    extends _$DailyImplementationPlanEventCopyWithImpl<$Res,
        _$DailyImplementationPlanSelectSettlementsEventImpl>
    implements
        _$$DailyImplementationPlanSelectSettlementsEventImplCopyWith<$Res> {
  __$$DailyImplementationPlanSelectSettlementsEventImplCopyWithImpl(
      _$DailyImplementationPlanSelectSettlementsEventImpl _value,
      $Res Function(_$DailyImplementationPlanSelectSettlementsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? administrativeUnit = null,
    Object? wfpSupervisor = null,
    Object? selectedSettlements = null,
  }) {
    return _then(_$DailyImplementationPlanSelectSettlementsEventImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      administrativeUnit: null == administrativeUnit
          ? _value.administrativeUnit
          : administrativeUnit // ignore: cast_nullable_to_non_nullable
              as String,
      wfpSupervisor: null == wfpSupervisor
          ? _value.wfpSupervisor
          : wfpSupervisor // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSettlements: null == selectedSettlements
          ? _value._selectedSettlements
          : selectedSettlements // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$DailyImplementationPlanSelectSettlementsEventImpl
    implements DailyImplementationPlanSelectSettlementsEvent {
  const _$DailyImplementationPlanSelectSettlementsEventImpl(
      {required this.date,
      required this.administrativeUnit,
      required this.wfpSupervisor,
      required final List<String> selectedSettlements})
      : _selectedSettlements = selectedSettlements;

  @override
  final int date;
  @override
  final String administrativeUnit;
  @override
  final String wfpSupervisor;
  final List<String> _selectedSettlements;
  @override
  List<String> get selectedSettlements {
    if (_selectedSettlements is EqualUnmodifiableListView)
      return _selectedSettlements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedSettlements);
  }

  @override
  String toString() {
    return 'DailyImplementationPlanEvent.handleSelectSettlements(date: $date, administrativeUnit: $administrativeUnit, wfpSupervisor: $wfpSupervisor, selectedSettlements: $selectedSettlements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyImplementationPlanSelectSettlementsEventImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.administrativeUnit, administrativeUnit) ||
                other.administrativeUnit == administrativeUnit) &&
            (identical(other.wfpSupervisor, wfpSupervisor) ||
                other.wfpSupervisor == wfpSupervisor) &&
            const DeepCollectionEquality()
                .equals(other._selectedSettlements, _selectedSettlements));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, administrativeUnit,
      wfpSupervisor, const DeepCollectionEquality().hash(_selectedSettlements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyImplementationPlanSelectSettlementsEventImplCopyWith<
          _$DailyImplementationPlanSelectSettlementsEventImpl>
      get copyWith =>
          __$$DailyImplementationPlanSelectSettlementsEventImplCopyWithImpl<
                  _$DailyImplementationPlanSelectSettlementsEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int date, String administrativeUnit,
            String wfpSupervisor, List<String> selectedSettlements)
        handleSelectSettlements,
    required TResult Function(List<SettlementModel> settlementData)
        handleSelectSettlementsDate,
    required TResult Function(UserActionModel dipUserAction) handleCreate,
  }) {
    return handleSelectSettlements(
        date, administrativeUnit, wfpSupervisor, selectedSettlements);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int date, String administrativeUnit, String wfpSupervisor,
            List<String> selectedSettlements)?
        handleSelectSettlements,
    TResult? Function(List<SettlementModel> settlementData)?
        handleSelectSettlementsDate,
    TResult? Function(UserActionModel dipUserAction)? handleCreate,
  }) {
    return handleSelectSettlements?.call(
        date, administrativeUnit, wfpSupervisor, selectedSettlements);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int date, String administrativeUnit, String wfpSupervisor,
            List<String> selectedSettlements)?
        handleSelectSettlements,
    TResult Function(List<SettlementModel> settlementData)?
        handleSelectSettlementsDate,
    TResult Function(UserActionModel dipUserAction)? handleCreate,
    required TResult orElse(),
  }) {
    if (handleSelectSettlements != null) {
      return handleSelectSettlements(
          date, administrativeUnit, wfpSupervisor, selectedSettlements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            DailyImplementationPlanSelectSettlementsEvent value)
        handleSelectSettlements,
    required TResult Function(
            DailyImplementationPlanSelectSettlementsDateEvent value)
        handleSelectSettlementsDate,
    required TResult Function(DailyImplementationPlanCreateEvent value)
        handleCreate,
  }) {
    return handleSelectSettlements(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyImplementationPlanSelectSettlementsEvent value)?
        handleSelectSettlements,
    TResult? Function(DailyImplementationPlanSelectSettlementsDateEvent value)?
        handleSelectSettlementsDate,
    TResult? Function(DailyImplementationPlanCreateEvent value)? handleCreate,
  }) {
    return handleSelectSettlements?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyImplementationPlanSelectSettlementsEvent value)?
        handleSelectSettlements,
    TResult Function(DailyImplementationPlanSelectSettlementsDateEvent value)?
        handleSelectSettlementsDate,
    TResult Function(DailyImplementationPlanCreateEvent value)? handleCreate,
    required TResult orElse(),
  }) {
    if (handleSelectSettlements != null) {
      return handleSelectSettlements(this);
    }
    return orElse();
  }
}

abstract class DailyImplementationPlanSelectSettlementsEvent
    implements DailyImplementationPlanEvent {
  const factory DailyImplementationPlanSelectSettlementsEvent(
          {required final int date,
          required final String administrativeUnit,
          required final String wfpSupervisor,
          required final List<String> selectedSettlements}) =
      _$DailyImplementationPlanSelectSettlementsEventImpl;

  int get date;
  String get administrativeUnit;
  String get wfpSupervisor;
  List<String> get selectedSettlements;
  @JsonKey(ignore: true)
  _$$DailyImplementationPlanSelectSettlementsEventImplCopyWith<
          _$DailyImplementationPlanSelectSettlementsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWith<
    $Res> {
  factory _$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWith(
          _$DailyImplementationPlanSelectSettlementsDateEventImpl value,
          $Res Function(_$DailyImplementationPlanSelectSettlementsDateEventImpl)
              then) =
      __$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWithImpl<
          $Res>;
  @useResult
  $Res call({List<SettlementModel> settlementData});
}

/// @nodoc
class __$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWithImpl<
        $Res>
    extends _$DailyImplementationPlanEventCopyWithImpl<$Res,
        _$DailyImplementationPlanSelectSettlementsDateEventImpl>
    implements
        _$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWith<$Res> {
  __$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWithImpl(
      _$DailyImplementationPlanSelectSettlementsDateEventImpl _value,
      $Res Function(_$DailyImplementationPlanSelectSettlementsDateEventImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settlementData = null,
  }) {
    return _then(_$DailyImplementationPlanSelectSettlementsDateEventImpl(
      settlementData: null == settlementData
          ? _value._settlementData
          : settlementData // ignore: cast_nullable_to_non_nullable
              as List<SettlementModel>,
    ));
  }
}

/// @nodoc

class _$DailyImplementationPlanSelectSettlementsDateEventImpl
    implements DailyImplementationPlanSelectSettlementsDateEvent {
  const _$DailyImplementationPlanSelectSettlementsDateEventImpl(
      {required final List<SettlementModel> settlementData})
      : _settlementData = settlementData;

  final List<SettlementModel> _settlementData;
  @override
  List<SettlementModel> get settlementData {
    if (_settlementData is EqualUnmodifiableListView) return _settlementData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_settlementData);
  }

  @override
  String toString() {
    return 'DailyImplementationPlanEvent.handleSelectSettlementsDate(settlementData: $settlementData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyImplementationPlanSelectSettlementsDateEventImpl &&
            const DeepCollectionEquality()
                .equals(other._settlementData, _settlementData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_settlementData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWith<
          _$DailyImplementationPlanSelectSettlementsDateEventImpl>
      get copyWith =>
          __$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWithImpl<
                  _$DailyImplementationPlanSelectSettlementsDateEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int date, String administrativeUnit,
            String wfpSupervisor, List<String> selectedSettlements)
        handleSelectSettlements,
    required TResult Function(List<SettlementModel> settlementData)
        handleSelectSettlementsDate,
    required TResult Function(UserActionModel dipUserAction) handleCreate,
  }) {
    return handleSelectSettlementsDate(settlementData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int date, String administrativeUnit, String wfpSupervisor,
            List<String> selectedSettlements)?
        handleSelectSettlements,
    TResult? Function(List<SettlementModel> settlementData)?
        handleSelectSettlementsDate,
    TResult? Function(UserActionModel dipUserAction)? handleCreate,
  }) {
    return handleSelectSettlementsDate?.call(settlementData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int date, String administrativeUnit, String wfpSupervisor,
            List<String> selectedSettlements)?
        handleSelectSettlements,
    TResult Function(List<SettlementModel> settlementData)?
        handleSelectSettlementsDate,
    TResult Function(UserActionModel dipUserAction)? handleCreate,
    required TResult orElse(),
  }) {
    if (handleSelectSettlementsDate != null) {
      return handleSelectSettlementsDate(settlementData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            DailyImplementationPlanSelectSettlementsEvent value)
        handleSelectSettlements,
    required TResult Function(
            DailyImplementationPlanSelectSettlementsDateEvent value)
        handleSelectSettlementsDate,
    required TResult Function(DailyImplementationPlanCreateEvent value)
        handleCreate,
  }) {
    return handleSelectSettlementsDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyImplementationPlanSelectSettlementsEvent value)?
        handleSelectSettlements,
    TResult? Function(DailyImplementationPlanSelectSettlementsDateEvent value)?
        handleSelectSettlementsDate,
    TResult? Function(DailyImplementationPlanCreateEvent value)? handleCreate,
  }) {
    return handleSelectSettlementsDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyImplementationPlanSelectSettlementsEvent value)?
        handleSelectSettlements,
    TResult Function(DailyImplementationPlanSelectSettlementsDateEvent value)?
        handleSelectSettlementsDate,
    TResult Function(DailyImplementationPlanCreateEvent value)? handleCreate,
    required TResult orElse(),
  }) {
    if (handleSelectSettlementsDate != null) {
      return handleSelectSettlementsDate(this);
    }
    return orElse();
  }
}

abstract class DailyImplementationPlanSelectSettlementsDateEvent
    implements DailyImplementationPlanEvent {
  const factory DailyImplementationPlanSelectSettlementsDateEvent(
          {required final List<SettlementModel> settlementData}) =
      _$DailyImplementationPlanSelectSettlementsDateEventImpl;

  List<SettlementModel> get settlementData;
  @JsonKey(ignore: true)
  _$$DailyImplementationPlanSelectSettlementsDateEventImplCopyWith<
          _$DailyImplementationPlanSelectSettlementsDateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DailyImplementationPlanCreateEventImplCopyWith<$Res> {
  factory _$$DailyImplementationPlanCreateEventImplCopyWith(
          _$DailyImplementationPlanCreateEventImpl value,
          $Res Function(_$DailyImplementationPlanCreateEventImpl) then) =
      __$$DailyImplementationPlanCreateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserActionModel dipUserAction});
}

/// @nodoc
class __$$DailyImplementationPlanCreateEventImplCopyWithImpl<$Res>
    extends _$DailyImplementationPlanEventCopyWithImpl<$Res,
        _$DailyImplementationPlanCreateEventImpl>
    implements _$$DailyImplementationPlanCreateEventImplCopyWith<$Res> {
  __$$DailyImplementationPlanCreateEventImplCopyWithImpl(
      _$DailyImplementationPlanCreateEventImpl _value,
      $Res Function(_$DailyImplementationPlanCreateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dipUserAction = null,
  }) {
    return _then(_$DailyImplementationPlanCreateEventImpl(
      dipUserAction: null == dipUserAction
          ? _value.dipUserAction
          : dipUserAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel,
    ));
  }
}

/// @nodoc

class _$DailyImplementationPlanCreateEventImpl
    implements DailyImplementationPlanCreateEvent {
  const _$DailyImplementationPlanCreateEventImpl({required this.dipUserAction});

  @override
  final UserActionModel dipUserAction;

  @override
  String toString() {
    return 'DailyImplementationPlanEvent.handleCreate(dipUserAction: $dipUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyImplementationPlanCreateEventImpl &&
            (identical(other.dipUserAction, dipUserAction) ||
                other.dipUserAction == dipUserAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dipUserAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyImplementationPlanCreateEventImplCopyWith<
          _$DailyImplementationPlanCreateEventImpl>
      get copyWith => __$$DailyImplementationPlanCreateEventImplCopyWithImpl<
          _$DailyImplementationPlanCreateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int date, String administrativeUnit,
            String wfpSupervisor, List<String> selectedSettlements)
        handleSelectSettlements,
    required TResult Function(List<SettlementModel> settlementData)
        handleSelectSettlementsDate,
    required TResult Function(UserActionModel dipUserAction) handleCreate,
  }) {
    return handleCreate(dipUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int date, String administrativeUnit, String wfpSupervisor,
            List<String> selectedSettlements)?
        handleSelectSettlements,
    TResult? Function(List<SettlementModel> settlementData)?
        handleSelectSettlementsDate,
    TResult? Function(UserActionModel dipUserAction)? handleCreate,
  }) {
    return handleCreate?.call(dipUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int date, String administrativeUnit, String wfpSupervisor,
            List<String> selectedSettlements)?
        handleSelectSettlements,
    TResult Function(List<SettlementModel> settlementData)?
        handleSelectSettlementsDate,
    TResult Function(UserActionModel dipUserAction)? handleCreate,
    required TResult orElse(),
  }) {
    if (handleCreate != null) {
      return handleCreate(dipUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
            DailyImplementationPlanSelectSettlementsEvent value)
        handleSelectSettlements,
    required TResult Function(
            DailyImplementationPlanSelectSettlementsDateEvent value)
        handleSelectSettlementsDate,
    required TResult Function(DailyImplementationPlanCreateEvent value)
        handleCreate,
  }) {
    return handleCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyImplementationPlanSelectSettlementsEvent value)?
        handleSelectSettlements,
    TResult? Function(DailyImplementationPlanSelectSettlementsDateEvent value)?
        handleSelectSettlementsDate,
    TResult? Function(DailyImplementationPlanCreateEvent value)? handleCreate,
  }) {
    return handleCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyImplementationPlanSelectSettlementsEvent value)?
        handleSelectSettlements,
    TResult Function(DailyImplementationPlanSelectSettlementsDateEvent value)?
        handleSelectSettlementsDate,
    TResult Function(DailyImplementationPlanCreateEvent value)? handleCreate,
    required TResult orElse(),
  }) {
    if (handleCreate != null) {
      return handleCreate(this);
    }
    return orElse();
  }
}

abstract class DailyImplementationPlanCreateEvent
    implements DailyImplementationPlanEvent {
  const factory DailyImplementationPlanCreateEvent(
          {required final UserActionModel dipUserAction}) =
      _$DailyImplementationPlanCreateEventImpl;

  UserActionModel get dipUserAction;
  @JsonKey(ignore: true)
  _$$DailyImplementationPlanCreateEventImplCopyWith<
          _$DailyImplementationPlanCreateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DailyImplementationPlanState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)
        selectSettlements,
    required TResult Function(bool loading, UserActionModel? dipUserAction)
        create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)?
        selectSettlements,
    TResult? Function(bool loading, UserActionModel? dipUserAction)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)?
        selectSettlements,
    TResult Function(bool loading, UserActionModel? dipUserAction)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyImplementationPlanInitState value) init,
    required TResult Function(
            DailyImplementationPlanSelectSettlementsState value)
        selectSettlements,
    required TResult Function(DailyImplementationPlanCreateState value) create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyImplementationPlanInitState value)? init,
    TResult? Function(DailyImplementationPlanSelectSettlementsState value)?
        selectSettlements,
    TResult? Function(DailyImplementationPlanCreateState value)? create,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyImplementationPlanInitState value)? init,
    TResult Function(DailyImplementationPlanSelectSettlementsState value)?
        selectSettlements,
    TResult Function(DailyImplementationPlanCreateState value)? create,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyImplementationPlanStateCopyWith<$Res> {
  factory $DailyImplementationPlanStateCopyWith(
          DailyImplementationPlanState value,
          $Res Function(DailyImplementationPlanState) then) =
      _$DailyImplementationPlanStateCopyWithImpl<$Res,
          DailyImplementationPlanState>;
}

/// @nodoc
class _$DailyImplementationPlanStateCopyWithImpl<$Res,
        $Val extends DailyImplementationPlanState>
    implements $DailyImplementationPlanStateCopyWith<$Res> {
  _$DailyImplementationPlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DailyImplementationPlanInitStateImplCopyWith<$Res> {
  factory _$$DailyImplementationPlanInitStateImplCopyWith(
          _$DailyImplementationPlanInitStateImpl value,
          $Res Function(_$DailyImplementationPlanInitStateImpl) then) =
      __$$DailyImplementationPlanInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DailyImplementationPlanInitStateImplCopyWithImpl<$Res>
    extends _$DailyImplementationPlanStateCopyWithImpl<$Res,
        _$DailyImplementationPlanInitStateImpl>
    implements _$$DailyImplementationPlanInitStateImplCopyWith<$Res> {
  __$$DailyImplementationPlanInitStateImplCopyWithImpl(
      _$DailyImplementationPlanInitStateImpl _value,
      $Res Function(_$DailyImplementationPlanInitStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DailyImplementationPlanInitStateImpl
    implements DailyImplementationPlanInitState {
  const _$DailyImplementationPlanInitStateImpl();

  @override
  String toString() {
    return 'DailyImplementationPlanState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyImplementationPlanInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)
        selectSettlements,
    required TResult Function(bool loading, UserActionModel? dipUserAction)
        create,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)?
        selectSettlements,
    TResult? Function(bool loading, UserActionModel? dipUserAction)? create,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)?
        selectSettlements,
    TResult Function(bool loading, UserActionModel? dipUserAction)? create,
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
    required TResult Function(DailyImplementationPlanInitState value) init,
    required TResult Function(
            DailyImplementationPlanSelectSettlementsState value)
        selectSettlements,
    required TResult Function(DailyImplementationPlanCreateState value) create,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyImplementationPlanInitState value)? init,
    TResult? Function(DailyImplementationPlanSelectSettlementsState value)?
        selectSettlements,
    TResult? Function(DailyImplementationPlanCreateState value)? create,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyImplementationPlanInitState value)? init,
    TResult Function(DailyImplementationPlanSelectSettlementsState value)?
        selectSettlements,
    TResult Function(DailyImplementationPlanCreateState value)? create,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class DailyImplementationPlanInitState
    implements DailyImplementationPlanState {
  const factory DailyImplementationPlanInitState() =
      _$DailyImplementationPlanInitStateImpl;
}

/// @nodoc
abstract class _$$DailyImplementationPlanSelectSettlementsStateImplCopyWith<
    $Res> {
  factory _$$DailyImplementationPlanSelectSettlementsStateImplCopyWith(
          _$DailyImplementationPlanSelectSettlementsStateImpl value,
          $Res Function(_$DailyImplementationPlanSelectSettlementsStateImpl)
              then) =
      __$$DailyImplementationPlanSelectSettlementsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int? date,
      String? administrativeUnit,
      String? wfpSupervisor,
      List<String>? selectedSettlements,
      List<SettlementModel>? settlementData});
}

/// @nodoc
class __$$DailyImplementationPlanSelectSettlementsStateImplCopyWithImpl<$Res>
    extends _$DailyImplementationPlanStateCopyWithImpl<$Res,
        _$DailyImplementationPlanSelectSettlementsStateImpl>
    implements
        _$$DailyImplementationPlanSelectSettlementsStateImplCopyWith<$Res> {
  __$$DailyImplementationPlanSelectSettlementsStateImplCopyWithImpl(
      _$DailyImplementationPlanSelectSettlementsStateImpl _value,
      $Res Function(_$DailyImplementationPlanSelectSettlementsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? administrativeUnit = freezed,
    Object? wfpSupervisor = freezed,
    Object? selectedSettlements = freezed,
    Object? settlementData = freezed,
  }) {
    return _then(_$DailyImplementationPlanSelectSettlementsStateImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int?,
      administrativeUnit: freezed == administrativeUnit
          ? _value.administrativeUnit
          : administrativeUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      wfpSupervisor: freezed == wfpSupervisor
          ? _value.wfpSupervisor
          : wfpSupervisor // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSettlements: freezed == selectedSettlements
          ? _value._selectedSettlements
          : selectedSettlements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      settlementData: freezed == settlementData
          ? _value._settlementData
          : settlementData // ignore: cast_nullable_to_non_nullable
              as List<SettlementModel>?,
    ));
  }
}

/// @nodoc

class _$DailyImplementationPlanSelectSettlementsStateImpl
    implements DailyImplementationPlanSelectSettlementsState {
  const _$DailyImplementationPlanSelectSettlementsStateImpl(
      {this.date = null,
      this.administrativeUnit = null,
      this.wfpSupervisor = null,
      final List<String>? selectedSettlements = null,
      final List<SettlementModel>? settlementData = null})
      : _selectedSettlements = selectedSettlements,
        _settlementData = settlementData;

  @override
  @JsonKey()
  final int? date;
  @override
  @JsonKey()
  final String? administrativeUnit;
  @override
  @JsonKey()
  final String? wfpSupervisor;
  final List<String>? _selectedSettlements;
  @override
  @JsonKey()
  List<String>? get selectedSettlements {
    final value = _selectedSettlements;
    if (value == null) return null;
    if (_selectedSettlements is EqualUnmodifiableListView)
      return _selectedSettlements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SettlementModel>? _settlementData;
  @override
  @JsonKey()
  List<SettlementModel>? get settlementData {
    final value = _settlementData;
    if (value == null) return null;
    if (_settlementData is EqualUnmodifiableListView) return _settlementData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DailyImplementationPlanState.selectSettlements(date: $date, administrativeUnit: $administrativeUnit, wfpSupervisor: $wfpSupervisor, selectedSettlements: $selectedSettlements, settlementData: $settlementData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyImplementationPlanSelectSettlementsStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.administrativeUnit, administrativeUnit) ||
                other.administrativeUnit == administrativeUnit) &&
            (identical(other.wfpSupervisor, wfpSupervisor) ||
                other.wfpSupervisor == wfpSupervisor) &&
            const DeepCollectionEquality()
                .equals(other._selectedSettlements, _selectedSettlements) &&
            const DeepCollectionEquality()
                .equals(other._settlementData, _settlementData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      administrativeUnit,
      wfpSupervisor,
      const DeepCollectionEquality().hash(_selectedSettlements),
      const DeepCollectionEquality().hash(_settlementData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyImplementationPlanSelectSettlementsStateImplCopyWith<
          _$DailyImplementationPlanSelectSettlementsStateImpl>
      get copyWith =>
          __$$DailyImplementationPlanSelectSettlementsStateImplCopyWithImpl<
                  _$DailyImplementationPlanSelectSettlementsStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)
        selectSettlements,
    required TResult Function(bool loading, UserActionModel? dipUserAction)
        create,
  }) {
    return selectSettlements(date, administrativeUnit, wfpSupervisor,
        selectedSettlements, settlementData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)?
        selectSettlements,
    TResult? Function(bool loading, UserActionModel? dipUserAction)? create,
  }) {
    return selectSettlements?.call(date, administrativeUnit, wfpSupervisor,
        selectedSettlements, settlementData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)?
        selectSettlements,
    TResult Function(bool loading, UserActionModel? dipUserAction)? create,
    required TResult orElse(),
  }) {
    if (selectSettlements != null) {
      return selectSettlements(date, administrativeUnit, wfpSupervisor,
          selectedSettlements, settlementData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyImplementationPlanInitState value) init,
    required TResult Function(
            DailyImplementationPlanSelectSettlementsState value)
        selectSettlements,
    required TResult Function(DailyImplementationPlanCreateState value) create,
  }) {
    return selectSettlements(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyImplementationPlanInitState value)? init,
    TResult? Function(DailyImplementationPlanSelectSettlementsState value)?
        selectSettlements,
    TResult? Function(DailyImplementationPlanCreateState value)? create,
  }) {
    return selectSettlements?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyImplementationPlanInitState value)? init,
    TResult Function(DailyImplementationPlanSelectSettlementsState value)?
        selectSettlements,
    TResult Function(DailyImplementationPlanCreateState value)? create,
    required TResult orElse(),
  }) {
    if (selectSettlements != null) {
      return selectSettlements(this);
    }
    return orElse();
  }
}

abstract class DailyImplementationPlanSelectSettlementsState
    implements DailyImplementationPlanState {
  const factory DailyImplementationPlanSelectSettlementsState(
          {final int? date,
          final String? administrativeUnit,
          final String? wfpSupervisor,
          final List<String>? selectedSettlements,
          final List<SettlementModel>? settlementData}) =
      _$DailyImplementationPlanSelectSettlementsStateImpl;

  int? get date;
  String? get administrativeUnit;
  String? get wfpSupervisor;
  List<String>? get selectedSettlements;
  List<SettlementModel>? get settlementData;
  @JsonKey(ignore: true)
  _$$DailyImplementationPlanSelectSettlementsStateImplCopyWith<
          _$DailyImplementationPlanSelectSettlementsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DailyImplementationPlanCreateStateImplCopyWith<$Res> {
  factory _$$DailyImplementationPlanCreateStateImplCopyWith(
          _$DailyImplementationPlanCreateStateImpl value,
          $Res Function(_$DailyImplementationPlanCreateStateImpl) then) =
      __$$DailyImplementationPlanCreateStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading, UserActionModel? dipUserAction});
}

/// @nodoc
class __$$DailyImplementationPlanCreateStateImplCopyWithImpl<$Res>
    extends _$DailyImplementationPlanStateCopyWithImpl<$Res,
        _$DailyImplementationPlanCreateStateImpl>
    implements _$$DailyImplementationPlanCreateStateImplCopyWith<$Res> {
  __$$DailyImplementationPlanCreateStateImplCopyWithImpl(
      _$DailyImplementationPlanCreateStateImpl _value,
      $Res Function(_$DailyImplementationPlanCreateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? dipUserAction = freezed,
  }) {
    return _then(_$DailyImplementationPlanCreateStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      dipUserAction: freezed == dipUserAction
          ? _value.dipUserAction
          : dipUserAction // ignore: cast_nullable_to_non_nullable
              as UserActionModel?,
    ));
  }
}

/// @nodoc

class _$DailyImplementationPlanCreateStateImpl
    implements DailyImplementationPlanCreateState {
  const _$DailyImplementationPlanCreateStateImpl(
      {this.loading = false, this.dipUserAction = null});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final UserActionModel? dipUserAction;

  @override
  String toString() {
    return 'DailyImplementationPlanState.create(loading: $loading, dipUserAction: $dipUserAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyImplementationPlanCreateStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.dipUserAction, dipUserAction) ||
                other.dipUserAction == dipUserAction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, dipUserAction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyImplementationPlanCreateStateImplCopyWith<
          _$DailyImplementationPlanCreateStateImpl>
      get copyWith => __$$DailyImplementationPlanCreateStateImplCopyWithImpl<
          _$DailyImplementationPlanCreateStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)
        selectSettlements,
    required TResult Function(bool loading, UserActionModel? dipUserAction)
        create,
  }) {
    return create(loading, dipUserAction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)?
        selectSettlements,
    TResult? Function(bool loading, UserActionModel? dipUserAction)? create,
  }) {
    return create?.call(loading, dipUserAction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(
            int? date,
            String? administrativeUnit,
            String? wfpSupervisor,
            List<String>? selectedSettlements,
            List<SettlementModel>? settlementData)?
        selectSettlements,
    TResult Function(bool loading, UserActionModel? dipUserAction)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(loading, dipUserAction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyImplementationPlanInitState value) init,
    required TResult Function(
            DailyImplementationPlanSelectSettlementsState value)
        selectSettlements,
    required TResult Function(DailyImplementationPlanCreateState value) create,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyImplementationPlanInitState value)? init,
    TResult? Function(DailyImplementationPlanSelectSettlementsState value)?
        selectSettlements,
    TResult? Function(DailyImplementationPlanCreateState value)? create,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyImplementationPlanInitState value)? init,
    TResult Function(DailyImplementationPlanSelectSettlementsState value)?
        selectSettlements,
    TResult Function(DailyImplementationPlanCreateState value)? create,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class DailyImplementationPlanCreateState
    implements DailyImplementationPlanState {
  const factory DailyImplementationPlanCreateState(
          {final bool loading, final UserActionModel? dipUserAction}) =
      _$DailyImplementationPlanCreateStateImpl;

  bool get loading;
  UserActionModel? get dipUserAction;
  @JsonKey(ignore: true)
  _$$DailyImplementationPlanCreateStateImplCopyWith<
          _$DailyImplementationPlanCreateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
