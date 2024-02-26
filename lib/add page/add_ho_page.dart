import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sales_portal_app/add%20page/add_page_input.dart';
import 'package:sales_portal_app/resources/api_service.dart';

class AddHOPage extends StatefulWidget {
  const AddHOPage(
      {required this.hoRoleController,
      required this.hoNameController,
      required this.hoEmailAddressController,
      required this.hoContactNumberController,
      required this.hoUserNameController,
      required this.updatePageBackward,
      required this.controllers,
      required this.showToast,
      super.key});

  final TextEditingController hoRoleController;
  final TextEditingController hoNameController;
  final TextEditingController hoEmailAddressController;
  final TextEditingController hoContactNumberController;
  final TextEditingController hoUserNameController;
  final Function() updatePageBackward;
  final List<TextEditingController> controllers;
  final Function(String) showToast;

  @override
  State<AddHOPage> createState() => _AddHOPageState();
}

class _AddHOPageState extends State<AddHOPage> {
  int counter = 0;

  APIService apiservice = APIService.instance;

  @override
  void initState() {
    super.initState();
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
                  width: 40,
                ),
                const Expanded(
                  child: Text(
                    'Add Details',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 44,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              InputField(
                text: 'Enter HO Role',
                controller: widget.hoRoleController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter HO Name',
                controller: widget.hoNameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter HO Email Address',
                controller: widget.hoEmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter HO Contact Number *',
                controller: widget.hoContactNumberController,
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter HO UserName',
                controller: widget.hoUserNameController,
                type: TextInputType.text,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, right: 30),
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
              onPressed: () async {
                // Check if required field is filled
                if (widget.hoContactNumberController.text == '') {
                  widget.showToast('Please enter the required fields');
                  return;
                }
                // Make the API request
                Map<String, dynamic> response =
                    await apiservice.sendData(widget.controllers);
                log('$response');
                if (response['msg'] == 'success') {
                  Navigator.pop(context, response['data']);
                } else if (response['msg'] == 'error' || response['msg'] == 'failure') {
                  counter++;
                  if (counter == 2) {
                    Navigator.pop(context, "failure");
                    return;
                  }
                  widget.showToast('Failed to add Data, please try again');
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
