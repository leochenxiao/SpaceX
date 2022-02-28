# spacex

## A Flutter project which can display SpaceX launches data.



Include a LoadingScreen page, a DataTable page and a simple dialog window pop up inside DataTable page.


### Pages/
Loading Screen: 
1. gathering API Data via service/api_connect.dart
2. JSON parsing via service/lanch.dart
3. Loading data during inistate

Table Screen: 
1. Retrive data
2. Data Sorting
3. Data Display

### Service/
API Connect:  
1. Loading API data
2. Pass data into Loading Screen

Lanches: Parse JSON data into Dart.Object

### Widget/
scrollable widget: create a scroll wideget template


Assumption: 
The data sorting algorithm is basically brute-force, can be improved. \
The nested data from API can stored in SQLite or other types of database, so that data will be easy to be manipulated by SQL language with complex retrieve requirement such as group by, trigger, union and etc..
