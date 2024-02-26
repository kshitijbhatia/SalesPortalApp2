import 'package:flutter/material.dart';
import 'package:sales_portal_app/edit%20page/edit_page.dart';
import 'package:sales_portal_app/resources/column_data.dart';
import 'package:sales_portal_app/resources/sales_data.dart';

class TableContent extends StatefulWidget {
  const TableContent(
      {required this.showToast,
      required this.dataScrollController,
      required this.changeEditIcon,
      required this.columnWidths,
      required this.data,
      super.key});

  final List<Sales> data;
  final List<Map<String, dynamic>> columnWidths;
  final bool changeEditIcon;
  final ScrollController? dataScrollController;
  final Function(String) showToast;

  @override
  State<TableContent> createState() => _TableContentState();
}

class _TableContentState extends State<TableContent> {
  void editData(Sales sales) {
    for (var i = 0; i < widget.data.length; i++) {
      if (widget.data[i].DealerCode.toString() == sales.DealerCode.toString()) {
        setState(() {
          widget.data[i] = sales;
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String dealerCodeString = 'Dealer Code';

    TextSpan span =
        TextSpan(text: dealerCodeString, style: const TextStyle(fontSize: 14));
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    double dealerCodeWidth = tp.width + 30;

    return SingleChildScrollView(
      child: Row(
        children: [
          DataTable(
            horizontalMargin: 0,
            dataRowHeight: 60,
            columnSpacing: 0,
            border: const TableBorder(
              right: BorderSide(color: Colors.black, width: 2),
              bottom: BorderSide(color: Colors.black, width: 2),
            ),
            columns: [
              if (widget.changeEditIcon)
                const DataColumn(
                  label: SizedBox(
                    width: 40,
                    child: Text(''),
                  ),
                ),
              const DataColumn(
                label: SizedBox(
                  width: 70,
                  child: Text(
                    'Dealer Code',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
            rows: widget.data.map(
              (e) {
                return DataRow(
                  cells: [
                    if (widget.changeEditIcon)
                      DataCell(
                        GestureDetector(
                          onTap: () {
                            late Sales editObject;
                            for (var i = 0; i < widget.data.length; i++) {
                              if (widget.data[i].DealerCode == e.DealerCode) {
                                editObject = widget.data[i];
                                break;
                              }
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPage(
                                  initialData: editObject,
                                  editData: editData,
                                ),
                              ),
                            ).then((value) {
                              if (value == 'failure') {
                                widget.showToast(
                                    'Failed to edit data, please try again later');
                              }
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: BorderDirectional(
                                bottom: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: const Center(
                              child: Icon(Icons.circle_outlined),
                            ),
                          ),
                        ),
                      ),
                    DataCell(
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        width: dealerCodeWidth,
                        child: Center(
                          child: Text(
                            '${e.DealerCode}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: widget.dataScrollController,
              child: DataTable(
                columnSpacing: 0,
                horizontalMargin: 0,
                border: const TableBorder(
                  right: BorderSide(color: Colors.black, width: 2),
                  bottom: BorderSide(color: Colors.black, width: 2),
                ),
                dataRowHeight: 60,
                columns: columnHeader.map(
                  (e) {
                    return DataColumn(
                      label: SizedBox(
                        // width: 160,
                        child: Text(
                          e['columnName'],
                          style: const TextStyle(
                              fontFamily: 'Roboto', color: Colors.black),
                        ),
                      ),
                    );
                  },
                ).toList(),
                rows: List.generate(
                  widget.data.length,
                  (index) {
                    return DataRow(
                        cells: widget.columnWidths.map((e) {
                      String columnName = e['columnName'].replaceAll(' ', '');
                      dynamic value = widget.data[index].toJson()[columnName];
                      return DataCell(
                        Container(
                          width: e['width'],
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(color: Colors.black),
                                bottom: BorderSide(color: Colors.black)),
                          ),
                          child: Center(
                            child: Text(
                              '$value',
                              style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      );
                    }).toList());
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
