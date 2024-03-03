import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_portal_app_2/edit%20page/edit_single_page.dart';
import 'package:sales_portal_app_2/model/sales_data.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile(
      {required this.salesData,
      required this.columnNames,
      required this.text,
      required this.editData,
      super.key});

  final String text;
  final List<Map<String, dynamic>> columnNames;
  final Sales salesData;
  final void Function(Sales, Sales) editData; 

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;

  late FToast fToast;

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
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(color: Colors.black),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  widget.text,
                  style: isExpanded
                      ? const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )
                      : const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              if (isExpanded)
                Container(
                  margin: const EdgeInsets.only(left: 150),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditSinglePage(
                            columnNames: widget.columnNames,
                            sales: widget.salesData,
                          ),
                        ),
                      ).then((value) {
                        if (value != null) {
                          if (value['msg'] == 'failure') {
                            showToast(
                                'Failed to edit data, please try again later');
                          } else if (value['msg'] == 'success') {
                            Sales resData = value['data'];
                            widget.editData(widget.salesData, resData);
                          }
                        }
                      });
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                icon: isExpanded
                    ? const Icon(Icons.arrow_drop_up)
                    : const Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
          if (isExpanded)
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.columnNames.map(
                  (columnName) {
                    String? columnHeader = columnName['columnName'];
                    String column = columnHeader!.replaceAll(' ', '');
                    String value = widget.salesData.toJson()[column].toString();
                    if (value == '') {
                      value = 'NA';
                    }
                    var columnHeaderList = columnHeader.split(' ');
                    columnHeader = columnHeaderList[1] == 'Email'
                        ? 'Email'
                        : columnHeaderList[columnHeaderList.length - 1];
                    return Text(
                      '$columnHeader : $value',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
