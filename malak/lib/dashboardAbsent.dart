import 'package:flutter/material.dart';
import 'package:excel/excel.dart' as exc;
import 'package:malak/api/api_manager.dart';
// import 'package:path_provider/path_provider.dart';
import 'exceldata.dart';
import 'package:path/path.dart' as path;

class DashboardAbsent extends StatefulWidget {
  const DashboardAbsent({super.key});

  @override
  State<DashboardAbsent> createState() => _DashboardAbsentState();
}

class _DashboardAbsentState extends State<DashboardAbsent> {
  // final List<List<dynamic>> Data = [
  //   AttendanceDate(Name: 'malak Mohammed ', Id: '14253351', TotalPresant: '70%',)
  //       .toList(),
  //   AttendanceDate(Name: 'Ganna Mahmoud', Id: '14253352', TotalPresant: '80%',)
  //       .toList(),
  //   AttendanceDate(
  //           Name: 'Fatima Nasser', Id: '14253357', TotalPresant: '65%', )
  //       .toList(),
  //   AttendanceDate(Name: 'Youssef Tarek', Id: '14253354', TotalPresant: '75%',)
  //       .toList(),
  //   AttendanceDate(Name: 'Mohammed Medhat', Id: '14253362', TotalPresant: '88%', )
  //       .toList(),
  // ];
  final List<List<dynamic>> Data2 = [
    AttendanceDate(
      Name: 'Salma Salah ',
      Id: "14253351",
      TotalPresant: "20%",
    ).toList(),
    AttendanceDate(
      Name: 'Ahmed Salem',
      Id: "14253342",
      TotalPresant: "80%",
    ).toList(),
    AttendanceDate(
      Name: 'Rahma Eid',
      Id: "14253357",
      TotalPresant: "75%",
    ).toList(),
    AttendanceDate(
      Name: 'Asmaa Gomaa',
      Id: "14253357",
      TotalPresant: "75%",
    ).toList(),
    AttendanceDate(
      Name: 'Reem Mahmoud',
      Id: "14253357",
      TotalPresant: "75%",
    ).toList(),
    AttendanceDate(
      Name: 'Ahmed Mohammed',
      Id: "14253357",
      TotalPresant: "75%",
    ).toList(),
    AttendanceDate(
      Name: 'Rehab Refaat',
      Id: "14253357",
      TotalPresant: "75%",
    ).toList(),
  ];

  // String filePath = 'exported_file.xlsx';
  void exportToExcel(List<List<dynamic>> data, String filePath) {
    var excel = exc.Excel.createExcel();
    var sheet = excel['Sheet1'];

    for (var i = 0; i < data.length; i++) {
      var rowData = data[i];
      for (var j = 0; j < rowData.length; j++) {
        sheet
            .cell(exc.CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i))
            .value = rowData[j];
      }
    }

    excel.save();
    // excel.save(filePath);

    // excel.save();
  }

  var valuechoose;
  var selectedDate;
  List<String> itemList = [
    'COMP 401',
    'COMP 302',
    'COMP 201',
    'COMP 305',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
              future: ApiManeger.GetStudentsAbsent(),
              builder: (BuildContext, snapshot) {
                var data = snapshot.data?.count;
                print(data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                List<AttendanceDate> AbsentData =
                    snapshot.data?.results!.map((attend) {
                          return AttendanceDate(
                              Id: '${attend.id}',
                              Name: attend.student?.firstName,
                              TotalPresant: "${attend.absentPercentage}");
                        }).toList() ??
                        [];
                return Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Absence",
                                        style: TextStyle(
                                            color: Color(0xE0FF686D),
                                            fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 110,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        var filePath = 'exported_file.xlsx';
                                        exportToExcel(Data2, filePath);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.red.withOpacity(0.8),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "Export",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(8.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.60,
                                  // width: MediaQuery.of(context).size.width*0.40,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Colors.red.withOpacity(0.8),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        headingRowColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.red
                                                    .withOpacity(0.8)),
                                        columns: const [
                                          DataColumn(
                                            label: Text(
                                              'Name',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'User ID',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          DataColumn(
                                            label: Text(
                                              'Rate',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                        rows: AbsentData.map((data) {
                                          return DataRow(cells: [
                                            DataCell(Text(
                                                '${data.Name}')),
                                            DataCell(Text('${data.Id}')),
                                            DataCell(Text(
                                                '${data.TotalPresant}%')),
                                          ]);
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                //return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    ));
  }
}
