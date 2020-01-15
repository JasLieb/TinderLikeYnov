import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Person {
  int personId;
  String personFirstName;
  String personLastName;
  String personEmail;

  Person({this.personId, this.personFirstName, this.personLastName, this.personEmail});
  static fromJson(Map<dynamic, dynamic> parsedJson) {
    return Person(
        personId: parsedJson['id'],
        personFirstName: parsedJson['first_name'],
        personLastName: parsedJson['last_name'],
        personEmail: parsedJson['email']
    );
  }

  String getEmail() {
    return personEmail;
  }

  @override
  String toString() {
    return personFirstName + ' ' + personLastName;
  }
}

Future<String> _loadPersonsAsset() async {
  return await rootBundle.loadString('assets/persons.json');
}

Future<List> loadPersons() async {
  String jsonString = await _loadPersonsAsset();
  Map<String, dynamic> personsMap = json.decode(jsonString);
  var t = personsMap["persons"].map((p) => Person.fromJson(p)).toList();
  return t;
}