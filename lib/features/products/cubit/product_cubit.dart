import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_model.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  // Local list of products
  final List<Product> _products = [
    Product(
      id: 1,
      name: "T-Shirt",
      price: 25.0,
      inStock: true,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSwWTfGsvKRm8YmKORbE8ZJyrZS9-naQwhTg&s",
    ),
    Product(
      id: 2,
      name: "Shoes",
      price: 80.0,
      inStock: true,
      imageUrl:
          "https://img.freepik.com/free-photo/fashion-shoes-sneakers_1203-7529.jpg?semt=ais_hybrid&w=740&q=80",
    ),
    Product(
      id: 3,
      name: "Hat",
      price: 15.0,
      inStock: false,
      imageUrl:
          "https://t3.ftcdn.net/jpg/02/75/74/58/360_F_275745846_slBI2EsTudIShef6hMliS6Oa123tC9Zv.jpg",
    ),
  ];

  void fetchProducts() {
    emit(ProductLoading());
    try {
      emit(ProductLoaded(List.from(_products)));
    } catch (e) {
      emit(ProductError("Failed to load products"));
    }
  }
}
