// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_portal_app_2/edit%20page/edit_sub_page.dart';
import 'package:sales_portal_app_2/resources/api_service.dart';
import 'package:sales_portal_app_2/model/column_data.dart';
import 'package:sales_portal_app_2/model/sales_data.dart';

class EditPage extends StatefulWidget {
  const EditPage(
      {required this.listSales, required this.initialData, super.key});

  final Sales initialData;
  final List<Sales> listSales;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  int currentPage = 1;
  List<TextEditingController> controllers = [];

  late FToast fToast;
  int counter = 0;
  List<Map<String, dynamic>> dealerHeaderList = [];

  APIService apiservice = APIService.instance;

  late final TextEditingController _dealerCodeController;
  late final TextEditingController _dealerNameController;
  late final TextEditingController _dealerEmailAddressController;
  late final TextEditingController _dealerContactNumberController;
  late final TextEditingController _tmRoleController;
  late final TextEditingController _tmNameController;
  late final TextEditingController _tmEmailAddressController;
  late final TextEditingController _tmPhoneNumberController;
  late final TextEditingController _tmUserNameController;
  late final TextEditingController _amRoleController;
  late final TextEditingController _amNameController;
  late final TextEditingController _amEmailAddressController;
  late final TextEditingController _amPhoneNumberController;
  late final TextEditingController _amUserNameController;
  late final TextEditingController _nsmRoleController;
  late final TextEditingController _nsmNameController;
  late final TextEditingController _nsmEmailAddressController;
  late final TextEditingController _nsmPhoneNumberController;
  late final TextEditingController _nsmUserNameController;
  late final TextEditingController _nsm1NameController;
  late final TextEditingController _nsm1EmailAddressController;
  late final TextEditingController _nsm1PhoneNumberController;
  late final TextEditingController _nsm1UserNameController;
  late final TextEditingController _vpRoleController;
  late final TextEditingController _vpNameController;
  late final TextEditingController _vpEmailAddressController;
  late final TextEditingController _vpPhoneNumberController;
  late final TextEditingController _vpUserNameController;
  late final TextEditingController _vp1NameController;
  late final TextEditingController _vp1EmailAddressController;
  late final TextEditingController _vp1PhoneNumberController;
  late final TextEditingController _vp1UserNameController;
  late final TextEditingController _vp2NameController;
  late final TextEditingController _vp2EmailAddressController;
  late final TextEditingController _vp2PhoneNumberController;
  late final TextEditingController _vp2UserNameController;
  late final TextEditingController _hoRoleController;
  late final TextEditingController _hoNameController;
  late final TextEditingController _hoEmailAddressController;
  late final TextEditingController _hoPhoneNumberController;
  late final TextEditingController _hoUserNameController;

