import 'package:flutter_bloc/flutter_bloc.dart';
import '../../products/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<Product> _cartItems = [];

  List<Product> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(Product product) {
    _cartItems.add(product);
    emit(CartUpdated(List.from(_cartItems)));
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    emit(CartUpdated(List.from(_cartItems)));
  }

  void clearCart() {
    _cartItems.clear();
    emit(CartUpdated(List.from(_cartItems)));
  }

  double get totalPrice => _cartItems.fold(0, (sum, item) => sum + item.price);
}
