import 'package:flutter/material.dart';
import 'package:sales_portal_app/edit%20page/edit_page_input.dart';

class EditDealerPage extends StatefulWidget {
  const EditDealerPage(
      {required this.dealerCodeController,
      required this.dealerNameController,
      required this.dealerEmailAddressController,
      required this.dealerContactNumberController,
      required this.updatePage,
      required this.showToast,
      super.key});

  final TextEditingController dealerCodeController;
  final TextEditingController dealerNameController;
  final TextEditingController dealerEmailAddressController;
  final TextEditingController dealerContactNumberController;
  final Function() updatePage;
  final Function(String) showToast;

  @override
  State<EditDealerPage> createState() => _EditDealerPageState();
}

class _EditDealerPageState extends State<EditDealerPage> {

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
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 10),
                    child: Icon(Icons.arrow_back, color: Colors.white,),
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
              Text(
                'Dealer Code : ${widget.dealerCodeController.text}',
                style: const TextStyle(fontFamily: 'Roboto',fontSize: 26, fontWeight: FontWeight.w400, color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Dealer Name',
                controller: widget.dealerNameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Dealer Email Address',
                controller: widget.dealerEmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Dealer Contact Number *',
                controller: widget.dealerContactNumberController,
                type: TextInputType.number,
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
                if(widget.dealerContactNumberController.text == ''){
                  widget.showToast('Please enter the required fields');
                  return;
                }
                widget.updatePage();
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
