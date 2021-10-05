import 'package:flutter/material.dart';
import 'package:spacex/services/api_connect.dart';
import 'package:spacex/services/lanch.dart';

import 'table_screen.dart';


class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<Lanches>? spaceXData;
  @override
  // Fetch data when loading the screen.
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    APIConnection apiConnection = APIConnection();
    await apiConnection.getApiData();
    spaceXData = apiConnection.lanchesData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // child: SpinKitDoubleBounce(
          //   color: Colors.white,
          //   size: 100.0,
          // ),
          child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TableScreen(
                  tableData: spaceXData,
                );
              },
            ),
          );
        },
        child: Text('Get SpaceX data'),
      )),
    );
  }
}
