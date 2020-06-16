import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';

part 'custom_set.g.dart';

class CustomSetModel with ChangeNotifier {

  List<CustomSetTag> _tags = [];
  List<CustomSet> _sets = [];

}

abstract class CustomSetTag implements Built<CustomSetTag, CustomSetTagBuilder> {
  String get title;

  CustomSetTag._();

  factory CustomSetTag([void Function(CustomSetTagBuilder) updates]) = _$CustomSetTag;

  static Serializer<CustomSetTag> get serializer => _$customSetTagSerializer;
}

abstract class CustomSet implements Built<CustomSet, CustomSetBuilder> {
  String get title;
  BuiltList<CustomSetTag> get tags;

  CustomSet._();

  factory CustomSet([void Function(CustomSetBuilder) updates]) = _$CustomSet;

  static Serializer<CustomSet> get serializer => _$customSetSerializer;
}
