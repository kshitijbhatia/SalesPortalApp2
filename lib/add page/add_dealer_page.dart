import 'package:flutter/material.dart';
import 'package:sales_portal_app/add%20page/add_page_input.dart';
import 'package:sales_portal_app/resources/sales_data.dart';

class AddDealerPage extends StatefulWidget {
  const AddDealerPage(
      {required this.data,
      required this.dealerCodeController,
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
  final List<Sales> data;
  final Function(String) showToast;

  @override
  State<AddDealerPage> createState() => _AddDealerPageState();
}

class _AddDealerPageState extends State<AddDealerPage> {
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
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                const Text(
                  'Add Details',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 44,
                      fontWeight: FontWeight.bold),
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
                text: 'Enter Dealer Code *',
                controller: widget.dealerCodeController,
                type: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter Dealer Name *',
                controller: widget.dealerNameController,
                type: TextInputType.text,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter Dealer Email Address *',
                controller: widget.dealerEmailAddressController,
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              InputField(
                text: 'Enter Dealer Contact Number *',
                controller: widget.dealerContactNumberController,
                type: TextInputType.number,
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
                for (var i = 0; i < widget.data.length; i++) {
                  if (widget.data[i].DealerCode.toString() ==
                      widget.dealerCodeController.text) {
                    widget.showToast('Dealer Code Already Exists!!');
                    return;
                  }
                }
                if (widget.dealerCodeController.text == '' ||
                    widget.dealerContactNumberController.text == '' ||
                    widget.dealerNameController.text == '' ||
                    widget.dealerEmailAddressController.text == '') {
                  widget.showToast('Please Enter the required fields');
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
