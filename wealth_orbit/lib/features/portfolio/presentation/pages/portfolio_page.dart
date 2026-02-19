import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/portfolio_provider.dart';
import '../../data/models/stock_position_model.dart';
import '../../data/models/fixed_instrument_model.dart';
import 'add_investment_page.dart';
import 'package:intl/intl.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stocksAsync = ref.watch(stockPositionsProvider);
    final fixedAsync = ref.watch(fixedInstrumentsProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('My Portfolio', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Color(0xFFC6FF00),
            labelColor: Color(0xFFC6FF00),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Equity (CSE)'),
              Tab(text: 'Fixed / Real Estate'),
            ],
          ),
          actions: [
            // Net Worth Chip
             Padding(
               padding: const EdgeInsets.only(right: 16.0),
               child: Center(
                 child: Consumer(
                   builder: (context, ref, child) {
                     final netWorth = ref.watch(totalNetWorthProvider);
                     return netWorth.when(
                       data: (value) => Text(
                         NumberFormat.currency(symbol: 'LKR ', decimalDigits: 0).format(value),
                         style: const TextStyle(color: Color(0xFFC6FF00), fontWeight: FontWeight.bold, fontSize: 16),
                       ),
                       loading: () => const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
                       error: (_, __) => const Text('NV', style: TextStyle(color: Colors.red)),
                     );
                   },
                 ),
               ),
             )
          ],
        ),
        body: TabBarView(
          children: [
            _buildStockList(stocksAsync),
            _buildFixedList(fixedAsync),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddInvestmentPage())),
          icon: const Icon(Icons.add, color: Colors.black),
          label: const Text('INVEST', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFFC6FF00),
        ),
      ),
    );
  }

  Widget _buildStockList(AsyncValue<List<StockPositionModel>> stocksAsync) {
    return stocksAsync.when(
      data: (stocks) {
        if (stocks.isEmpty) {
          return const Center(child: Text('No Stocks Found. Add one!', style: TextStyle(color: Colors.grey)));
        }
        return ListView.separated(
          itemCount: stocks.length,
          separatorBuilder: (_, __) => Divider(color: Colors.grey.shade900),
          itemBuilder: (context, index) {
            final stock = stocks[index];
            return ListTile(
              title: Text(stock.symbol, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text(stock.companyName, style: const TextStyle(color: Colors.grey)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Text(
                    NumberFormat.currency(symbol: 'LKR ').format(stock.totalInvested),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${stock.totalQuantity} @ ${stock.averagePrice}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
    );
  }

  Widget _buildFixedList(AsyncValue<List<FixedInstrumentModel>> fixedAsync) {
    return fixedAsync.when(
      data: (instruments) {
        if (instruments.isEmpty) {
          return const Center(child: Text('No Fixed Instruments. Add one!', style: TextStyle(color: Colors.grey)));
        }
        return ListView.separated(
            padding: const EdgeInsets.only(bottom: 80),
          itemCount: instruments.length,
          separatorBuilder: (_, __) => Divider(color: Colors.grey.shade900),
          itemBuilder: (context, index) {
            final item = instruments[index];
            return ListTile(
              title: Text(item.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              subtitle: Text('${item.institution} • ${item.interestRate}%', style: const TextStyle(color: Colors.grey)),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    NumberFormat.currency(symbol: 'LKR ').format(item.principalAmount),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('MMM d, y').format(item.maturityDate),
                    style: TextStyle(color: item.isMatured ? const Color(0xFFC6FF00) : Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
    );
  }
}
