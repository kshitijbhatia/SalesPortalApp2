import 'package:flutter/material.dart';
import 'package:sales_portal_app/edit%20page/edit_page_input.dart';

class EditAMPage extends StatefulWidget {
  const EditAMPage(
      {required this.amRoleController,
      required this.amNameController,
      required this.amEmailAddressController,
      required this.amContactNumberController,
      required this.amUserNameController,
      required this.updatePageForward,
      required this.updatePageBackward,
      required this.showToast,
      super.key});

  final TextEditingController amRoleController;
  final TextEditingController amNameController;
  final TextEditingController amEmailAddressController;
  final TextEditingController amContactNumberController;
  final TextEditingController amUserNameController;
  final Function() updatePageForward;
  final Function() updatePageBackward;
  final Function(String) showToast;

  @override
  State<EditAMPage> createState() => _EditAMPageState();
}

class _EditAMPageState extends State<EditAMPage> {


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
                text: 'AM Role',
                controller: widget.amRoleController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'AM Name',
                controller: widget.amNameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'AM Email Address',
                controller: widget.amEmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'AM Contact Number *',
                controller: widget.amContactNumberController,
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'AM UserName',
                controller: widget.amUserNameController,
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
                if(widget.amContactNumberController.text == ''){
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
