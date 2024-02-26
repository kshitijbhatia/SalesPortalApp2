import 'package:flutter/material.dart';
import 'package:sales_portal_app/edit%20page/edit_page_input.dart';

class EditVP1Page extends StatefulWidget {
  const EditVP1Page(
      {required this.vp1NameController,
      required this.vp1EmailAddressController,
      required this.vp1ContactNumberController,
      required this.vp1UserNameController,
      required this.updatePageForward,
      required this.updatePageBackward,
      required this.showToast,
      super.key}
      );

  final TextEditingController vp1NameController;
  final TextEditingController vp1EmailAddressController;
  final TextEditingController vp1ContactNumberController;
  final TextEditingController vp1UserNameController;
  final Function() updatePageForward;
  final Function() updatePageBackward;
  final Function(String) showToast;

  @override
  State<EditVP1Page> createState() => _EditVP1PageState();
}

class _EditVP1PageState extends State<EditVP1Page> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(24, 56, 131, 1),
            height: 100,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    widget.updatePageBackward();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 10), 
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                ),
                const SizedBox(width: 40,),
                const Expanded(
                  child: Text(
                    'Edit Details',
                    style:
                        TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
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
                text: 'VP1 Name',
                controller: widget.vp1NameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'VP1 Email Address',
                controller: widget.vp1EmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'VP1 Contact Number *',
                controller: widget.vp1ContactNumberController,
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'VP1 UserName',
                controller: widget.vp1UserNameController,
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
                if(widget.vp1ContactNumberController.text == ''){
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
