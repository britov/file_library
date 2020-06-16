import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'library.dart';
import 'custom_set.dart';

part 'serializers.g.dart';

/// Collection of generated serializers
@SerializersFor([
  LibraryItemCategory,
  LibraryItemType,
  LibraryItemFile,
  CustomSetTag,
  CustomSet,
])
final Serializers serializers = (_$serializers.toBuilder()
  ..addPlugin(StandardJsonPlugin())
  ..addBuilderFactory(
      const FullType(
          BuiltList, [FullType(LibraryItemFile)]),
          () => ListBuilder<LibraryItemFile>())
  ..addBuilderFactory(
      const FullType(
          BuiltList, [FullType(LibraryItemType)]),
          () => ListBuilder<LibraryItemType>())
  ..addBuilderFactory(
      const FullType(
          BuiltList, [FullType(LibraryItemCategory)]),
          () => ListBuilder<LibraryItemCategory>())
  ..addBuilderFactory(
      const FullType(
          BuiltList, [FullType(CustomSetTag)]),
          () => ListBuilder<CustomSetTag>())
  ..addBuilderFactory(
      const FullType(
          BuiltList, [FullType(CustomSetTag)]),
          () => ListBuilder<CustomSetTag>())
)
    .build();
