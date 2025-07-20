import 'package:flutter/material.dart';
import 'package:oz_cofe/model/TransactionCard.dart';
import 'package:oz_cofe/ui/views/Features/Transaction/Transaction_viewmodel.dart';

import 'package:stacked/stacked.dart';

class TransactionPage extends StackedView<TransactionViewModel> {
  const TransactionPage({super.key});

  @override
  Widget builder(
    BuildContext context,
    TransactionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                _buildTab("On Process", 0, viewModel),
                _buildTab("Complete", 1, viewModel),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: viewModel.transactions.length,
              itemBuilder: (context, index) {
                return TransactionCard(transaction: viewModel.transactions[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index, TransactionViewModel viewModel) {
    final isSelected = viewModel.selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => viewModel.changeTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF056780) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  TransactionViewModel viewModelBuilder(BuildContext context) =>
      TransactionViewModel();
}
