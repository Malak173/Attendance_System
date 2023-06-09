import 'package:flutter/material.dart';
import 'package:excel/excel.dart' as exc;
import 'exceldata.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({super.key});

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  final List<List<dynamic>> Data = [
    AttendanceDate(Name: 'malak Mohammed ', Id: '14253351', TotalPresant: '70%',)
        .toList(),
    AttendanceDate(Name: 'Ganna Mahmoud', Id: '14253352', TotalPresant: '80%',)
        .toList(),
    AttendanceDate(
            Name: 'Fatima Nasser', Id: '14253357', TotalPresant: '65%', )
        .toList(),
    AttendanceDate(Name: 'Youssef Tarek', Id: '14253354', TotalPresant: '75%',)
        .toList(),
    AttendanceDate(Name: 'Mohammed Medhat', Id: '14253362', TotalPresant: '88%', )
        .toList(),
  ];
  final List<List<dynamic>> Data2 = [
    AttendanceDate(Name: 'Salma Salah ', Id: '14253351', TotalPresant: '20%',)
        .toList(),
    AttendanceDate(Name: 'Ahmed Salem', Id: '14253342', TotalPresant: '80%',)
        .toList(),
    AttendanceDate(
      Name: 'Rahma Eid', Id: '14253357', TotalPresant: '75%', )
        .toList(),
    AttendanceDate(Name: 'Asmaa Gomaa', Id: '14253354', TotalPresant: '12%',)
        .toList(),
    AttendanceDate(Name: 'Reem Mahmoud', Id: '14253372', TotalPresant: '10%', )
        .toList(),
    AttendanceDate(Name: 'Ahmed Mohammed', Id: '14253340', TotalPresant: '15%', )
        .toList(),
    AttendanceDate(Name: 'Rehab Refaat', Id: '14253390', TotalPresant: '18%', )
        .toList(),
  ];
  var valuechoose;
  var selectedDate;


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

    // excel.save(filePath);
    excel.save();
  }

  List<List<dynamic>> data = [
    ['Name', 'Age', 'Email'],
    ['John', 25, 'john@example.com'],
    ['Jane', 30, 'jane@example.com'],
    // Add more rows as needed
  ];

  String filePath = '/path/to/exported_file.xlsx';

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
      body: Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    hint: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Select Course:'),
                    ),
                    value: valuechoose,
                    onChanged: (newValue) {
                      setState(() {
                        valuechoose = newValue;
                      });
                    },
                    items: itemList.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: DropdownButton(
                //     hint: const Padding(
                //       padding: EdgeInsets.all(8.0),
                //       child: Text('Select Date:'),
                //     ),
                //     value: selectedDate,
                //     onChanged: (newValue) {
                //       setState(() {
                //         selectedDate = newValue;
                //       });
                //     },
                //     items: itemList2.map((valueItem) {
                //       return DropdownMenuItem(
                //         value: valueItem,
                //         child: Text(valueItem),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 10,
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
                              "Attends",
                              style: TextStyle(
                                  color: Color(0xff92E3A9), fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 110,
                          ),
                          MaterialButton(
                            onPressed: () {
                              exportToExcel(Data, filePath);
                            },
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff92E3A9),
                              ),
                              child: const Center(
                                  child: Text(
                                "Export",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        height: MediaQuery.of(context).size.height * 0.60,
                        //width: MediaQuery.of(context).size.width*0.62,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: const Color(0xff92E3A9),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color(0xff92E3A9).withOpacity(0.8)),
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
                              rows: Data.map((data) {
                                return DataRow(cells: [
                                  DataCell(Text(data[1])), //num
                                  DataCell(Text(data[0])), //name
                                  DataCell(Text(data[2])), //id
                                   //total present
                                ]);
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Absence",
                              style: TextStyle(
                                  color: Color(0xE0FF686D), fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 110,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.red.withOpacity(0.8),
                              ),
                              child: const Center(
                                  child: Text(
                                "Export",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              )),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        height: MediaQuery.of(context).size.height * 0.60,
                        //width: MediaQuery.of(context).size.width*0.62,

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
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.red.withOpacity(0.8)),
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
                              rows: Data2.map((data) {
                                return DataRow(cells: [
                                  // DataCell(Text(data.Num)),
                                  // DataCell(Text(data.Name)),
                                  // DataCell(Text(data.Id)),
                                  // DataCell(Text(data.TotalPresant)),
                                  DataCell(Text(data[1])), //num
                                  DataCell(Text(data[0])), //name
                                  DataCell(Text(data[2])), //id
                                  //total present
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
      ),
    ));
  }
}
