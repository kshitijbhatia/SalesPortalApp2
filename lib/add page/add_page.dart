// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_portal_app_2/add%20page/add_sub_page.dart';
import 'package:sales_portal_app_2/resources/api_service.dart';
import 'package:sales_portal_app_2/model/column_data.dart';
import 'package:sales_portal_app_2/model/sales_data.dart';

class AddPage extends StatefulWidget {
  const AddPage({required this.listSales, super.key});

  final List<Sales> listSales;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int currentPage = 1;
  List<TextEditingController> controllers = [];

  late FToast fToast;

  List<Map<String, dynamic>> dealerHeaderList = [];

  int counter = 0;
  APIService apiservice = APIService.instance;

  final TextEditingController _dealerCodeController = TextEditingController();
  final TextEditingController _dealerNameController = TextEditingController();
  final TextEditingController _dealerEmailAddressController =
      TextEditingController();
  final TextEditingController _dealerContactNumberController =
      TextEditingController();
  final TextEditingController _tmRoleController = TextEditingController();
  final TextEditingController _tmNameController = TextEditingController();
  final TextEditingController _tmEmailAddressController =
      TextEditingController();
  final TextEditingController _tmPhoneNumberController =
      TextEditingController();
  final TextEditingController _tmUserNameController = TextEditingController();
  final TextEditingController _amRoleController = TextEditingController();
  final TextEditingController _amNameController = TextEditingController();
  final TextEditingController _amEmailAddressController =
      TextEditingController();
  final TextEditingController _amPhoneNumberController =
      TextEditingController();
  final TextEditingController _amUserNameController = TextEditingController();
  final TextEditingController _nsmRoleController = TextEditingController();
  final TextEditingController _nsmNameController = TextEditingController();
  final TextEditingController _nsmEmailAddressController =
      TextEditingController();
  final TextEditingController _nsmPhoneNumberController =
      TextEditingController();
  final TextEditingController _nsmUserNameController = TextEditingController();
  final TextEditingController _nsm1NameController = TextEditingController();
  final TextEditingController _nsm1EmailAddressController =
      TextEditingController();
  final TextEditingController _nsm1PhoneNumberController =
      TextEditingController();
  final TextEditingController _nsm1UserNameController = TextEditingController();
  final TextEditingController _vpRoleController = TextEditingController();
  final TextEditingController _vpNameController = TextEditingController();
  final TextEditingController _vpEmailAddressController =
      TextEditingController();
  final TextEditingController _vpPhoneNumberController =
      TextEditingController();
  final TextEditingController _vpUserNameController = TextEditingController();
  final TextEditingController _vp1NameController = TextEditingController();
  final TextEditingController _vp1EmailAddressController =
      TextEditingController();
  final TextEditingController _vp1PhoneNumberController =
      TextEditingController();
  final TextEditingController _vp1UserNameController = TextEditingController();
  final TextEditingController _vp2NameController = TextEditingController();
  final TextEditingController _vp2EmailAddressController =
      TextEditingController();
  final TextEditingController _vp2PhoneNumberController =
      TextEditingController();
  final TextEditingController _vp2UserNameController = TextEditingController();
  final TextEditingController _hoRoleController = TextEditingController();
  final TextEditingController _hoNameController = TextEditingController();
  final TextEditingController _hoEmailAddressController =
      TextEditingController();
  final TextEditingController _hoPhoneNumberController =
      TextEditingController();
  final TextEditingController _hoUserNameController = TextEditingController();

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

  void addData() async {
    Map<String, dynamic> response = await apiservice.sendData(controllers);
    if (response['msg'] == 'success') {
      Sales sales = response['data'];
      Navigator.pop(context, {'msg': 'success', 'data': sales});
      return;
    } else if (response['msg'] == 'error' || response['msg'] == 'failure') {
      counter++;
      if (counter == 2) {
        Navigator.pop(context, {'msg': "failure"});
        return;
      }
      showToast('Failed to add Data, please try again');
    }
  }

  void updatePageBackward() {
    setState(() {
      currentPage = currentPage - 1;
    });
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
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
  }

  void showToast(String text) {
    return fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.only(bottom: 40),
        decoration: BoxDecoration(
          color: const Color(0xFF23252A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1.0),
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

    dealerHeaderList = List.from(columnHeader.sublist(0, 3));
    dealerHeaderList.insert(
      0,
      {'columnName': 'Dealer Code', 'required': true, 'error': null},
    );

    return Scaffold(
      body: SafeArea(
        child: currentPage == 1
            ? AddSubPage(
                controllers: controllers.sublist(0, 4),
                updatePageForward: updatePageForward,
                columnHeaders: dealerHeaderList,
                updatePageBackward: () {
                  Navigator.pop(context);
                },
                height: 500,
                data: widget.listSales,
                currentPage: 1,
              )
            : currentPage == 2
                ? AddSubPage(
                    controllers: controllers.sublist(4, 9),
                    updatePageForward: updatePageForward,
                    columnHeaders: columnHeader.sublist(3, 8),
                    updatePageBackward: updatePageBackward,
                    height: 500,
                    data: widget.listSales,
                    currentPage: 2,
                  )
                : currentPage == 3
                    ? AddSubPage(
                        controllers: controllers.sublist(9, 14),
                        updatePageForward: updatePageForward,
                        columnHeaders: columnHeader.sublist(8, 13),
                        updatePageBackward: updatePageBackward,
                        height: 500,
                        data: widget.listSales,
                        currentPage: 3,
                      )
                    : currentPage == 4
                        ? AddSubPage(
                            controllers: controllers.sublist(14, 19),
                            updatePageForward: updatePageForward,
                            columnHeaders: columnHeader.sublist(13, 18),
                            updatePageBackward: updatePageBackward,
                            height: 500,
                            data: widget.listSales,
                            currentPage: 4,
                          )
                        : currentPage == 5
                            ? AddSubPage(
                                controllers: controllers.sublist(19, 23),
                                updatePageForward: updatePageForward,
                                columnHeaders: columnHeader.sublist(18, 22),
                                updatePageBackward: updatePageBackward,
                                height: 500,
                                data: widget.listSales,
                                currentPage: 5,
                              )
                            : currentPage == 6
                                ? AddSubPage(
                                    controllers: controllers.sublist(23, 28),
                                    updatePageForward: updatePageForward,
                                    columnHeaders: columnHeader.sublist(22, 27),
                                    updatePageBackward: updatePageBackward,
                                    height: 500,
                                    data: widget.listSales,
                                    currentPage: 6,
                                  )
                                : currentPage == 7
                                    ? AddSubPage(
                                        controllers:
                                            controllers.sublist(28, 32),
                                        updatePageForward: updatePageForward,
                                        columnHeaders:
                                            columnHeader.sublist(27, 31),
                                        updatePageBackward: updatePageBackward,
                                        height: 500,
                                        data: widget.listSales,
                                        currentPage: 7,
                                      )
                                    : currentPage == 8
                                        ? AddSubPage(
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
                                            currentPage: 8,
                                          )
                                        : currentPage == 9
                                            ? AddSubPage(
                                                controllers:
                                                    controllers.sublist(36, 41),
                                                updatePageForward: addData,
                                                columnHeaders: columnHeader
                                                    .sublist(35, 40),
                                                updatePageBackward:
                                                    updatePageBackward,
                                                height: 500,
                                                data: widget.listSales,
                                                currentPage: 9,
                                              )
                                            : Container(),
      ),
    );
  }
}
