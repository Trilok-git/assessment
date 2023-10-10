part of 'product_detail_cubit.dart';

@immutable
abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState{}

class ProductDetailLoaded extends ProductDetailState{
  Product singleProduct;
  ProductDetailLoaded(this.singleProduct);
}