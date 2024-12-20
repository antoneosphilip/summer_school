import 'package:hive/hive.dart';
import 'absence.dart';

part 'student.g.dart';

@HiveType(typeId: 2)
class StudentData {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int studentClass;

  @HiveField(3)
  final int level;

  @HiveField(4)
  final int gender;

  @HiveField(5)
  final String? birthDate;

  @HiveField(6)
  final int? age;

  @HiveField(7)
  final String? mamPhone;

  @HiveField(8)
  final String? dadPhone;

  @HiveField(9)
  final String? studPhone;

  @HiveField(10)
  final int shift;

  @HiveField(11)
  final int numberOfAbsences;

  @HiveField(12)
  final String notes;

  @HiveField(13)
  final List<Absence>? absences;

  StudentData({
    required this.id,
    required this.name,
    required this.studentClass,
    required this.level,
    required this.gender,
    this.birthDate,
    this.age,
    this.mamPhone,
    this.dadPhone,
    this.studPhone,
    required this.shift,
    required this.numberOfAbsences,
    required this.notes,
    required this.absences,
  });
}
