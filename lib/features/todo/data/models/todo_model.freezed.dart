// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoModel {

 String get id; String get title; String get description;@JsonKey(name: 'due_date') int get dueDate; String get status; bool get isDone; bool get isSynced;
/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoModelCopyWith<TodoModel> get copyWith => _$TodoModelCopyWithImpl<TodoModel>(this as TodoModel, _$identity);

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,status,isDone,isSynced);

@override
String toString() {
  return 'TodoModel(id: $id, title: $title, description: $description, dueDate: $dueDate, status: $status, isDone: $isDone, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class $TodoModelCopyWith<$Res>  {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) _then) = _$TodoModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@JsonKey(name: 'due_date') int dueDate, String status, bool isDone, bool isSynced
});




}
/// @nodoc
class _$TodoModelCopyWithImpl<$Res>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._self, this._then);

  final TodoModel _self;
  final $Res Function(TodoModel) _then;

/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? status = null,Object? isDone = null,Object? isSynced = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TodoModel implements TodoModel {
  const _TodoModel({required this.id, required this.title, required this.description, @JsonKey(name: 'due_date') required this.dueDate, required this.status, this.isDone = false, this.isSynced = true});
  factory _TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'due_date') final  int dueDate;
@override final  String status;
@override@JsonKey() final  bool isDone;
@override@JsonKey() final  bool isSynced;

/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoModelCopyWith<_TodoModel> get copyWith => __$TodoModelCopyWithImpl<_TodoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,status,isDone,isSynced);

@override
String toString() {
  return 'TodoModel(id: $id, title: $title, description: $description, dueDate: $dueDate, status: $status, isDone: $isDone, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class _$TodoModelCopyWith<$Res> implements $TodoModelCopyWith<$Res> {
  factory _$TodoModelCopyWith(_TodoModel value, $Res Function(_TodoModel) _then) = __$TodoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@JsonKey(name: 'due_date') int dueDate, String status, bool isDone, bool isSynced
});




}
/// @nodoc
class __$TodoModelCopyWithImpl<$Res>
    implements _$TodoModelCopyWith<$Res> {
  __$TodoModelCopyWithImpl(this._self, this._then);

  final _TodoModel _self;
  final $Res Function(_TodoModel) _then;

/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? status = null,Object? isDone = null,Object? isSynced = null,}) {
  return _then(_TodoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
