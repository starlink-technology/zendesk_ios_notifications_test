class ZendeskFieldsModel {
  String? phoneNumber;
  String? flourNumber;
  String? foodNumber;
  String? membersLength;
  String? cardNumber;
  String? province;
  String? centerNumber;
  String? iosOrAndroid;
  String? deviceName;
  String? osVer;
  String? appVer;
  ZendeskFieldsModel({
    required this.phoneNumber,
    required this.flourNumber,
    required this.foodNumber,
    required this.membersLength,
    required this.cardNumber,
    required this.province,
    required this.centerNumber,
    this.iosOrAndroid,
    this.deviceName,
    this.osVer,
    this.appVer,
  });

  Map<String, String> toJson() {
    return {
      '15130262230429': phoneNumber ?? "",
      '15130534871069': flourNumber ?? "",
      '15130352222365': foodNumber ?? "",
      '22623419187229': membersLength ?? "",
      '15130234727453': cardNumber ?? "",
      '22624014478493': province ?? "",
      '22623466713501': centerNumber ?? "",
      "15130657549725": iosOrAndroid ?? "",
      "15130698467741": deviceName ?? "",
      "15130713395485": osVer ?? "",
      "15130737310365": appVer ?? "",
    };
  }
}
// class ZendeskFieldsModel {
//   String? id;
//   String? number;
//   String? oldNumber;
//   String? phone;
//   String? formState;
//   String? blocked;
//   String? foodAgencyNumber;
//   String? foodAgencyName;
//   String? flourAgencyNumber;
//   String? flourAgencyName;
//   String? fatherFullName;
//   String? formStateFather;
//   String? idCardType;
//   String? idCardNumber;
//   String? iosOrAndroid;
//   String? deviceName;
//   String? osVer;
//   String? appVer;
//   String? location;
//   String? province;

//   ZendeskFieldsModel({
//     this.id,
//     this.number,
//     this.oldNumber,
//     this.phone,
//     this.formState,
//     this.blocked,
//     this.foodAgencyNumber,
//     this.foodAgencyName,
//     this.flourAgencyNumber,
//     this.flourAgencyName,
//     this.fatherFullName,
//     this.formStateFather,
//     this.idCardType,
//     this.idCardNumber,
//     this.iosOrAndroid,
//     this.deviceName,
//     this.osVer,
//     this.appVer,
//     this.location,
//     this.province,
//   });

//   Map<String, String> toJson() {
//     return {
//       "15130169770909": id ?? "",
//       "15130234727453": number ?? "",
//       "15130275540893": oldNumber ?? "",
//       "15130262230429": phone ?? "",
//       "15130315677469": formState ?? "",
//       "15130334319133": blocked ?? "",
//       "15130352222365": foodAgencyNumber ?? "",
//       "15130496575901": foodAgencyName ?? "",
//       "15130534871069": flourAgencyNumber ?? "",
//       "15130557995933": flourAgencyName ?? "",
//       "15130571919005": fatherFullName ?? "",
//       "15130588783133": formStateFather ?? "",
//       "15130636108701": idCardType ?? "",
//       "15130624406301": idCardNumber ?? "",
//       "15130657549725": iosOrAndroid ?? "",
//       "15130698467741": deviceName ?? "",
//       "15130713395485": osVer ?? "",
//       "15130737310365": appVer ?? "",
//       "15130741287453": location ?? "",
//       "": province ?? "",
//     };
//   }
// }
