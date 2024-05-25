import 'package:fibromyalgia_hospital_admin_app/cubits/order/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OrderCubit.get(context);
    cubit.getOrders();
    return Scaffold(
      appBar: AppBar(title: const Text("Orders")),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is LoadingGetOrdersState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.orders[index];
              return Card(
                child: ListTile(
                  trailing: const Icon(Icons.arrow_forward_ios, size: 10),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      item.items![index].productImage!),
                                ),
                                title: Text(item.items![index].productName!),
                                subtitle: Text(
                                    "quantity = ${item.items![index].quantity}\nprice = ${item.items![index].price}"),
                              );
                            },
                            itemCount: item.items!.length,
                          ),
                        );
                      },
                    );
                  },
                  title: Text("User : ${item.name}"),
                  subtitle: Text(
                      "${item.email}\n${item.phone}\ntotal = ${item.totalPrice}\nshipping cost = ${item.shippingCost}\nAddress = ${item.address}"),
                ),
              );
            },
            itemCount: cubit.orders.length,
          );
        },
      ),
    );
  }
}
