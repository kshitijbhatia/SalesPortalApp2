import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sales_portal_app/add%20page/add_am_page.dart';
import 'package:sales_portal_app/add%20page/add_dealer_page.dart';
import 'package:sales_portal_app/add%20page/add_ho_page.dart';
import 'package:sales_portal_app/add%20page/add_nsm1_page.dart';
import 'package:sales_portal_app/add%20page/add_nsm_page.dart';
import 'package:sales_portal_app/add%20page/add_tm_page.dart';
import 'package:sales_portal_app/add%20page/add_vp1_page.dart';
import 'package:sales_portal_app/add%20page/add_vp2_page.dart';
import 'package:sales_portal_app/add%20page/add_vp_page.dart';
import 'package:sales_portal_app/resources/sales_data.dart';

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
          color: const Color.fromRGBO(24, 56, 131, 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.red, fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: currentPage == 1
            ? AddDealerPage(
                dealerCodeController: _dealerCodeController,
                dealerNameController: _dealerNameController,
                dealerEmailAddressController: _dealerEmailAddressController,
                dealerContactNumberController: _dealerContactNumberController,
                updatePage: updatePageForward,
                data: widget.listSales,
                showToast: showToast,
              )
            : currentPage == 2
                ? AddTMPage(
                    tmRoleController: _tmRoleController,
                    tmNameController: _tmNameController,
                    tmEmailAddressController: _tmEmailAddressController,
                    tmContactNumberController: _tmPhoneNumberController,
                    tmUserNameController: _tmUserNameController,
                    updatePageForward: updatePageForward,
                    updatePageBackward: updatePageBackward,
                    showToast: showToast,
                  )
                : currentPage == 3
                    ? AddAMPage(
                        amRoleController: _amRoleController,
                        amNameController: _amNameController,
                        amEmailAddressController: _amEmailAddressController,
                        amContactNumberController: _amPhoneNumberController,
                        amUserNameController: _amUserNameController,
                        updatePageForward: updatePageForward,
                        updatePageBackward: updatePageBackward,
                        showToast: showToast,
                      )
                    : currentPage == 4
                        ? AddNSMPage(
                            nsmRoleController: _nsmRoleController,
                            nsmNameController: _nsmNameController,
                            nsmEmailAddressController:
                                _nsmEmailAddressController,
                            nsmContactNumberController:
                                _nsmPhoneNumberController,
                            nsmUserNameController: _nsmUserNameController,
                            updatePageForward: updatePageForward,
                            updatePageBackward: updatePageBackward,
                            showToast: showToast,
                          )
                        : currentPage == 5
                            ? AddNSM1Page(
                                nsm1NameController: _nsm1NameController,
                                nsm1EmailAddressController:
                                    _nsm1EmailAddressController,
                                nsm1ContactNumberController:
                                    _nsm1PhoneNumberController,
                                nsm1UserNameController: _nsm1UserNameController,
                                updatePageForward: updatePageForward,
                                updatePageBackward: updatePageBackward,
                                showToast: showToast,
                              )
                            : currentPage == 6
                                ? AddVPPage(
                                    vpRoleController: _vpRoleController,
                                    vpNameController: _vpNameController,
                                    vpEmailAddressController:
                                        _vpEmailAddressController,
                                    vpContactNumberController:
                                        _vpPhoneNumberController,
                                    vpUserNameController: _vpUserNameController,
                                    updatePageForward: updatePageForward,
                                    updatePageBackward: updatePageBackward,
                                    showToast: showToast,
                                  )
                                : currentPage == 7
                                    ? AddVP1Page(
                                        vp1NameController: _vp1NameController,
                                        vp1EmailAddressController:
                                            _vp1EmailAddressController,
                                        vp1ContactNumberController:
                                            _vp1PhoneNumberController,
                                        vp1UserNameController:
                                            _vp1UserNameController,
                                        updatePageForward: updatePageForward,
                                        updatePageBackward: updatePageBackward,
                                        showToast: showToast,
                                      )
                                    : currentPage == 8
                                        ? AddVP2Page(
                                            vp2NameController:
                                                _vp2NameController,
                                            vp2EmailAddressController:
                                                _vp2EmailAddressController,
                                            vp2ContactNumberController:
                                                _vp2PhoneNumberController,
                                            vp2UserNameController:
                                                _vp2UserNameController,
                                            updatePageForward:
                                                updatePageForward,
                                            updatePageBackward:
                                                updatePageBackward,
                                                showToast: showToast,
                                          )
                                        : currentPage == 9
                                            ? AddHOPage(
                                                hoRoleController:
                                                    _hoRoleController,
                                                hoNameController:
                                                    _hoNameController,
                                                hoEmailAddressController:
                                                    _hoEmailAddressController,
                                                hoContactNumberController:
                                                    _hoPhoneNumberController,
                                                hoUserNameController:
                                                    _hoUserNameController,
                                                updatePageBackward:
                                                    updatePageBackward,  
                                                controllers: controllers,     
                                                showToast: showToast,
                                              )
                                            : Container(),
      ),
    );
  }
}
