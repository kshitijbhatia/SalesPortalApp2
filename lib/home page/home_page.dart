import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:sales_portal_app/add%20page/add_page.dart';
import 'package:sales_portal_app/home%20page/loading_dialog_box.dart';
import 'package:sales_portal_app/resources/api_service.dart';
import 'package:sales_portal_app/resources/column_data.dart';
import 'package:sales_portal_app/resources/sales_data.dart';
import 'package:sales_portal_app/home%20page/table_content.dart';
import 'package:sales_portal_app/home%20page/table_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Sales> data = [];
  late List<Sales> dataCopy = [];

  bool isLoading = true;

  late FToast fToast;

  APIService apiservice = APIService.instance;

  LinkedScrollControllerGroup controllerGroup = LinkedScrollControllerGroup();
  ScrollController? headerScrollController;
  ScrollController? dataScrollController;
  final TextEditingController searchInputController = TextEditingController();

  bool changeEditIcon = false;
  bool changeSearchIcon = false;

  List<Map<String, dynamic>> columnWidths = [];

  void getColumnSize() {
    for (var header in columnHeader) {
      String columnName = header['columnName'];
      TextSpan span =
          TextSpan(text: columnName, style: const TextStyle(fontSize: 16));
      TextPainter tp =
          TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();
      double textWidth = tp.width + 50;
      columnWidths.add({'columnName': columnName, 'width': textWidth});
    }
  }

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
        var columnName = columnHeader[j]['columnName'].replaceAll(' ', '');
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

  @override
  void initState() {
    super.initState();
    apiservice.fetchData().then((salesData) {
      setState(() {
        data = salesData;
        dataCopy = data;
        isLoading = false;
      });
    });
    headerScrollController = controllerGroup.addAndGet();
    dataScrollController = controllerGroup.addAndGet();
    getColumnSize();
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 30),
                            child: const Image(
                              image: AssetImage('assets/TVS-Footer.png'),
                              width: 140,
                            ),
                          ),
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
                    child: Stack(
                      children: [
                        TableContent(
                          data: data,
                          columnWidths: columnWidths,
                          changeEditIcon: changeEditIcon,
                          dataScrollController: dataScrollController,
                          showToast: showToast,
                        ),
                        TableHeader(
                          changeEditIcon: changeEditIcon,
                          headerScrollController: headerScrollController,
                          columnWidths: columnWidths,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(24, 56, 131, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              changeEditIcon = !changeEditIcon;
                            });
                          },
                          icon: changeEditIcon
                              ? const Icon(Icons.close)
                              : const Icon(Icons.edit),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddPage(
                                  listSales: data,
                                ),
                              ),
                            ).then((value) {
                              if (value == 'failure') {
                                showToast(
                                    'Failed to add Data, please try later!!');
                              } else {
                                setState(() {
                                  data.add(value);
                                });
                              }
                            });
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (changeSearchIcon == false) {
                                changeSearchIcon = true;
                              } else {
                                setState(() {
                                  data = dataCopy;
                                });
                                changeSearchIcon = false;
                              }
                            });
                          },
                          icon: changeSearchIcon
                              ? const Icon(Icons.close)
                              : const Icon(Icons.search),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
