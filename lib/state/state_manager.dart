import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/models/catalog.dart';


final cartListProvider = StateNotifierProvider((ref) {
  return items;
}