  @override
  void initState() {
    super.initState();
    _dealerCodeController =
        TextEditingController(text: widget.initialData.DealerCode.toString());
    _dealerNameController =
        TextEditingController(text: widget.initialData.DealerName.toString());
    _dealerEmailAddressController = TextEditingController(
        text: widget.initialData.DealerEmailAddress.toString());
    _dealerContactNumberController = TextEditingController(
        text: widget.initialData.DealerContactNumber.toString());
    _tmRoleController =
        TextEditingController(text: widget.initialData.TMRole.toString());
    _tmNameController =
        TextEditingController(text: widget.initialData.TMName.toString());
    _tmEmailAddressController = TextEditingController(
        text: widget.initialData.TMEmailAddress.toString());
    _tmPhoneNumberController = TextEditingController(
        text: widget.initialData.TMPhoneNumber.toString());
    _tmUserNameController =
        TextEditingController(text: widget.initialData.TMUserName.toString());
    _amRoleController =
        TextEditingController(text: widget.initialData.AMRole.toString());
    _amNameController =
        TextEditingController(text: widget.initialData.AMName.toString());
    _amEmailAddressController = TextEditingController(
        text: widget.initialData.AMEmailAddress.toString());
    _amPhoneNumberController = TextEditingController(
        text: widget.initialData.AMPhoneNumber.toString());
    _amUserNameController =
        TextEditingController(text: widget.initialData.AMUserName.toString());
    _nsmRoleController =
        TextEditingController(text: widget.initialData.NSMRole.toString());
    _nsmNameController =
        TextEditingController(text: widget.initialData.NSMName.toString());
    _nsmEmailAddressController = TextEditingController(
        text: widget.initialData.NSMEmailAddress.toString());
    _nsmPhoneNumberController = TextEditingController(
        text: widget.initialData.NSMPhoneNumber.toString());
    _nsmUserNameController =
        TextEditingController(text: widget.initialData.NSMUserName.toString());
    _nsm1NameController =
        TextEditingController(text: widget.initialData.NSM1Name.toString());
    _nsm1EmailAddressController = TextEditingController(
        text: widget.initialData.NSM1EmailAddress.toString());
    _nsm1PhoneNumberController = TextEditingController(
        text: widget.initialData.NSM1PhoneNumber.toString());
    _nsm1UserNameController =
        TextEditingController(text: widget.initialData.NSM1UserName.toString());
    _vpRoleController =
        TextEditingController(text: widget.initialData.VPRole.toString());
    _vpNameController =
        TextEditingController(text: widget.initialData.VPName.toString());
    _vpEmailAddressController = TextEditingController(
        text: widget.initialData.VPEmailAddress.toString());
    _vpPhoneNumberController = TextEditingController(
        text: widget.initialData.VPPhoneNumber.toString());
    _vpUserNameController =
        TextEditingController(text: widget.initialData.VPUserName.toString());
    _vp1NameController =
        TextEditingController(text: widget.initialData.VP1Name.toString());
    _vp1EmailAddressController = TextEditingController(
        text: widget.initialData.VP1EmailAddress.toString());
    _vp1PhoneNumberController = TextEditingController(
        text: widget.initialData.VP1PhoneNumber.toString());
    _vp1UserNameController =
        TextEditingController(text: widget.initialData.VP1UserName.toString());
    _vp2NameController =
        TextEditingController(text: widget.initialData.VP2Name.toString());
    _vp2EmailAddressController = TextEditingController(
        text: widget.initialData.VP2EmailAddress.toString());
    _vp2PhoneNumberController = TextEditingController(
        text: widget.initialData.VP2PhoneNumber.toString());
    _vp2UserNameController =
        TextEditingController(text: widget.initialData.VP2UserName.toString());
    _hoRoleController =
        TextEditingController(text: widget.initialData.HORole.toString());
    _hoNameController =
        TextEditingController(text: widget.initialData.HOName.toString());
    _hoEmailAddressController = TextEditingController(
        text: widget.initialData.HOEmailAddress.toString());
    _hoPhoneNumberController = TextEditingController(
        text: widget.initialData.HOPhoneNumber.toString());
    _hoUserNameController =
        TextEditingController(text: widget.initialData.HOUserName.toString());
    controllers = [
      _dealerCodeController,
      _dealerNameController,
      _dealerEmailAddressController,
      _dealerContactNumberController,
      _tmRoleController,
      _tmNameController,
      _tmEmailAddressController,
      _tmPhoneNumberController,
      _tmUserNameController,
      _amRoleController,
      _amNameController,
      _amEmailAddressController,
      _amPhoneNumberController,
      _amUserNameController,
      _nsmRoleController,
      _nsmNameController,
      _nsmEmailAddressController,
      _nsmPhoneNumberController,
      _nsmUserNameController,
      _nsm1NameController,
      _nsm1EmailAddressController,
      _nsm1PhoneNumberController,
      _nsm1UserNameController,
      _vpRoleController,
      _vpNameController,
      _vpEmailAddressController,
      _vpPhoneNumberController,
      _vpUserNameController,
      _vp1NameController,
      _vp1EmailAddressController,
      _vp1PhoneNumberController,
      _vp1UserNameController,
      _vp2NameController,
      _vp2EmailAddressController,
      _vp2PhoneNumberController,
      _vp2UserNameController,
      _hoRoleController,
      _hoNameController,
      _hoEmailAddressController,
      _hoPhoneNumberController,
      _hoUserNameController,
    ];
    fToast = FToast();
    fToast.init(context);
  }

  @override
  void dispose() {
    _dealerCodeController.dispose();
    _dealerNameController.dispose();
    _dealerEmailAddressController.dispose();
    _dealerContactNumberController.dispose();
    _tmRoleController.dispose();
    _tmNameController.dispose();
    _tmEmailAddressController.dispose();
    _tmPhoneNumberController.dispose();
    _tmUserNameController.dispose();
    _amRoleController.dispose();
    _amNameController.dispose();
    _amEmailAddressController.dispose();
    _amPhoneNumberController.dispose();
    _amUserNameController.dispose();
    _nsmRoleController.dispose();
    _nsmNameController.dispose();
    _nsmEmailAddressController.dispose();
    _nsmPhoneNumberController.dispose();
    _nsmUserNameController.dispose();
    _nsm1NameController.dispose();
    _nsm1EmailAddressController.dispose();
    _nsm1PhoneNumberController.dispose();
    _nsm1UserNameController.dispose();
    _vpRoleController.dispose();
    _vpNameController.dispose();
    _vpEmailAddressController.dispose();
    _vpPhoneNumberController.dispose();
    _vpUserNameController.dispose();
    _vp1NameController.dispose();
    _vp1EmailAddressController.dispose();
    _vp1PhoneNumberController.dispose();
    _vp1UserNameController.dispose();
    _vp2NameController.dispose();
    _vp2EmailAddressController.dispose();
    _vp2PhoneNumberController.dispose();
    _vp2UserNameController.dispose();
    _hoRoleController.dispose();
    _hoNameController.dispose();
    _hoEmailAddressController.dispose();
    _hoPhoneNumberController.dispose();
    _hoUserNameController.dispose();
    super.dispose();
  }

