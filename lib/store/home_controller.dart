import 'package:state_management/models/catalog.dart';
import 'package:state_management/common/extensions.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'dart:math';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  String errorMessage = " ";

  @observable
  AppStatus appStatus = AppStatus.empty;
  List<CatalogModel> itemNames = <CatalogModel>[];

  @action
  Future<void> getProducts() async {
    try {
      appStatus = AppStatus.loading;
      itemNames = await Future.delayed(const Duration(seconds: 2)).then(
        (value) => List.generate(
          15,
          (index) => CatalogModel(),
        ),
      );
      appStatus = itemNames.isNotEmpty ? AppStatus.success : AppStatus.empty;
    } on PlatformException catch (e) {
      errorMessage = e.message.toString();
      appStatus = AppStatus.error;
    } catch (e) {
      errorMessage = e.toString();
      appStatus = AppStatus.error;
      appStatus.message();
    }
  }
}
