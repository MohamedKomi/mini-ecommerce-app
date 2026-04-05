import 'package:equatable/equatable.dart';
import '../../products/product_model.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<Product> cartItems;

  CartUpdated(this.cartItems);

  @override
  List<Object?> get props => [cartItems];
}
