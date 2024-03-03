import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_portal_app_2/add%20page/add_page.dart';
import 'package:sales_portal_app_2/edit%20page/edit_page.dart';
import 'package:sales_portal_app_2/home%20page/drop_down.dart';
import 'package:sales_portal_app_2/home%20page/loading_dialog_box.dart';
import 'package:sales_portal_app_2/resources/api_service.dart';
import 'package:sales_portal_app_2/model/column_data.dart';
import 'package:sales_portal_app_2/model/sales_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Sales> data = [];
  late List<Sales> dataCopy = [];
  Map<String, bool> isExpandedList = {};

  bool isLoading = true;

  late FToast fToast;

  APIService apiservice = APIService.instance;

  final TextEditingController searchInputController = TextEditingController();

  bool changeEditIcon = false;
  bool changeSearchIcon = false;
  // bool isExpanded = false;

  void searchData() {
    Set<Sales> res = {};
    String input = searchInputController.text.toLowerCase().trim();

    if (input == '') {
      return;
    }

    for (var i = 0; i < data.length; i++) {
      var salesObject = data[i].toJson();

      // Search all dealer codes
      if (data[i].DealerCode.toString() == input) {
        res.add(data[i]);
      }

      // Search all other fields
      for (var j = 0; j < columnHeader.length; j++) {
        var columnName = columnHeader[j]['columnName']!.replaceAll(' ', '');
        var searchfield = salesObject[columnName]?.toLowerCase();

        if (searchfield == input) {
          res.add(data[i]);
        }
      }
    }
    setState(() {
      data = res.toList();
    });
  }

  void editData(Sales salesObj, Sales resData) {
    for (var i = 0; i < data.length; i++) {
      if (data[i].DealerCode.toString() == salesObj.DealerCode.toString()) {
        data.removeAt(i);
        setState(() {
          data.add(resData);
        });
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    apiservice.fetchData().then((salesData) {
      for (var salesObj in salesData) {
        isExpandedList[salesObj.DealerCode.toString()] = false;
      }
      setState(() {
        data = salesData;
        dataCopy = data;
        isLoading = false;
      });
    });
    fToast = FToast();
    fToast.init(context);
  }

  @override
  void dispose() {
    super.dispose();
    searchInputController.dispose();
  }

  void showToast(String text) {
    return fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(24, 56, 131, 1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.red,
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(24, 56, 131, 1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(listSales: data),
            ),
          ).then((value) {
            if (value != null) {
              if (value['msg'] == 'failure') {
                showToast('Failed to add data, try again later');
              } else if (value['msg'] == 'success') {
                Sales sales = value['data'];
                setState(() {
                  data.add(sales);
                  isExpandedList.addAll({sales.DealerCode.toString(): false});
                });
              }
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: isLoading
            ? const LoaderDialog()
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: const Color.fromRGBO(24, 56, 131, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 30),
                                child: const Image(
                                  image: AssetImage('assets/TVS-Footer.png'),
                                  width: 160,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    changeSearchIcon = !changeSearchIcon;
                                    data = dataCopy;
                                  });
                                },
                                icon: changeSearchIcon
                                    ? const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                              ),
                            )
                          ],
                        ),
                        if (changeSearchIcon)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 310,
                                height: 60,
                                child: TextField(
                                  controller: searchInputController,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 10, left: 10),
                                    hintText: 'Search Data',
                                    hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    searchData();
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        Sales salesObj = data[index];
                        String dealerCode = salesObj.DealerCode.toString();
                        String dealerEmail = salesObj.DealerEmailAddress == ''
                            ? 'NA'
                            : salesObj.DealerEmailAddress;
                        String dealerNumber =
                            salesObj.DealerContactNumber.toString() == ''
                                ? 'NA'
                                : salesObj.DealerContactNumber.toString();
                        String dealerName = salesObj.DealerName == ''
                            ? 'NA'
                            : salesObj.DealerName;
                        return Card(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 5, left: 5, right: 5),
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // color: Colors.red,
                                      width: 280,
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      margin: const EdgeInsets.only(top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${salesObj.DealerCode} ~ $dealerName',
                                            style: isExpandedList[dealerCode]!
                                                ? const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 22,
                                                  )
                                                : const TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16,
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isExpandedList[
                                        salesObj.DealerCode.toString()]!)
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return EditPage(
                                                    listSales: data,
                                                    initialData: salesObj);
                                              },
                                            ),
                                          ).then((value) {
                                            if (value != null) {
                                              if (value['msg'] == 'failure') {
                                                showToast(
                                                    'Failed to edit data, please try again later');
                                              } else if (value['msg'] ==
                                                  'success') {
                                                Sales resData = value['data'];
                                                editData(salesObj, resData);
                                              }
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.edit),
                                      ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isExpandedList[dealerCode] =
                                              !isExpandedList[dealerCode]!;
                                        });
                                      },
                                      icon: isExpandedList[dealerCode]!
                                          ? const Icon(Icons.arrow_drop_up)
                                          : const Icon(Icons.arrow_drop_down),
                                    )
                                  ],
                                ),
                                if (isExpandedList[dealerCode]!)
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email : $dealerEmail',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'Number : $dealerNumber',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomExpansionTile(
                                          text: 'TM Info',
                                          columnNames:
                                              columnHeader.sublist(3, 8),
                                          salesData: salesObj,
                                          editData: editData,
                                        ),
                                        CustomExpansionTile(
                                          text: 'AM Info',
                                          columnNames:
                                              columnHeader.sublist(8, 13),
                                          salesData: salesObj,
                                          editData: editData,
                                        ),
                                        CustomExpansionTile(
                                          text: 'NSM Info',
                                          columnNames:
                                              columnHeader.sublist(13, 18),
                                          salesData: salesObj,
                                          editData: editData,
                                        ),
                                        CustomExpansionTile(
                                          text: 'NSM1 Info',
                                          columnNames:
                                              columnHeader.sublist(18, 22),
                                          salesData: salesObj,
                                          editData: editData,
                                        ),
                                        CustomExpansionTile(
                                          text: 'VP Info',
                                          columnNames:
                                              columnHeader.sublist(22, 27),
                                          salesData: salesObj,
                                          editData: editData,
                                        ),
                                        CustomExpansionTile(
                                          text: 'VP1 Info',
                                          columnNames:
                                              columnHeader.sublist(27, 31),
                                          salesData: salesObj,
                                          editData: editData,
                                        ),
                                        CustomExpansionTile(
                                          text: 'VP2 Info',
                                          columnNames:
                                              columnHeader.sublist(31, 35),
                                          salesData: salesObj,
                                          editData: editData,
                                        ),
                                        CustomExpansionTile(
                                          text: 'HO Info',
                                          columnNames:
                                              columnHeader.sublist(35, 40),
                                          salesData: salesObj,
                                          editData: editData,
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}


















// Container(
//                                       width: 340,
//                                       padding: const EdgeInsets.only(
//                                           left: 10, top: 5),
//                                       margin: const EdgeInsets.only(top: 5),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Dealer Code : ${salesObj.DealerCode}',
//                                             style: isExpandedList[dealerCode]!
//                                                 ? const TextStyle(
//                                                     color: Colors.black,
//                                                     fontFamily: 'Roboto',
//                                                     fontSize: 22,
//                                                   )
//                                                 : const TextStyle(
//                                                     color: Colors.black,
//                                                     fontFamily: 'Roboto',
//                                                     fontSize: 18,
//                                                   ),
//                                           ),
//                                           Text(
//                                             'Dealer Name : ${salesObj.DealerName}',
//                                             style: const TextStyle(
//                                               color: Colors.black,
//                                               fontFamily: 'Roboto',
//                                               fontSize: 18,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),