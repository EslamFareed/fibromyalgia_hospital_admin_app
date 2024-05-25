import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/product/product_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/product_category/product_category_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/productCategories/create_product_category_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/productCategories/edit_product_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCategoriesScreen extends StatelessWidget {
  const ProductCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ProductCategoryCubit.get(context);
    cubit.getProductCategories();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper.goTo(context, CreateProductCategoryScreen());
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(title: const Text("Product Categories")),
      body: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
        builder: (context, state) {
          if (state is LoadingGetProductCategoriesState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.cats[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    NavigationHelper.goTo(
                        context, EditProductCategoryScreen(category: item));
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 10),
                  title: Text("${item.name}"),
                ),
              );
            },
            itemCount: cubit.cats.length,
          );
        },
      ),
    );
  }
}
