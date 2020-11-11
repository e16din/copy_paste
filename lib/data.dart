// Data Classes

import 'package:floor/floor.dart';

@Entity(
  tableName: 'notes',
  foreignKeys: [
    ForeignKey(
      childColumns: ['owner_id'],
      parentColumns: ['id'],
      entity: Group,
    )
  ],
)
class Note extends BaseObject {
  String title;
  String text;

  Note(
      {int id,
      int ownerId,
      DateTime createdAt,
      DateTime updatedAt,
      this.title,
      this.text})
      : super(id, ownerId, createdAt, createdAt);
}

@Entity(tableName: 'groups', foreignKeys: [
  ForeignKey(
    childColumns: ['owner_id'],
    parentColumns: ['id'],
    entity: Group,
  )
])
class Group extends BaseObject {
  String title;

  @ignore
  List<Group> groups = [];

  @ignore
  List<Note> notes = [];

  Group(
      {int id, int ownerId, DateTime createdAt, DateTime updatedAt, this.title})
      : super(id, ownerId, createdAt, createdAt);
}

class BaseObject {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final int ownerId;

  DateTime created = DateTime.now();
  DateTime updated = DateTime.now();

  BaseObject(this.id, this.ownerId, this.created, this.updated);
}
