import 'package:flutter/material.dart';
import 'package:sales_portal_app/add%20page/add_page_input.dart';

class AddVPPage extends StatefulWidget {
  const AddVPPage(
      {required this.vpRoleController,
      required this.vpNameController,
      required this.vpEmailAddressController,
      required this.vpContactNumberController,
      required this.vpUserNameController,
      required this.updatePageForward,
      required this.updatePageBackward,
      required this.showToast,
      super.key}
      );

  final TextEditingController vpRoleController;
  final TextEditingController vpNameController;
  final TextEditingController vpEmailAddressController;
  final TextEditingController vpContactNumberController;
  final TextEditingController vpUserNameController;
  final Function() updatePageForward;
  final Function() updatePageBackward;
  final Function(String) showToast;

  @override
  State<AddVPPage> createState() => _AddVPPageState();
}

class _AddVPPageState extends State<AddVPPage> {

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
                const SizedBox(width: 40,),
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
                text: 'Enter VP Role',
                controller: widget.vpRoleController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter VP Name',
                controller: widget.vpNameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter VP Email Address',
                controller: widget.vpEmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter VP Contact Number *',
                controller: widget.vpContactNumberController,
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter VP UserName',
                controller: widget.vpUserNameController,
                type: TextInputType.text,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, right: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(24, 56, 131, 1)),
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
                if(widget.vpContactNumberController.text == ''){
                  widget.showToast('Please enter the required fields');
                  return;
                }
                widget.updatePageForward();
              },
              child: const Text(
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
