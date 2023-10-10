import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../api/api.dart';
import '../model/product.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());

  loadProductDetail(int id) async {
    print("hello");
    emit(ProductDetailLoading());
    var result = await Api().getSingleProduct(id);
    if(result != "error"){
      emit(ProductDetailLoaded(result));
      print(result);
    }
  }
}
