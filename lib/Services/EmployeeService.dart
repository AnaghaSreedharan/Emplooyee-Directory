import 'package:dio/dio.dart';
import 'package:employee_app/Configs/DoInstance.dart';
import 'package:employee_app/Utils/Utils.dart';

import '../Configs/ApiConfigs.dart';
import '../Models/EmployeeDbModel.dart';
import '../Models/EmployeeModel.dart';
import '../providers/db_provider.dart';
class EmployeeService {

  static Future<List<EmployeeModel>> getEmployeeList() async {
    try {
      var url = ApiEndPoints.getEmployeesList;
      Response response = await dioInstance.get(url);
      print(response.data);
      // List<EmployeeModel> modelList = employeeModelFromJson(response.data);
      List<EmployeeModel> modelList = [];
      List<EmployeeDbModel> dbModelList = [];
      for (int i=0;i<response.data.length;i++){
        EmployeeModel model = EmployeeModel.fromJson(response.data[i]);
        modelList.add(model);
        dbModelList.add(EmployeeDbModel(id:model.id,name: model.name,username: model.username,
            email: model.email,phone: model.phone,profile_image: model.profileImage,address: model.address.street+", "+
                model.address.suite+", "+model.address.city+", "+model.address.zipcode,latitude: model.address.geo.lat,longitude: model.address.geo.lng,
            company_name: model.company==null?null:model.company!.name,bs:  model.company==null?null:model.company!.bs,catchPhrase: model.company==null?null:model.company!.catchPhrase,
            website: model.website
        )) ;
        DBProvider.db.createEmployee(dbModelList[i]);
      }
      return modelList;
    } catch (e) {
      throw e;
    }
  }

}
