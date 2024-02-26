import 'package:flutter/material.dart';
import 'package:sales_portal_app/edit%20page/edit_page_input.dart';

class EditVP2Page extends StatefulWidget {
  const EditVP2Page(
      {required this.vp2NameController,
      required this.vp2EmailAddressController,
      required this.vp2ContactNumberController,
      required this.vp2UserNameController,
      required this.updatePageForward,
      required this.updatePageBackward,
      required this.showToast,
      super.key}
      );

  final TextEditingController vp2NameController;
  final TextEditingController vp2EmailAddressController;
  final TextEditingController vp2ContactNumberController;
  final TextEditingController vp2UserNameController;
  final Function() updatePageForward;
  final Function() updatePageBackward;
  final Function(String) showToast;

  @override
  State<EditVP2Page> createState() => _EditVP2PageState();
}

class _EditVP2PageState extends State<EditVP2Page> {

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
                text: 'VP2 Name',
                controller: widget.vp2NameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'VP2 Email Address',
                controller: widget.vp2EmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'VP2 Contact Number *',
                controller: widget.vp2ContactNumberController,
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'VP2 UserName',
                controller: widget.vp2UserNameController,
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
                if(widget.vp2ContactNumberController.text == ''){
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
