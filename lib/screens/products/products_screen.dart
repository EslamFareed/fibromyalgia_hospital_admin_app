import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/product/product_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/products/create_product_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/products/edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ProductCubit.get(context);
    cubit.getProducts();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper.goTo(context, const CreateProductScreen());
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(title: const Text("Products")),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is LoadingGetProductsState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.products[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    NavigationHelper.goTo(
                        context, EditProductScreen(product: item));
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 10),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image!),
                  ),
                  title: Text("${item.name}"),
                  subtitle: Text(
                      "${item.categoryName}\nrate : ${item.rate} stars\nprice : ${item.price}\n${item.desc}"),
                ),
              );
            },
            itemCount: cubit.products.length,
          );
        },
      ),
    );
  }
}
