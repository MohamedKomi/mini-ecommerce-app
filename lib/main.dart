import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/cubit/auth_cubit.dart';
import 'features/cart/cubit/cart_cubit.dart';
import 'features/products/cubit/product_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()), //
        BlocProvider(create: (_) => AuthCubit()), //
        BlocProvider(create: (_) => ProductCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (_) => AuthCubit(), child: LoginScreen()),
    );
  }
}
