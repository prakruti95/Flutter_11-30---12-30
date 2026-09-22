import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'blocs/product/product_event.dart';
import 'repositories/product_repository.dart';
import 'views/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepository(),
      child: BlocProvider(
        create: (context) => ProductBloc(
          productRepository: context.read<ProductRepository>(),
        )..add(const FetchProductsEvent()),
        child: MaterialApp(
          title: 'Product Store',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ProductListScreen(),
        ),
      ),
    );
  }
}
