import 'package:state_management/common/extensions.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import '../models/item.dart';

part 'home_controller.g.dart';

//
// const _delay = Duration(milliseconds: 800);

const List<dynamic> _catalog = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  String errorMessage = " ";

  @observable
  AppStatus appStatus = AppStatus.empty;
  List<Item> item = <Item>[];

  get catalog => _catalog;

  @action
  Future<void> getProducts() async {
    try {
      appStatus = AppStatus.loading;
      item = await Future.delayed(const Duration(seconds: 2))
          .then((value) => _catalog as List<Item>
              //     List.generate(
              //   15,
              //   (index)
              //       => Item(),
              // ),
              );
      appStatus = item.isNotEmpty ? AppStatus.success : AppStatus.empty;
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
