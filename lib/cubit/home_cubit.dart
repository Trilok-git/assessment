import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../api/api.dart';
import '../model/product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getProducts() async {
    print('inside');
    emit(ProductsLoading());
    var products = await Api().getProducts();
    if(products!="error"){
      print(products.length.toString());
      emit(ProductsLoaded(products));

    }
  }

}
