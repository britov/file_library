import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teacher_library/storage/storage.dart';
import 'package:uuid/uuid.dart';

part 'library.g.dart';

class LibraryModel with ChangeNotifier {

  static const prefKey = 'library';

  LibraryModel() {
    init();
  }

  BuiltList<LibraryItemCategory> _categories = BuiltList();
  BuiltList<LibraryItemFile> _files = BuiltList();

  List<LibraryItemCategory> get categories => _categories.toList();
  List<LibraryItemType> get types => LibraryItemType.values.toList();
  List<LibraryItemFile> get files => _files.toList();

  final storage = LocalNoSqlStorage();
  final uuid = Uuid();

  init() async {
    _files = (await storage.getLibraryItemFile()) ?? BuiltList();
    _categories = (await storage.getLibraryItemCategory()) ?? BuiltList();
  }

  static Map<LibraryItemCategory, List<LibraryItemFile>> filesTree(List<LibraryItemFile> files, LibraryItemType type) {
    var result = <LibraryItemCategory, List<LibraryItemFile>>{};

    files
        .where((file) => file.type == type)
        .forEach((file) {
      result.update(file.category, (v2) => v2..add(file), ifAbsent: () => [file]);
    });

    return result;
  }

  void createNewCategory(LibraryItemCategory category) {
    _categories = _categories.rebuild((b) => b
        ..add(category)
    );
    notifyListeners();
    storage.saveLibraryItemCategory(categories);
  }

  LibraryItemCategory addNewCategory(String title) {
    var category = LibraryItemCategory((b) => b
        ..uuid = uuid.v1()
        ..title = title
    );
    createNewCategory(category);
    return category;
  }

  void addNewFile(File file, LibraryItemCategory category) {
    LibraryItemType type;
    var ext = file.path.split('.').last.toLowerCase();
    if (ext == 'gif') {
      type = LibraryItemType.gif;
    } else if (['png', 'jpg', 'jpeg', 'pdf'].contains(ext)) {
      type = LibraryItemType.picture;
    } else {
      type = LibraryItemType.audio;
    }


    var fileName = file.path.split('/').last;

    var fileItem = LibraryItemFile((b) => b
        ..localPath = file.path
        ..uuid = uuid.v1()
        ..type = type
        ..title = fileName
        ..category = category.toBuilder()
    );

    addNewFileItem(fileItem);
  }

  void addNewFileItem(LibraryItemFile file) {
    addNewFileItems([file]);
  }

  void addNewFileItems(List<LibraryItemFile> files) {
    _files = _files.rebuild((b) => b
        ..addAll(files)
    );
    notifyListeners();
    storage.saveLibraryItemFile(files);
  }

  void updateFile(LibraryItemFile file) {
    var index = _files.indexWhere((element) => element.uuid == file.uuid);
    _files = _files.rebuild((b) => b
        ..removeAt(index)
        ..insert(index, file)
    );
    notifyListeners();
    storage.saveLibraryItemFile(files);
  }

  void removeFile(LibraryItemFile file) {
    _files = _files.rebuild((b) => b
        ..removeWhere((element) => element.uuid == file.uuid)
    );
    notifyListeners();
    storage.saveLibraryItemFile(files);
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
  String get uuid;
  String get title;

  LibraryItemCategory._();

  factory LibraryItemCategory([void Function(LibraryItemCategoryBuilder) updates]) = _$LibraryItemCategory;

  static Serializer<LibraryItemCategory> get serializer => _$libraryItemCategorySerializer;
}

abstract class LibraryItemFile implements Built<LibraryItemFile, LibraryItemFileBuilder> {
  String get uuid;
  @nullable String get title;
  LibraryItemType get type;
  LibraryItemCategory get category;
  @nullable String get localPath;
  @nullable String get remoteUrl;

  LibraryItemFile._();

  factory LibraryItemFile([void Function(LibraryItemFileBuilder) updates]) = _$LibraryItemFile;

  static Serializer<LibraryItemFile> get serializer => _$libraryItemFileSerializer;
}
