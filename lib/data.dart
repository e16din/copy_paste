// Data Classes

class Note extends BaseObject {
  String title;
  String text;

  Note(this.title, this.text);
}

class Group extends BaseObject {
  String title;
  List<Group> groups = [];
  List<Note> notes = [];

  Group(this.title);
}

class BaseObject {
  int id;
  DateTime created = DateTime.now();
  DateTime updated = DateTime.now();
}
