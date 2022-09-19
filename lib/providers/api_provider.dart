
import 'package:employee_app/Utils/Utils.dart';
import 'package:flutter/widgets.dart';

import '../Models/EmployeeModel.dart';
import '../Services/EmployeeService.dart';

class GetDataProvider with ChangeNotifier {
  bool loading = false;
  getData(context) async {
    loading = true;
    try {
      List<EmployeeModel> employeeList = await EmployeeService.getEmployeeList();
    } catch (e) {
      showErrorMessage(e);
    }
    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 3));

    loading = false;

    notifyListeners();
  }
}