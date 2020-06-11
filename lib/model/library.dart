import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'library.g.dart';

//TODO: BUILT VALUE
class LibraryModel with ChangeNotifier {
  List<LibraryItemCategory> _categories = [];
  List<LibraryItemType> _types = [];
  List<LibraryItemFile> _files = [];

  List<LibraryItemCategory> get categories => _categories;
  List<LibraryItemType> get types => _types;
  List<LibraryItemFile> get files => _files;

  Map<LibraryItemType, Map<LibraryItemCategory, List<LibraryItemFile>>> get filesTree {
    var result = <LibraryItemType, Map<LibraryItemCategory, List<LibraryItemFile>>>{};

    files.forEach((file) {
      result.update(file.type,
              (v) => v..update(file.category, (v2) => v2..add(file), ifAbsent: () => [file]),
              ifAbsent: () => {file.category: [file]}
      );
    });

    return result;
  }

  void createNewCategory(LibraryItemCategory category) {
    _categories.add(category);
    notifyListeners();
  }

  void addNewFile(LibraryItemFile file) {
    _files.add(file);
    notifyListeners();
  }

  void updateFile(LibraryItemFile file) {
    var index = _files.indexWhere((element) => element.uuid == file.uuid);
    _files.removeAt(index);
    _files.insert(index, file);
    notifyListeners();
  }

  void removeFile(LibraryItemFile file) {
    _files.removeWhere((element) => element.uuid == file.uuid);
    notifyListeners();
  }
}

class LibraryItemType extends EnumClass {
  static const LibraryItemType picture = _$libraryItemTypePicture;
  static const LibraryItemType audio = _$libraryItemTypeAudio;
  static const LibraryItemType gif = _$libraryItemTypeGif;

  const LibraryItemType._(String name) : super(name);

  static BuiltSet<LibraryItemType> get values => _$libraryItemTypeValues;
  static LibraryItemType valueOf(String name) => _$libraryItemTypeValueOf(name);
  static Serializer<LibraryItemType> get serializer => _$libraryItemTypeSerializer;
}

abstract class LibraryItemCategory implements Built<LibraryItemCategory, LibraryItemCategoryBuilder> {
  Uuid get uuid;
  String get title;

  LibraryItemCategory._();

  factory LibraryItemCategory([void Function(LibraryItemCategoryBuilder) updates]) = _$LibraryItemCategory;

  static Serializer<LibraryItemCategory> get serializer => _$libraryItemCategorySerializer;
}

abstract class LibraryItemFile implements Built<LibraryItemFile, LibraryItemFileBuilder> {
  Uuid get uuid;
  String get title;
  LibraryItemType get type;
  LibraryItemCategory get category;
  File get file;
  String get url;

  LibraryItemFile._();

  factory LibraryItemFile([void Function(LibraryItemFileBuilder) updates]) = _$LibraryItemFile;

  static Serializer<LibraryItemFile> get serializer => _$libraryItemFileSerializer;
}
