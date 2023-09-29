import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:payments/models/data_model.dart';
import 'package:payments/services/data_services.dart';

class DataController extends GetxController {
  RxList<DataModel> list = <DataModel>[].obs;
  final service = DataServices();
  final _loading = false.obs;

  get loading => _loading.value;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  get newList =>
      list.where((e) => e.status == 0 ? false : true).map((e) => e).toList();

  _loadData() async {
    _loading.value = false;
    try {
      var info = service.getUsers();
      list.addAll(await info);
    } catch (e) {
      if (kDebugMode) {
        print("Encountered error!!");
      }
      if (kDebugMode) {
        print(e);
      }
    } finally {
      _loading.value = true;
    }
  }
}
