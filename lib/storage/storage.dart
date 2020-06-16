
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../model/library.dart';
import '../model/custom_set.dart';
import '../model/serializers.dart';



class LocalNoSqlStorage {
  static const profilesDocumentKey = 'library5';
  static const keyPrefix = 'list';

  final RecordRef<String, Map<String, dynamic>> _recordRefLibraryItemCategory;
  final RecordRef<String, Map<String, dynamic>> _recordRefLibraryItemType;
  final RecordRef<String, Map<String, dynamic>> _recordRefLibraryItemFile;
  final RecordRef<String, Map<String, dynamic>> _recordRefCustomSetTag;
  final RecordRef<String, Map<String, dynamic>> _recordRefCustomSet;

  Database _databaseInstance;
  Future<Database> get _database async => _databaseInstance ??= await _openDatabase();

  LocalNoSqlStorage() :
        _recordRefLibraryItemCategory = stringMapStoreFactory.store(profilesDocumentKey).record('LibraryItemCategory'),
        _recordRefLibraryItemType = stringMapStoreFactory.store(profilesDocumentKey).record('LibraryItemType'),
        _recordRefLibraryItemFile = stringMapStoreFactory.store(profilesDocumentKey).record('LibraryItemFile'),
        _recordRefCustomSetTag = stringMapStoreFactory.store(profilesDocumentKey).record('CustomSetTag'),
        _recordRefCustomSet = stringMapStoreFactory.store(profilesDocumentKey).record('CustomSet');

  Future<Database> _openDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, 'teacher_library', 'cache', 'local_library.db');
    return await  databaseFactoryIo.openDatabase(dbPath, version: 1);
  }


  Future<bool> saveLibraryItemCategory(List<LibraryItemCategory> files) => _save(_recordRefLibraryItemCategory, files);
  Future<bool> saveLibraryItemType(List<LibraryItemType> files) => _save(_recordRefLibraryItemType, files);
  Future<bool> saveLibraryItemFile(List<LibraryItemFile> files) => _save(_recordRefLibraryItemFile, files);
  Future<bool> saveCustomSetTag(List<CustomSetTag> files) => _save(_recordRefCustomSetTag, files);
  Future<bool> saveCustomSet(List<CustomSet> files) => _save(_recordRefCustomSet, files);


  Future<BuiltList<LibraryItemCategory>> getLibraryItemCategory() => _get(_recordRefLibraryItemCategory);
  Future<BuiltList<LibraryItemType>> getLibraryItemType() => _get(_recordRefLibraryItemType);
  Future<BuiltList<LibraryItemFile>> getLibraryItemFile() => _get(_recordRefLibraryItemFile);
  Future<BuiltList<CustomSetTag>> getCustomSetTag() => _get(_recordRefCustomSetTag);
  Future<BuiltList<CustomSet>> getCustomSet() => _get(_recordRefCustomSet);


  Future<bool> _save<T>(RecordRef<String, Map<String, dynamic>> recordRefFiles, List<T> files) async {
    List value = files == null ? null : serializers.serialize(BuiltList.of(files), specifiedType: FullType(BuiltList, [FullType(T)]));

    var res = await recordRefFiles.put(await _database, {keyPrefix: value});
    print('put data $value result $res');

    return true;
  }

  Future<BuiltList<T>> _get<T>(RecordRef<String, Map<String, dynamic>> recordRefFiles) async {
    Map<String, dynamic> value = await recordRefFiles.get(await _database);
    print('get data $value');

    if (value == null || !value.containsKey(keyPrefix)) {
      return null;
    }

    return serializers.deserialize(value[keyPrefix], specifiedType: FullType(BuiltList, [FullType(T)]));
  }
}



