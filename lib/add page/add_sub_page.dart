import 'package:flutter/material.dart';
import 'package:sales_portal_app_2/add%20page/add_page_input.dart';
import 'package:sales_portal_app_2/model/sales_data.dart';
import 'package:sales_portal_app_2/resources/textfield_validation.dart';

class AddSubPage extends StatefulWidget {
  const AddSubPage(
      {required this.columnHeaders,
      required this.updatePageForward,
      required this.updatePageBackward,
      required this.controllers,
      required this.height,
      required this.data,
      required this.currentPage,
      super.key});

  final List<TextEditingController> controllers;
  final void Function() updatePageForward;
  final void Function() updatePageBackward;
  final List<Map<String, dynamic>> columnHeaders;
  final double height;
  final List<Sales> data;
  final int currentPage;

  @override
  State<AddSubPage> createState() => _AddSubPageState();
}

class _AddSubPageState extends State<AddSubPage> {
  bool checkControllers(List<TextEditingController> controllers) {
    for (var i = 0; i < widget.columnHeaders.length; i++) {
      if (widget.columnHeaders[i]['error'] != null) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: const Color.fromRGBO(24, 56, 131, 1),
            width: double.infinity,
            height: 100,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    widget.updatePageBackward();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 10),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                const Text(
                  'Add Details',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: widget.height,
            child: ListView.builder(
              itemCount: widget.controllers.length,
              itemBuilder: (context, index) {
                return InputField(
                  type: TextInputType.text,
                  text: widget.columnHeaders[index]['required']
                      ? 'Enter ${widget.columnHeaders[index]['columnName']} *'
                      : 'Enter ${widget.columnHeaders[index]['columnName']}',
                  controller: widget.controllers[index],
                  errorText: widget.columnHeaders[index]['error'],
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(24, 56, 131, 1)),
                elevation: const MaterialStatePropertyAll(20),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
              onPressed: () {
                // Checking for required fields
                for (var i = 0; i < widget.columnHeaders.length; i++) {
                  if (widget.columnHeaders[i]['required'] &&
                      widget.controllers[i].text == '') {
                    setState(() {
                      widget.columnHeaders[i]['error'] =
                          'Please fill the required fields';
                    });
                  } else if (widget.columnHeaders[i]['required'] &&
                      widget.controllers[i].text != '') {
                    setState(() {
                      widget.columnHeaders[i]['error'] = null;
                    });
                  } else if (!widget.columnHeaders[i]['required'] &&
                      widget.controllers[i].text == '') {
                    setState(() {
                      widget.columnHeaders[i]['error'] = null;
                    });
                  }
                }

                if (checkControllers(widget.controllers)) {
                  return;
                }

                for (var i = 0; i < widget.columnHeaders.length; i++) {
                  String column = widget.columnHeaders[i]['columnName'];
                  if (column.contains('Email')) {
                    if (widget.controllers[i].text == '') {
                      widget.columnHeaders[i]['error'] = null;
                    } else {
                      setState(() {
                        widget.columnHeaders[i]['error'] =
                            emailValidation(widget.controllers[i].text);
                      });
                    }
                  }
                  if (column.contains('Number')) {
                    if (widget.controllers[i].text == '') {
                      widget.columnHeaders[i]['error'] = null;
                    } else {
                      setState(() {
                        widget.columnHeaders[i]['error'] =
                            numberValidation(widget.controllers[i].text);
                      });
                    }
                  }
                }

                if (checkControllers(widget.controllers)) {
                  return;
                }

                for (var i = 0; i < widget.columnHeaders.length; i++) {
                  String column = widget.columnHeaders[i]['columnName'];

                  if (column.contains('Dealer Code') ||
                      column.contains('Dealer Name') ||
                      column.contains('Dealer Email Address') ||
                      column.contains('Dealer Contact Number')) {
                    for (var j = 0; j < widget.data.length; j++) {
                      if (widget.data[j].DealerCode.toString() ==
                          widget.controllers[i].text) {
                        setState(() {
                          widget.columnHeaders[i]['error'] =
                              'Dealer Code Already Exists';
                        });
                        break;
                      } else if (widget.data[j].DealerEmailAddress ==
                          widget.controllers[i].text) {
                        setState(() {
                          widget.columnHeaders[i]['error'] =
                              'Dealer Email Address Already Exists';
                        });
                        break;
                      } else if (widget.data[j].DealerName ==
                          widget.controllers[i].text) {
                        setState(() {
                          widget.columnHeaders[i]['error'] =
                              'Dealer Name Already Exists';
                        });
                        break;
                      } else if (widget.data[j].DealerContactNumber
                              .toString() ==
                          widget.controllers[i].text) {
                        setState(() {
                          widget.columnHeaders[i]['error'] =
                              'Dealer Phone Number Already Exists';
                        });
                        break;
                      } else {
                        widget.columnHeaders[i]['error'] = null;
                      }
                    }
                  }
                }

                if (checkControllers(widget.controllers)) {
                  return;
                }

                widget.updatePageForward();
              },
              child: widget.currentPage == 9
                  ? const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  : const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
