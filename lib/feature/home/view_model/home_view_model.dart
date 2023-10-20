import 'package:flutter/material.dart';
import 'package:zealight_task/core/utils.dart';
import 'package:zealight_task/feature/home/models/school_model.dart';

import 'package:zealight_task/feature/home/service/home_services.dart';

class HomeViewModel extends ChangeNotifier {
  HomeServices homeServices = HomeServices();
    List newSearchedSchool = [];

  List<SchoolModel> _schoolDataList = [];
  List<SchoolModel> get schoolDataList => _schoolDataList;

  setProductCategory(List<SchoolModel> schoolDataList) async {
    _schoolDataList = schoolDataList;
    newSearchedSchool = schoolDataList;
    
  }

  fetchSchoolData(context) async {
    var response = await homeServices.fetchSchool();

    if (response is Success) {
      setProductCategory(response.response as List<SchoolModel>);
      notifyListeners();
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(" Error"),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: userError.message.toString(),
            onPressed: () {
              // Code to execute.
            },
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }
  }

  void searchSchool(String query) {
    newSearchedSchool = _schoolDataList;

    final suggestions = _schoolDataList.where((data) {
      final dataName = data.name.toLowerCase();
      final input = query.toLowerCase();

      return dataName.contains(input) ? true : false;
    }).toList();

    newSearchedSchool = suggestions;

    notifyListeners();
  }
}
