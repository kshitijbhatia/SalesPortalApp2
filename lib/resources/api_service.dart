import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sales_portal_app_2/model/sales_data.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService._privateConstructor();

  static final APIService _instance = APIService._privateConstructor();

  static APIService get instance => _instance;

  Future<List<Sales>> fetchData() async {
    try {
      final url = Uri.parse('http://10.0.2.2:3000/api/data/get');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        List<Sales> data = resData.map<Sales>((sale) => Sales.fromJson(sale)).toList();
        return data;
      } else {
        throw Exception('Failed to fetch sata : ${response.statusCode}');
      }
    } catch (err) {
      throw Exception('Error fetching data : $err');
    }
  }

  Future<Map<String, dynamic>> sendData(
      List<TextEditingController> controllers) async {
    try {
      Sales sales = Sales(
        DealerCode: BigInt.parse(controllers[0].text),
        DealerName: controllers[1].text,
        DealerEmailAddress: controllers[2].text,
        DealerContactNumber: BigInt.parse(controllers[3].text),
        TMRole: controllers[4].text,
        TMName: controllers[5].text,
        TMEmailAddress: controllers[6].text,
        TMPhoneNumber: BigInt.parse(controllers[7].text),
        TMUserName: controllers[8].text,
        AMRole: controllers[9].text,
        AMName: controllers[10].text,
        AMEmailAddress: controllers[11].text,
        AMPhoneNumber: BigInt.parse(controllers[12].text),
        AMUserName: controllers[13].text,
        NSMRole: controllers[14].text,
        NSMName: controllers[15].text,
        NSMEmailAddress: controllers[16].text,
        NSMPhoneNumber: BigInt.parse(controllers[17].text),
        NSMUserName: controllers[18].text,
        NSM1Name: controllers[19].text,
        NSM1EmailAddress: controllers[20].text,
        NSM1PhoneNumber: BigInt.parse(controllers[21].text),
        NSM1UserName: controllers[22].text,
        VPRole: controllers[23].text,
        VPName: controllers[24].text,
        VPEmailAddress: controllers[25].text,
        VPPhoneNumber: BigInt.parse(controllers[26].text),
        VPUserName: controllers[27].text,
        VP1Name: controllers[28].text,
        VP1EmailAddress: controllers[29].text,
        VP1PhoneNumber: BigInt.parse(controllers[30].text),
        VP1UserName: controllers[31].text,
        VP2Name: controllers[32].text,
        VP2EmailAddress: controllers[33].text,
        VP2PhoneNumber: BigInt.parse(controllers[34].text),
        VP2UserName: controllers[35].text,
        HORole: controllers[36].text,
        HOName: controllers[37].text,
        HOEmailAddress: controllers[38].text,
        HOPhoneNumber: BigInt.parse(controllers[39].text),
        HOUserName: controllers[40].text,
      );

      final data = jsonEncode(sales.toJson());
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };
      final url = Uri.parse('http://10.0.2.2:3000/api/data/add');
      final response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        return {'msg': 'success', 'data': sales};
      } else {
        return {'msg': 'failure', 'data': response.statusCode};
      }
    } catch (err) {
      return {'msg': 'error', 'data': err};
    }
  }

  Future<Map<String, dynamic>> editData(
      List<TextEditingController> controllers) async {
    try {

      Sales sales = Sales(
        DealerCode: BigInt.parse(controllers[0].text),
        DealerName: controllers[1].text,
        DealerEmailAddress: controllers[2].text,
        DealerContactNumber: BigInt.parse(controllers[3].text),
        TMRole: controllers[4].text,
        TMName: controllers[5].text,
        TMEmailAddress: controllers[6].text,
        TMPhoneNumber: BigInt.parse(controllers[7].text),
        TMUserName: controllers[8].text,
        AMRole: controllers[9].text,
        AMName: controllers[10].text,
        AMEmailAddress: controllers[11].text,
        AMPhoneNumber: BigInt.parse(controllers[12].text),
        AMUserName: controllers[13].text,
        NSMRole: controllers[14].text,
        NSMName: controllers[15].text,
        NSMEmailAddress: controllers[16].text,
        NSMPhoneNumber: BigInt.parse(controllers[17].text),
        NSMUserName: controllers[18].text,
        NSM1Name: controllers[19].text,
        NSM1EmailAddress: controllers[20].text,
        NSM1PhoneNumber: BigInt.parse(controllers[21].text),
        NSM1UserName: controllers[22].text,
        VPRole: controllers[23].text,
        VPName: controllers[24].text,
        VPEmailAddress: controllers[25].text,
        VPPhoneNumber: BigInt.parse(controllers[26].text),
        VPUserName: controllers[27].text,
        VP1Name: controllers[28].text,
        VP1EmailAddress: controllers[29].text,
        VP1PhoneNumber: BigInt.parse(controllers[30].text),
        VP1UserName: controllers[31].text,
        VP2Name: controllers[32].text,
        VP2EmailAddress: controllers[33].text,
        VP2PhoneNumber: BigInt.parse(controllers[34].text),
        VP2UserName: controllers[35].text,
        HORole: controllers[36].text,
        HOName: controllers[37].text,
        HOEmailAddress: controllers[38].text,
        HOPhoneNumber: BigInt.parse(controllers[39].text),
        HOUserName: controllers[40].text,
      );

      final data = jsonEncode(sales.toJson());
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };
      final url = Uri.parse('http://10.0.2.2:3000/api/data/edit');
      final response = await http.put(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        return {'msg': 'success', 'data': sales};
      } else {
        return {'msg': 'failure', 'data': response.statusCode};
      }
    } catch (err) {
      return {'msg': 'error', 'data': null};
    }
  }
}
