// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetListCollectionCollection on Isar {
  IsarCollection<ListCollection> get listCollections => this.collection();
}

const ListCollectionSchema = CollectionSchema(
  name: r'ListCollection',
  id: 8576213607591904213,
  properties: {
    r'completeds': PropertySchema(
      id: 0,
      name: r'completeds',
      type: IsarType.boolList,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'tasks': PropertySchema(
      id: 2,
      name: r'tasks',
      type: IsarType.stringList,
    )
  },
  estimateSize: _listCollectionEstimateSize,
  serialize: _listCollectionSerialize,
  deserialize: _listCollectionDeserialize,
  deserializeProp: _listCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _listCollectionGetId,
  getLinks: _listCollectionGetLinks,
  attach: _listCollectionAttach,
  version: '3.1.0+1',
);

int _listCollectionEstimateSize(
  ListCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.completeds.length;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.tasks.length * 3;
  {
    for (var i = 0; i < object.tasks.length; i++) {
      final value = object.tasks[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _listCollectionSerialize(
  ListCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBoolList(offsets[0], object.completeds);
  writer.writeString(offsets[1], object.name);
  writer.writeStringList(offsets[2], object.tasks);
}

ListCollection _listCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ListCollection(
    completeds: reader.readBoolList(offsets[0]) ?? [],
    name: reader.readString(offsets[1]),
    tasks: reader.readStringList(offsets[2]) ?? [],
  );
  object.id = id;
  return object;
}

P _listCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolList(offset) ?? []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _listCollectionGetId(ListCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _listCollectionGetLinks(ListCollection object) {
  return [];
}

void _listCollectionAttach(
    IsarCollection<dynamic> col, Id id, ListCollection object) {
  object.id = id;
}

extension ListCollectionQueryWhereSort
    on QueryBuilder<ListCollection, ListCollection, QWhere> {
  QueryBuilder<ListCollection, ListCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ListCollectionQueryWhere
    on QueryBuilder<ListCollection, ListCollection, QWhereClause> {
  QueryBuilder<ListCollection, ListCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ListCollectionQueryFilter
    on QueryBuilder<ListCollection, ListCollection, QFilterCondition> {
  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      completedsElementEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completeds',
        value: value,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      completedsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completeds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      completedsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completeds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      completedsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completeds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      completedsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completeds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      completedsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completeds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      completedsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completeds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tasks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tasks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tasks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tasks',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tasks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tasks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tasks',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tasks',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tasks',
        value: '',
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tasks',
        value: '',
      ));
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tasks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tasks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tasks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tasks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tasks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterFilterCondition>
      tasksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tasks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ListCollectionQueryObject
    on QueryBuilder<ListCollection, ListCollection, QFilterCondition> {}

extension ListCollectionQueryLinks
    on QueryBuilder<ListCollection, ListCollection, QFilterCondition> {}

extension ListCollectionQuerySortBy
    on QueryBuilder<ListCollection, ListCollection, QSortBy> {
  QueryBuilder<ListCollection, ListCollection, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ListCollectionQuerySortThenBy
    on QueryBuilder<ListCollection, ListCollection, QSortThenBy> {
  QueryBuilder<ListCollection, ListCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ListCollection, ListCollection, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension ListCollectionQueryWhereDistinct
    on QueryBuilder<ListCollection, ListCollection, QDistinct> {
  QueryBuilder<ListCollection, ListCollection, QDistinct>
      distinctByCompleteds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completeds');
    });
  }

  QueryBuilder<ListCollection, ListCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ListCollection, ListCollection, QDistinct> distinctByTasks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tasks');
    });
  }
}

extension ListCollectionQueryProperty
    on QueryBuilder<ListCollection, ListCollection, QQueryProperty> {
  QueryBuilder<ListCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ListCollection, List<bool>, QQueryOperations>
      completedsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completeds');
    });
  }

  QueryBuilder<ListCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ListCollection, List<String>, QQueryOperations> tasksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tasks');
    });
  }
}
