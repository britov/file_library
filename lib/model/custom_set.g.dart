// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_set.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CustomSetTag> _$customSetTagSerializer =
    new _$CustomSetTagSerializer();
Serializer<CustomSet> _$customSetSerializer = new _$CustomSetSerializer();

class _$CustomSetTagSerializer implements StructuredSerializer<CustomSetTag> {
  @override
  final Iterable<Type> types = const [CustomSetTag, _$CustomSetTag];
  @override
  final String wireName = 'CustomSetTag';

  @override
  Iterable<Object> serialize(Serializers serializers, CustomSetTag object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CustomSetTag deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomSetTagBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CustomSetSerializer implements StructuredSerializer<CustomSet> {
  @override
  final Iterable<Type> types = const [CustomSet, _$CustomSet];
  @override
  final String wireName = 'CustomSet';

  @override
  Iterable<Object> serialize(Serializers serializers, CustomSet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'files',
      serializers.serialize(object.files,
          specifiedType: const FullType(
              BuiltList, const [const FullType(LibraryItemFile)])),
    ];
    if (object.tags != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(object.tags,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CustomSetTag)])));
    }
    return result;
  }

  @override
  CustomSet deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomSetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CustomSetTag)]))
              as BuiltList<Object>);
          break;
        case 'files':
          result.files.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LibraryItemFile)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CustomSetTag extends CustomSetTag {
  @override
  final String title;

  factory _$CustomSetTag([void Function(CustomSetTagBuilder) updates]) =>
      (new CustomSetTagBuilder()..update(updates)).build();

  _$CustomSetTag._({this.title}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('CustomSetTag', 'title');
    }
  }

  @override
  CustomSetTag rebuild(void Function(CustomSetTagBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomSetTagBuilder toBuilder() => new CustomSetTagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomSetTag && title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(0, title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomSetTag')..add('title', title))
        .toString();
  }
}

class CustomSetTagBuilder
    implements Builder<CustomSetTag, CustomSetTagBuilder> {
  _$CustomSetTag _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  CustomSetTagBuilder();

  CustomSetTagBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomSetTag other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomSetTag;
  }

  @override
  void update(void Function(CustomSetTagBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomSetTag build() {
    final _$result = _$v ?? new _$CustomSetTag._(title: title);
    replace(_$result);
    return _$result;
  }
}

class _$CustomSet extends CustomSet {
  @override
  final String title;
  @override
  final BuiltList<CustomSetTag> tags;
  @override
  final BuiltList<LibraryItemFile> files;

  factory _$CustomSet([void Function(CustomSetBuilder) updates]) =>
      (new CustomSetBuilder()..update(updates)).build();

  _$CustomSet._({this.title, this.tags, this.files}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('CustomSet', 'title');
    }
    if (files == null) {
      throw new BuiltValueNullFieldError('CustomSet', 'files');
    }
  }

  @override
  CustomSet rebuild(void Function(CustomSetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomSetBuilder toBuilder() => new CustomSetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomSet &&
        title == other.title &&
        tags == other.tags &&
        files == other.files;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), tags.hashCode), files.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomSet')
          ..add('title', title)
          ..add('tags', tags)
          ..add('files', files))
        .toString();
  }
}

class CustomSetBuilder implements Builder<CustomSet, CustomSetBuilder> {
  _$CustomSet _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ListBuilder<CustomSetTag> _tags;
  ListBuilder<CustomSetTag> get tags =>
      _$this._tags ??= new ListBuilder<CustomSetTag>();
  set tags(ListBuilder<CustomSetTag> tags) => _$this._tags = tags;

  ListBuilder<LibraryItemFile> _files;
  ListBuilder<LibraryItemFile> get files =>
      _$this._files ??= new ListBuilder<LibraryItemFile>();
  set files(ListBuilder<LibraryItemFile> files) => _$this._files = files;

  CustomSetBuilder();

  CustomSetBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _tags = _$v.tags?.toBuilder();
      _files = _$v.files?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomSet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomSet;
  }

  @override
  void update(void Function(CustomSetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomSet build() {
    _$CustomSet _$result;
    try {
      _$result = _$v ??
          new _$CustomSet._(
              title: title, tags: _tags?.build(), files: files.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
        _$failedField = 'files';
        files.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CustomSet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
