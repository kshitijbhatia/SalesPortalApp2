import 'package:flutter/material.dart';
import 'package:sales_portal_app/edit%20page/edit_page_input.dart';

class EditNSM1Page extends StatefulWidget {
  const EditNSM1Page(
      {required this.nsm1NameController,
      required this.nsm1EmailAddressController,
      required this.nsm1ContactNumberController,
      required this.nsm1UserNameController,
      required this.updatePageForward,
      required this.updatePageBackward,
      required this.showToast,
      super.key});

  final TextEditingController nsm1NameController;
  final TextEditingController nsm1EmailAddressController;
  final TextEditingController nsm1ContactNumberController;
  final TextEditingController nsm1UserNameController;
  final Function() updatePageForward;
  final Function() updatePageBackward;
  final Function(String) showToast;

  @override
  State<EditNSM1Page> createState() => _EditNSM1PageState();
}

class _EditNSM1PageState extends State<EditNSM1Page> {

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
                text: 'NSM1 Name',
                controller: widget.nsm1NameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'NSM1 Email Address',
                controller: widget.nsm1EmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'NSM1 Contact Number *',
                controller: widget.nsm1ContactNumberController,
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'NSM1 UserName',
                controller: widget.nsm1UserNameController,
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
                if (widget.nsm1ContactNumberController.text == '') {
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
