// ignore_for_file: non_constant_identifier_names

class Sales {
  final BigInt DealerCode;
  final String DealerName;
  final String DealerEmailAddress;
  final BigInt DealerContactNumber;
  final String TMRole;
  final String TMName;
  final String TMEmailAddress;
  final BigInt TMPhoneNumber;
  final String TMUserName;
  final String AMRole;
  final String AMName;
  final String AMEmailAddress;
  final BigInt AMPhoneNumber;
  final String AMUserName;
  final String NSMRole;
  final String NSMName;
  final String NSMEmailAddress;
  final BigInt NSMPhoneNumber;
  final String NSMUserName;
  final String NSM1Name;
  final String NSM1EmailAddress;
  final BigInt NSM1PhoneNumber;
  final String NSM1UserName;
  final String VPRole;
  final String VPName;
  final String VPEmailAddress;
  final BigInt VPPhoneNumber;
  final String VPUserName;
  final String VP1Name;
  final String VP1EmailAddress;
  final BigInt VP1PhoneNumber;
  final String VP1UserName;
  final String VP2Name;
  final String VP2EmailAddress;
  final BigInt VP2PhoneNumber;
  final String VP2UserName;
  final String HORole;
  final String HOName;
  final String HOEmailAddress;
  final BigInt HOPhoneNumber;
  final String HOUserName;

  // Constructor
  Sales({
    required this.DealerCode,
    required this.DealerName,
    required this.DealerEmailAddress,
    required this.DealerContactNumber,
    required this.TMRole,
    required this.TMName,
    required this.TMEmailAddress,
    required this.TMPhoneNumber,
    required this.TMUserName,
    required this.AMRole,
    required this.AMName,
    required this.AMEmailAddress,
    required this.AMPhoneNumber,
    required this.AMUserName,
    required this.NSMRole,
    required this.NSMName,
    required this.NSMEmailAddress,
    required this.NSMPhoneNumber,
    required this.NSMUserName,
    required this.NSM1Name,
    required this.NSM1EmailAddress,
    required this.NSM1PhoneNumber,
    required this.NSM1UserName,
    required this.VPRole,
    required this.VPName,
    required this.VPEmailAddress,
    required this.VPPhoneNumber,
    required this.VPUserName,
    required this.VP1Name,
    required this.VP1EmailAddress,
    required this.VP1PhoneNumber,
    required this.VP1UserName,
    required this.VP2Name,
    required this.VP2EmailAddress,
    required this.VP2PhoneNumber,
    required this.VP2UserName,
    required this.HORole,
    required this.HOName,
    required this.HOEmailAddress,
    required this.HOPhoneNumber,
    required this.HOUserName,
  });

  Map<String, String> toJson() {
    return {
      'DealerCode': DealerCode.toString(),
      'DealerName': DealerName,
      'DealerEmailAddress': DealerEmailAddress,
      'DealerContactNumber': DealerContactNumber.toString(),
      'TMRole': TMRole,
      'TMName': TMName,
      'TMEmailAddress': TMEmailAddress,
      'TMPhoneNumber': TMPhoneNumber.toString(),
      'TMUserName': TMUserName,
      'AMRole': AMRole,
      'AMName': AMName,
      'AMEmailAddress': AMEmailAddress,
      'AMPhoneNumber': AMPhoneNumber.toString(),
      'AMUserName': AMUserName,
      'NSMRole': NSMRole,
      'NSMName': NSMName,
      'NSMEmailAddress': NSMEmailAddress,
      'NSMPhoneNumber': NSMPhoneNumber.toString(),
      'NSMUserName': NSMUserName,
      'NSM1Name': NSM1Name,
      'NSM1EmailAddress': NSM1EmailAddress,
      'NSM1PhoneNumber': NSM1PhoneNumber.toString(),
      'NSM1UserName': NSM1UserName,
      'VPRole': VPRole,
      'VPName': VPName,
      'VPEmailAddress': VPEmailAddress,
      'VPPhoneNumber': VPPhoneNumber.toString(),
      'VPUserName': VPUserName,
      'VP1Name': VP1Name,
      'VP1EmailAddress': VP1EmailAddress,
      'VP1PhoneNumber': VP1PhoneNumber.toString(),
      'VP1UserName': VP1UserName,
      'VP2Name': VP2Name,
      'VP2EmailAddress': VP2EmailAddress,
      'VP2PhoneNumber': VP2PhoneNumber.toString(),
      'VP2UserName': VP2UserName,
      'HORole': HORole,
      'HOName': HOName,
      'HOEmailAddress': HOEmailAddress,
      'HOPhoneNumber': HOPhoneNumber.toString(),
      'HOUserName': HOUserName,
    };
  }

  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales(
      DealerCode: BigInt.from(json['DealerCode']),
      DealerName: json['DealerName'],
      DealerEmailAddress: json['DealerEmailAddress'],
      DealerContactNumber: BigInt.from(json['DealerContactNumber']),
      TMRole: json['TMRole'],
      TMName: json['TMName'],
      TMEmailAddress: json['TMEmailAddress'],
      TMPhoneNumber: BigInt.from(json['TMPhoneNumber']),
      TMUserName: json['TMUserName'],
      AMRole: json['AMRole'],
      AMName: json['AMName'],
      AMEmailAddress: json['AMEmailAddress'],
      AMPhoneNumber: BigInt.from(json['AMPhoneNumber']),
      AMUserName: json['AMUserName'],
      NSMRole: json['NSMRole'],
      NSMName: json['NSMName'],
      NSMEmailAddress: json['NSMEmailAddress'],
      NSMPhoneNumber: BigInt.from(json['NSMPhoneNumber']),
      NSMUserName: json['NSMUserName'],
      NSM1Name: json['NSM1Name'],
      NSM1EmailAddress: json['NSM1EmailAddress'],
      NSM1PhoneNumber: BigInt.from(json['NSM1PhoneNumber']),
      NSM1UserName: json['NSM1UserName'],
      VPRole: json['VPRole'],
      VPName: json['VPName'],
      VPEmailAddress: json['VPEmailAddress'],
      VPPhoneNumber: BigInt.from(json['VPPhoneNumber']),
      VPUserName: json['VPUserName'],
      VP1Name: json['VP1Name'],
      VP1EmailAddress: json['VP1EmailAddress'],
      VP1PhoneNumber: BigInt.from(json['VP1PhoneNumber']),
      VP1UserName: json['VP1UserName'],
      VP2Name: json['VP2Name'],
      VP2EmailAddress: json['VP2EmailAddress'],
      VP2PhoneNumber: BigInt.from(json['VP2PhoneNumber']),
      VP2UserName: json['VP2UserName'],
      HORole: json['HORole'],
      HOName: json['HOName'],
      HOEmailAddress: json['HOEmailAddress'],
      HOPhoneNumber: BigInt.from(json['HOPhoneNumber']),
      HOUserName: json['HOUserName'],
    );
  }
}



