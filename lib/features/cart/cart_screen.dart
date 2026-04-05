import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../order/order_screen.dart';
import 'cubit/cart_cubit.dart';
import 'cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<CartCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Cart"), centerTitle: true),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartItems = state is CartUpdated ? state.cartItems : [];
            if (cartItems.isEmpty) {
              return const Center(child: Text("Your cart is empty"));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(product.imageUrl, width: 50),
                          title: Text(product.name),
                          subtitle: Text("\$${product.price}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context.read<CartCubit>().removeFromCart(product);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Total: \$${context.read<CartCubit>().totalPrice}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          minimumSize: Size(100, 40),
                          backgroundColor: Colors.deepPurple,
                          disabledBackgroundColor: Colors.grey,
                          side: BorderSide(color: Colors.transparent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const OrderScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