  void updatePageForward() {
    setState(() {
      currentPage = currentPage + 1;
    });
  }

  void updatePageBackward() {
    setState(() {
      currentPage = currentPage - 1;
    });
  }

  void editData() async {

    Map<String, dynamic> response = await apiservice.editData(controllers);
    log('$response');
    // Success
    if (response['msg'] == 'success') {
      Navigator.pop(context, {'msg' : "success", 'data' : response['data']});
    }
    // Failure
    else if (response['msg'] == 'error' || response['msg'] == 'failure') {
      counter++;
      if (counter == 2) {
        Navigator.pop(context, {'msg' : "failure"});
        return;
      }
      showToast('Failed to add Data, please try again');
    }
  }

  void showToast(String text) {
    return fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(24, 56, 131, 1),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.red,
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < columnHeader.length; i++) {
      columnHeader[i]['error'] = null;
    }

    return Scaffold(
      body: SafeArea(
        child: currentPage == 1
            ? EditSubPage(
                controllers: controllers.sublist(1, 4),
                updatePageForward: updatePageForward,
                columnHeaders: columnHeader.sublist(0,3),
                updatePageBackward: () {
                  Navigator.pop(context);
                },
                height: 500,
                data: widget.listSales,
                currentPage: 1,
                dealerCode: widget.initialData.DealerCode.toString(),
              )
            : currentPage == 2
                ? EditSubPage(
                    controllers: controllers.sublist(4, 9),
                    updatePageForward: updatePageForward,
                    columnHeaders: columnHeader.sublist(3, 8),
                    updatePageBackward: updatePageBackward,
                    height: 500,
                    data: widget.listSales,
                    currentPage: 2,dealerCode: widget.initialData.DealerCode.toString(),
                  )
                : currentPage == 3
                    ? EditSubPage(
                        controllers: controllers.sublist(9, 14),
                        updatePageForward: updatePageForward,
                        columnHeaders: columnHeader.sublist(8, 13),
                        updatePageBackward: updatePageBackward,
                        height: 500,
                        data: widget.listSales,
                        currentPage: 3,dealerCode: widget.initialData.DealerCode.toString(),
                      )
                    : currentPage == 4
                        ? EditSubPage(
                            controllers: controllers.sublist(14, 19),
                            updatePageForward: updatePageForward,
                            columnHeaders: columnHeader.sublist(13, 18),
                            updatePageBackward: updatePageBackward,
                            height: 500,
                            data: widget.listSales,
                            currentPage: 4,dealerCode: widget.initialData.DealerCode.toString(),
                          )
                        : currentPage == 5
                            ? EditSubPage(
                                controllers: controllers.sublist(19, 23),
                                updatePageForward: updatePageForward,
                                columnHeaders: columnHeader.sublist(18, 22),
                                updatePageBackward: updatePageBackward,
                                height: 500,
                                data: widget.listSales,
                                currentPage: 5,dealerCode: widget.initialData.DealerCode.toString(),
                              )
                            : currentPage == 6
                                ? EditSubPage(
                                    controllers: controllers.sublist(23, 28),
                                    updatePageForward: updatePageForward,
                                    columnHeaders: columnHeader.sublist(22, 27),
                                    updatePageBackward: updatePageBackward,
                                    height: 500,
                                    data: widget.listSales,
                                    currentPage: 6,dealerCode: widget.initialData.DealerCode.toString(),
                                  )
                                : currentPage == 7
                                    ? EditSubPage(
                                        controllers:
                                            controllers.sublist(28, 32),
                                        updatePageForward: updatePageForward,
                                        columnHeaders:
                                            columnHeader.sublist(27, 31),
                                        updatePageBackward: updatePageBackward,
                                        height: 500,
                                        data: widget.listSales,
                                        currentPage: 7,dealerCode: widget.initialData.DealerCode.toString(),
                                      )
                                    : currentPage == 8
                                        ? EditSubPage(
                                            controllers:
                                                controllers.sublist(32, 36),
                                            updatePageForward:
                                                updatePageForward,
                                            columnHeaders:
                                                columnHeader.sublist(31, 35),
                                            updatePageBackward:
                                                updatePageBackward,
                                            height: 500,
                                            data: widget.listSales,
                                            currentPage: 8,dealerCode: widget.initialData.DealerCode.toString(),
                                          )
                                        : currentPage == 9
                                            ? EditSubPage(
                                                controllers:
                                                    controllers.sublist(36, 41),
                                                updatePageForward: editData,
                                                columnHeaders: columnHeader
                                                    .sublist(35, 40),
                                                updatePageBackward:
                                                    updatePageBackward,
                                                height: 500,
                                                data: widget.listSales,
                                                currentPage: 9,dealerCode: widget.initialData.DealerCode.toString(),
                                              )
                                            : Container(),
      ),
    );
  }
}
