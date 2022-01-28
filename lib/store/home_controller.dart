// import 'package:state_management/models/catalog.dart';
// import 'package:state_management/common/extensions.dart';
// import 'package:flutter/services.dart';
// import 'package:mobx/mobx.dart';
//
// part 'home_controller.g.dart';
//
// class HomeController = _HomeControllerBase with _$HomeController;
//
// abstract class _HomeControllerBase with Store {
//   String errorMessage = " ";
//
//   // int randomPrice = Random().nextInt(10) + 1;
//
//   @observable
//   AppStatus appStatus = AppStatus.empty;
//   List<Item> products = <Item>[];
//
//   @action
//   Future<void> getProducts() async {
//     try {
//       appStatus = AppStatus.loading;
//       products = await Future.delayed(const Duration(seconds: 2))
//           //     .then(
//           //       (value) => List.generate(
//           //     10,
//           //         (index) => ProductModel(
//           //       name: "Product $index",
//           //       price: randomPrice.toDouble() * index,
//           //     ),
//           //   ),
//           // )
//           ;
//
//       appStatus = products.isNotEmpty ? AppStatus.success : AppStatus.empty;
//     } on PlatformException catch (e) {
//       errorMessage = e.message.toString();
//       appStatus = AppStatus.error;
//     } catch (e) {
//       errorMessage = e.toString();
//       appStatus = AppStatus.error;
//       appStatus.message();
//     }
//   }
// }
