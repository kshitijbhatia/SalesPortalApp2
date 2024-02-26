import 'package:flutter/material.dart';

class TableHeader extends StatefulWidget{
  const TableHeader({required this.columnWidths ,required this.headerScrollController,required this.changeEditIcon,super.key});

  final bool changeEditIcon; 
  final ScrollController? headerScrollController;
  final List<Map<String, dynamic>> columnWidths;

  @override
  State<TableHeader> createState() => _TableHeaderState();
}

class _TableHeaderState extends State<TableHeader> {
  @override
  Widget build(BuildContext context) {

    String dealerCodeString = 'Dealer Code';
    TextSpan span =
        TextSpan(text: dealerCodeString, style: const TextStyle(fontSize: 14));
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout();
    double dealerCodeWidth = tp.width + 30;

    return Row(
      children: [
        DataTable(
          columnSpacing: 0,
          headingRowColor:
              const MaterialStatePropertyAll(Color.fromRGBO(230, 230, 230, 1)),
          border: const TableBorder(
            right: BorderSide(color: Colors.black, width: 2),
          ),
          horizontalMargin: 0,
          columns: [
            if (widget.changeEditIcon)
              const DataColumn(
                  label: SizedBox(
                width: 40,
                child: Center(
                  child: Text(''),
                ),
              )),
            DataColumn(
              label: Container(
                width: dealerCodeWidth,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Text(
                    'Dealer Code',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
          ],
          rows: const [],
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: widget.headerScrollController,
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 0,
              horizontalMargin: 0,
              headingRowColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(230, 230, 230, 1)),
              border: const TableBorder(
                right: BorderSide(color: Colors.black, width: 1),
              ),
              columns: widget.columnWidths.map(
                (e) {
                  return DataColumn(
                    label: SizedBox(
                      width: e['width'],
                      child: Center(
                        child: Text(
                          e['columnName'],
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
              rows: const [],
            ),
          ),
        )
      ],
    );
  }
}