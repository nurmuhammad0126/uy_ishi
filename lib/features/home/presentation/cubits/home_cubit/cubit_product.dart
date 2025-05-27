import 'package:ecommer_app_market/features/home/presentation/cubits/home_cubit/cubit_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/product_controller.dart';

class CubitProduct extends Cubit<CubitProductState> {
  CubitProduct()
      : super(CubitProductState(products: [], isLoading: false, error: ''));

  void getProducts() async {
    try {
      final products = await ProductController.getProducts();
      emit(CubitProductState(products: products, isLoading: false, error: ''));
    } catch (e) {
      print(e);
      emit(CubitProductState(
          products: [], isLoading: false, error: e.toString()));
    }
  }
}
