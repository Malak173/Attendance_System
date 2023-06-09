class AttendanceDate{

  final String Name;
  final String Id;
  final String TotalPresant;


  AttendanceDate({
    required this.Id,
    required this.Name,
    required this.TotalPresant,

  });
  List<dynamic> toList() {
    return [Id, Name, TotalPresant ];
  }
}