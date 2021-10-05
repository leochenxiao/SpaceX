import 'package:flutter/material.dart';
import 'package:spacex/lanch.dart';
import 'widget/scrollable_widget.dart';

class TableScreen extends StatefulWidget {
  //Pass variable object to widget
  TableScreen({this.tableData});
  List<Lanches>? tableData;
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<Lanches>? dataForTable;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    dataForTable = widget.tableData;
    //print(widget.tableData);
  }

  void storeData(inputData) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableWidget(child: buildDataTable()),
    );
  }

  Widget buildDataTable() {
    final columns = ['Mission Name', 'Lanch Date', 'Lanch Success'];
    return DataTable(
        sortAscending: isAscending,
        sortColumnIndex: sortColumnIndex,
        columns: getColumns(columns),
        rows: getRows(dataForTable));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column,
                style: const TextStyle(fontStyle: FontStyle.italic)),
            onSort: onSort, //recursion
          ))
      .toList();

  List<DataRow> getRows(List<Lanches>? dataForTable, {int i = 0}) =>
      dataForTable!.map((Lanches lanches) {
        final cells = [
          lanches.missionName,
          lanches.launchDateUtc,
          lanches.launchSuccess
        ];
        //User i for iterator number for get Class Object.
        return DataRow(cells: getCells(cells, i++));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells, int i) => cells
      .map((data) => DataCell(Text('$data'), onTap: () {
            //  const SimpleDialog(
            //   title: Text('test'),
            // );
            AlertDialog alert = AlertDialog(
              title: Text(
                'Mission ' + dataForTable![i].missionName + ' Informations:',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Rocket Name: ' + dataForTable![i].rocket!.rocketName),
                    Text('Rocket Type: ' + dataForTable![i].rocket!.rocketType),
                    const Divider(
                      height: 25,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    const Text(
                      'First Stage: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    for (int j = 0;
                        j < dataForTable![i].rocket!.firstStage!.cores!.length;
                        j++)
                      Text('Core Serial: ' +
                          dataForTable![i]
                              .rocket!
                              .firstStage!
                              .cores![j]
                              .coreSerial +
                          '  Landing Type: ' +
                          dataForTable![i]
                              .rocket!
                              .firstStage!
                              .cores![j]
                              .landingType),
                    const Divider(
                      height: 25,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    const Text(
                      'Second Stage: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    for (int j = 0;
                        j <
                            dataForTable![i]
                                .rocket!
                                .secondStage!
                                .payloads!
                                .length;
                        j++)
                      Text('Payload ID: ' +
                          dataForTable![i]
                              .rocket!
                              .secondStage!
                              .payloads![j]
                              .payloadId +
                          '  Nationality: ' +
                          dataForTable![i]
                              .rocket!
                              .secondStage!
                              .payloads![j]
                              .nationality),
                  ],
                ),
              ),
            );

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );
          }))
      .toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      dataForTable!.sort((tempA, tempB) =>
          compareString(ascending, tempA.missionName, tempB.missionName));
    } else if (columnIndex == 1) {
      dataForTable!.sort((tempA, tempB) =>
          compareDate(ascending, tempA.launchDateUtc, tempB.launchDateUtc));
    }
    setState(() {
      if (columnIndex < 2) {
        this.sortColumnIndex = columnIndex;
        this.isAscending = ascending;
      }
    });
  }

  // String comparison
  int compareString(bool ascending, String valueA, String valueB) {
    return (ascending ? valueA.compareTo(valueB) : valueB.compareTo(valueA));
  }

  int compareDate(bool ascending, DateTime? valueA, DateTime? valueB) {
    return (ascending
        ? valueA!.compareTo(valueB!)
        : valueB!.compareTo(valueA!));
  }
}
