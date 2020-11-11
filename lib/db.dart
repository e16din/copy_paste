import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'data.dart';

part 'db.g.dart'; // the generated code will be there

// NOTE: Run the generator with:
// flutter packages pub run build_runner build
//
// To automatically run it, whenever a file changes, use:
// flutter packages pub run build_runner watch

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Group, Note])
abstract class AppDatabase extends FloorDatabase {
  GroupDao get groupDao;

  NoteDao get noteDao;
}

@dao
abstract class NoteDao {
  @Query('SELECT * FROM Note')
  Future<List<Note>> getAllNotes();

  @Query('SELECT * FROM Note WHERE owner_id = :ownerId')
  Future<Note> getNotesByGroupId(int ownerId);

  @Query('SELECT * FROM Note WHERE id = :id')
  Future<Note> getNoteById(int id);

  @insert
  Future<void> insertNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteNote(Note note);
}

@dao
abstract class GroupDao {
  @Query('SELECT * FROM Group')
  Future<List<Group>> getAllGroups();

  @Query('SELECT * FROM Group WHERE owner_id = :ownerId')
  Future<Note> getGroupsByGroupId(int ownerId);

  @Query('SELECT * FROM Group WHERE id = :id')
  Stream<Group> findGroupById(int id);

  @insert
  Future<void> insertGroup(Group group);

  @update
  Future<void> updateGroup(Group group);

  @delete
  Future<void> deleteGroup(Group group);
}

class DateTimeConverter extends TypeConverter<DateTime, int> {
  @override
  DateTime decode(int milliseconds) {
    return DateTime.fromMillisecondsSinceEpoch(milliseconds);
  }

  @override
  int encode(DateTime date) {
    return date.millisecondsSinceEpoch;
  }
}