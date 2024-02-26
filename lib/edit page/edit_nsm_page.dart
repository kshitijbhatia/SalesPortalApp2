import 'package:flutter/material.dart';
import 'package:sales_portal_app/edit%20page/edit_page_input.dart';

class EditNSMPage extends StatefulWidget {
  const EditNSMPage(
      {required this.nsmRoleController,
      required this.nsmNameController,
      required this.nsmEmailAddressController,
      required this.nsmContactNumberController,
      required this.nsmUserNameController,
      required this.updatePageForward,
      required this.updatePageBackward,
      required this.showToast,
      super.key});

  final TextEditingController nsmRoleController;
  final TextEditingController nsmNameController;
  final TextEditingController nsmEmailAddressController;
  final TextEditingController nsmContactNumberController;
  final TextEditingController nsmUserNameController;
  final Function() updatePageForward;
  final Function() updatePageBackward;
  final Function(String) showToast;

  @override
  State<EditNSMPage> createState() => _EditNSMPageState();
}

class _EditNSMPageState extends State<EditNSMPage> {

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
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                const Expanded(
                  child: Text(
                    'Edit Details',
                    style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
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
                text: 'NSM Role',
                controller: widget.nsmRoleController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'NSM Name',
                controller: widget.nsmNameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'NSM Email Address',
                controller: widget.nsmEmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'NSM Contact Number *',
                controller: widget.nsmContactNumberController,
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'NSM UserName',
                controller: widget.nsmUserNameController,
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
              onPressed: () {
                if (widget.nsmContactNumberController.text == '') {
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
