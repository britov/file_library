// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LibraryItemType _$libraryItemTypePicture =
    const LibraryItemType._('picture');
const LibraryItemType _$libraryItemTypeAudio = const LibraryItemType._('audio');
const LibraryItemType _$libraryItemTypeGif = const LibraryItemType._('gif');

LibraryItemType _$libraryItemTypeValueOf(String name) {
  switch (name) {
    case 'picture':
      return _$libraryItemTypePicture;
    case 'audio':
      return _$libraryItemTypeAudio;
    case 'gif':
      return _$libraryItemTypeGif;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<LibraryItemType> _$libraryItemTypeValues =
    new BuiltSet<LibraryItemType>(const <LibraryItemType>[
  _$libraryItemTypePicture,
  _$libraryItemTypeAudio,
  _$libraryItemTypeGif,
]);

Serializer<LibraryItemType> _$libraryItemTypeSerializer =
    new _$LibraryItemTypeSerializer();
Serializer<LibraryItemCategory> _$libraryItemCategorySerializer =
    new _$LibraryItemCategorySerializer();
Serializer<LibraryItemFile> _$libraryItemFileSerializer =
    new _$LibraryItemFileSerializer();

class _$LibraryItemTypeSerializer
    implements PrimitiveSerializer<LibraryItemType> {
  @override
  final Iterable<Type> types = const <Type>[LibraryItemType];
  @override
  final String wireName = 'LibraryItemType';

  @override
  Object serialize(Serializers serializers, LibraryItemType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  LibraryItemType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LibraryItemType.valueOf(serialized as String);
}

class _$LibraryItemCategorySerializer
    implements StructuredSerializer<LibraryItemCategory> {
  @override
  final Iterable<Type> types = const [
    LibraryItemCategory,
    _$LibraryItemCategory
  ];
  @override
  final String wireName = 'LibraryItemCategory';

  @override
  Iterable<Object> serialize(
      Serializers serializers, LibraryItemCategory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(Uuid)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LibraryItemCategory deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LibraryItemCategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(Uuid)) as Uuid;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LibraryItemFileSerializer
    implements StructuredSerializer<LibraryItemFile> {
  @override
  final Iterable<Type> types = const [LibraryItemFile, _$LibraryItemFile];
  @override
  final String wireName = 'LibraryItemFile';

  @override
  Iterable<Object> serialize(Serializers serializers, LibraryItemFile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uuid',
      serializers.serialize(object.uuid, specifiedType: const FullType(Uuid)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(LibraryItemType)),
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(LibraryItemCategory)),
      'file',
      serializers.serialize(object.file, specifiedType: const FullType(File)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LibraryItemFile deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LibraryItemFileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(Uuid)) as Uuid;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(LibraryItemType))
              as LibraryItemType;
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LibraryItemCategory))
              as LibraryItemCategory);
          break;
        case 'file':
          result.file = serializers.deserialize(value,
              specifiedType: const FullType(File)) as File;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LibraryItemCategory extends LibraryItemCategory {
  @override
  final Uuid uuid;
  @override
  final String title;

  factory _$LibraryItemCategory(
          [void Function(LibraryItemCategoryBuilder) updates]) =>
      (new LibraryItemCategoryBuilder()..update(updates)).build();

  _$LibraryItemCategory._({this.uuid, this.title}) : super._() {
    if (uuid == null) {
      throw new BuiltValueNullFieldError('LibraryItemCategory', 'uuid');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('LibraryItemCategory', 'title');
    }
  }

  @override
  LibraryItemCategory rebuild(
          void Function(LibraryItemCategoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LibraryItemCategoryBuilder toBuilder() =>
      new LibraryItemCategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LibraryItemCategory &&
        uuid == other.uuid &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, uuid.hashCode), title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LibraryItemCategory')
          ..add('uuid', uuid)
          ..add('title', title))
        .toString();
  }
}

class LibraryItemCategoryBuilder
    implements Builder<LibraryItemCategory, LibraryItemCategoryBuilder> {
  _$LibraryItemCategory _$v;

  Uuid _uuid;
  Uuid get uuid => _$this._uuid;
  set uuid(Uuid uuid) => _$this._uuid = uuid;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  LibraryItemCategoryBuilder();

  LibraryItemCategoryBuilder get _$this {
    if (_$v != null) {
      _uuid = _$v.uuid;
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LibraryItemCategory other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LibraryItemCategory;
  }

  @override
  void update(void Function(LibraryItemCategoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LibraryItemCategory build() {
    final _$result =
        _$v ?? new _$LibraryItemCategory._(uuid: uuid, title: title);
    replace(_$result);
    return _$result;
  }
}

class _$LibraryItemFile extends LibraryItemFile {
  @override
  final Uuid uuid;
  @override
  final String title;
  @override
  final LibraryItemType type;
  @override
  final LibraryItemCategory category;
  @override
  final File file;
  @override
  final String url;

  factory _$LibraryItemFile([void Function(LibraryItemFileBuilder) updates]) =>
      (new LibraryItemFileBuilder()..update(updates)).build();

  _$LibraryItemFile._(
      {this.uuid, this.title, this.type, this.category, this.file, this.url})
      : super._() {
    if (uuid == null) {
      throw new BuiltValueNullFieldError('LibraryItemFile', 'uuid');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('LibraryItemFile', 'title');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('LibraryItemFile', 'type');
    }
    if (category == null) {
      throw new BuiltValueNullFieldError('LibraryItemFile', 'category');
    }
    if (file == null) {
      throw new BuiltValueNullFieldError('LibraryItemFile', 'file');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('LibraryItemFile', 'url');
    }
  }

  @override
  LibraryItemFile rebuild(void Function(LibraryItemFileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LibraryItemFileBuilder toBuilder() =>
      new LibraryItemFileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LibraryItemFile &&
        uuid == other.uuid &&
        title == other.title &&
        type == other.type &&
        category == other.category &&
        file == other.file &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, uuid.hashCode), title.hashCode), type.hashCode),
                category.hashCode),
            file.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LibraryItemFile')
          ..add('uuid', uuid)
          ..add('title', title)
          ..add('type', type)
          ..add('category', category)
          ..add('file', file)
          ..add('url', url))
        .toString();
  }
}

class LibraryItemFileBuilder
    implements Builder<LibraryItemFile, LibraryItemFileBuilder> {
  _$LibraryItemFile _$v;

  Uuid _uuid;
  Uuid get uuid => _$this._uuid;
  set uuid(Uuid uuid) => _$this._uuid = uuid;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  LibraryItemType _type;
  LibraryItemType get type => _$this._type;
  set type(LibraryItemType type) => _$this._type = type;

  LibraryItemCategoryBuilder _category;
  LibraryItemCategoryBuilder get category =>
      _$this._category ??= new LibraryItemCategoryBuilder();
  set category(LibraryItemCategoryBuilder category) =>
      _$this._category = category;

  File _file;
  File get file => _$this._file;
  set file(File file) => _$this._file = file;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  LibraryItemFileBuilder();

  LibraryItemFileBuilder get _$this {
    if (_$v != null) {
      _uuid = _$v.uuid;
      _title = _$v.title;
      _type = _$v.type;
      _category = _$v.category?.toBuilder();
      _file = _$v.file;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LibraryItemFile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LibraryItemFile;
  }

  @override
  void update(void Function(LibraryItemFileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LibraryItemFile build() {
    _$LibraryItemFile _$result;
    try {
      _$result = _$v ??
          new _$LibraryItemFile._(
              uuid: uuid,
              title: title,
              type: type,
              category: category.build(),
              file: file,
              url: url);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'category';
        category.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LibraryItemFile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
