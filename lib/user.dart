import 'package:excel/excel.dart';

class User {
  int? id;
  int? customerNumber;
  String? customerName;
  String? companyName;
  String? phoneNumber;
  String? address;
  String? testResult;
  String? businessDivision;
  int? inspectorEmployeeNumber;
  String? inspectorName;
  String? regularTestDate;
  String? contractTypeCode;
  String? supplyMethodCode;
  String? contractPowerKW;
  String? lastTestDate;
  int? lastTestEmployeeNumber;

  User.loadExcel(List<Data?> rows)
      : id = rows[0]?.value,
        customerNumber = rows[1]?.value,
        customerName = rows[2]?.value.toString(),
        companyName = rows[3]?.value.toString(),
        phoneNumber = rows[4]?.value.toString(),
        address = rows[5]?.value.toString(),
        testResult = rows[6]?.value.toString(),
        businessDivision = rows[7]?.value.toString(),
        inspectorEmployeeNumber = rows[8]?.value,
        inspectorName = rows[9]?.value.toString(),
        regularTestDate = rows[10]?.value.toString(),
        contractTypeCode = rows[11]?.value.toString(),
        supplyMethodCode = rows[12]?.value.toString(),
        contractPowerKW = rows[13]?.value.toString(),
        lastTestDate = rows[14]?.value.toString(),
        lastTestEmployeeNumber = rows[15]?.value;

  @override
  String toString() {
    return 'User{id: $id, customerNumber: $customerNumber, customerName: $customerName, companyName: $companyName, phoneNumber: $phoneNumber, address: $address, testResult: $testResult, businessDivision: $businessDivision, inspectorEmployeeNumber: $inspectorEmployeeNumber, inspectorName: $inspectorName, regularTestDate: $regularTestDate, contractTypeCode: $contractTypeCode, supplyMethodCode: $supplyMethodCode, contractPowerKW: $contractPowerKW, lastTestDate: $lastTestDate, lastTestEmployeeNumber: $lastTestEmployeeNumber}';
  }
}
