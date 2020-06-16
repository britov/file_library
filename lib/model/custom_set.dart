import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:teacher_library/storage/storage.dart';
import 'package:uuid/uuid.dart';
import 'library.dart';

part 'custom_set.g.dart';

class CustomSetModel with ChangeNotifier {

  CustomSetModel() {
    init();
  }

  BuiltList<CustomSetTag> _tags = BuiltList();
  BuiltList<CustomSet> _sets = BuiltList();

  List<CustomSet> get sets => _sets.toList();
  List<CustomSetTag> get tags => _tags.toList();

  final storage = LocalNoSqlStorage();
  final uuid = Uuid();

  init() async {
    _tags = (await storage.getCustomSetTag()) ?? BuiltList();
    _sets = (await storage.getCustomSet()) ?? BuiltList();
  }


  void addNewCustomSet(CustomSet set) {
    addNewCustomSets([set]);
  }

  void addNewCustomSets(List<CustomSet> sets) {
    _sets = _sets.rebuild((b) => b
      ..addAll(sets)
    );
    notifyListeners();
    storage.saveCustomSet(this.sets);
  }

  void removeCustomSet(CustomSet set) {
    _sets = _sets.rebuild((b) => b
      ..remove(set)
    );
    notifyListeners();
    storage.saveCustomSet(this.sets);
  }

  void updateCustomSets(CustomSet set) {
    var index = _sets.indexOf(set);
    _sets = _sets.rebuild((b) => b
      ..removeAt(index)
      ..insert(index, set)
    );
    notifyListeners();
    storage.saveCustomSet(this.sets);
  }

  void addNewCustomSetTag(CustomSetTag tag) {
    addNewCustomSetTags([tag]);
  }

  void addNewCustomSetTags(List<CustomSetTag> tags) {
    _tags = _tags.rebuild((b) => b
      ..addAll(tags)
    );
    notifyListeners();
    storage.saveCustomSetTag(this.tags);
  }

}

abstract class CustomSetTag implements Built<CustomSetTag, CustomSetTagBuilder> {
  String get title;

  CustomSetTag._();

  factory CustomSetTag([void Function(CustomSetTagBuilder) updates]) = _$CustomSetTag;

  static Serializer<CustomSetTag> get serializer => _$customSetTagSerializer;
}

abstract class CustomSet implements Built<CustomSet, CustomSetBuilder> {
  String get title;
  @nullable BuiltList<CustomSetTag> get tags;
  BuiltList<LibraryItemFile> get files;

  CustomSet._();

  factory CustomSet([void Function(CustomSetBuilder) updates]) = _$CustomSet;

  static Serializer<CustomSet> get serializer => _$customSetSerializer;
}
