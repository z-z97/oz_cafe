import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (vm) => vm.init(),
      builder: (context, vm, child) {
        if (vm.isBusy) return Center(child: CircularProgressIndicator());

        return Scaffold(
          appBar: AppBar(title: Text('OZ Cafe')),
          body: ListView.builder(
            itemCount: vm.products.length,
            itemBuilder: (context, index) {
              final product = vm.products[index];
              return ListTile(
                title: Text(product['name']),
                subtitle: Text(product['price']),
                leading: Image.network(product['image']),
              );
            },
          ),
        );
      },
    );
  }
  
  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    // TODO: implement builder
    throw UnimplementedError();
  }
  
  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    throw UnimplementedError();
  }
}
