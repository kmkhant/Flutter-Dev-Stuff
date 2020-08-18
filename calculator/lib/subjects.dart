class DynamicSubject {
  String name = "default";
  int currentAttendance;
  int totalAttendance;
  double remainingAttandance;
  static List<DynamicSubject> listSubjects = [];
  
  DynamicSubject({this.name, this.currentAttendance, this.remainingAttandance, this.totalAttendance});
}