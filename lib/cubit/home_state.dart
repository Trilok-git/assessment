part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ProductsLoading extends HomeState{
  final List<Product> products = [];
}

class ProductsLoaded extends HomeState{
  final List<Product> products;

  ProductsLoaded(this.products);
}
