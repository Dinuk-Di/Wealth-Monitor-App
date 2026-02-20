import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/models/stock_position_model.dart';
import '../../data/models/fixed_instrument_model.dart';
import '../providers/portfolio_provider.dart';
import 'add_investment_page.dart';

class PortfolioPage extends ConsumerStatefulWidget {
  const PortfolioPage({super.key});

  @override
  ConsumerState<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends ConsumerState<PortfolioPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _viewMode = 0; // 0 = Active, 1 = History

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final stocksAsync = ref.watch(stockPositionsProvider);
    final fixedAsync = ref.watch(fixedInstrumentsProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('My Portfolio', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ToggleButtons(
              isSelected: [_viewMode == 0, _viewMode == 1],
              onPressed: (index) => setState(() => _viewMode = index),
              borderRadius: BorderRadius.circular(8),
              fillColor: const Color(0xFFC6FF00),
              selectedColor: Colors.black,
              color: Colors.grey,
              constraints: const BoxConstraints(minHeight: 32, minWidth: 80),
              children: const [
                Text('Active', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('History', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFC6FF00),
          labelColor: const Color(0xFFC6FF00),
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(text: 'Stocks'),
            Tab(text: 'Fixed / Other'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStockList(stocksAsync),
          _buildFixedList(fixedAsync),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddInvestmentPage())),
        backgroundColor: const Color(0xFFC6FF00),
        label: const Text('Add Investment', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.add_chart, color: Colors.black),
      ),
    );
  }

  Widget _buildStockList(AsyncValue<List<StockPositionModel>> stocksAsync) {
    return stocksAsync.when(
      data: (allStocks) {
        // Filter
        final stocks = allStocks.where((s) {
          if (_viewMode == 0) return s.status == StockStatus.open;
          return s.status == StockStatus.sold;
        }).toList();

        // Sort
        stocks.sort((a, b) {
            if (_viewMode == 0) {
              // Active: Bought Date Descending (Newest first)
              return b.boughtDate.compareTo(a.boughtDate);
            } else {
              // History: Sold Date Descending (Newest first)
              // Handle nulls just in case, though sold status implies soldDate exists
              return (b.soldDate ?? DateTime(0)).compareTo(a.soldDate ?? DateTime(0));
            }
        });

        if (stocks.isEmpty) return _buildEmptyState('No ${_viewMode == 0 ? "active" : "sold"} stocks');
        
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: stocks.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final stock = stocks[index];
            return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddInvestmentPage(stockToEdit: stock))),
              borderRadius: BorderRadius.circular(20),
              child: _viewMode == 0 ? _buildActiveStockCard(stock) : _buildSoldStockCard(stock),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFC6FF00))),
      error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
    );
  }

  Widget _buildActiveStockCard(StockPositionModel stock) {
     final marketValue = stock.currentValue;
     final totalCost = stock.totalInvested;
     final profit = stock.unrealizedProfit;
     final isProfit = profit >= 0;

     return Container(
       padding: const EdgeInsets.all(16),
       decoration: BoxDecoration(
         color: const Color(0xFF1E1E1E),
         borderRadius: BorderRadius.circular(20),
         border: Border.all(color: Colors.white.withOpacity(0.02)),
       ),
       child: Row(
         children: [
            Container(
              width: 48, height: 48,
              decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(12)),
              child: Center(child: Text(stock.symbol.characters.take(1).toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stock.symbol, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text('${stock.totalQuantity} shares @ ${NumberFormat.simpleCurrency(name: '', decimalDigits: 2).format(stock.averagePrice)}', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                 Text(NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 2).format(marketValue), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                 const SizedBox(height: 4),
                 Row(
                   children: [
                     Icon(isProfit ? Icons.arrow_upward : Icons.arrow_downward, color: isProfit ? const Color(0xFFC6FF00) : const Color(0xFFFF5252), size: 12),
                     const SizedBox(width: 2),
                     Text(
                       '${NumberFormat.simpleCurrency(name: '', decimalDigits: 2).format(profit.abs())} (${stock.profitPercentage.toStringAsFixed(2)}%)', 
                       style: TextStyle(color: isProfit ? const Color(0xFFC6FF00) : const Color(0xFFFF5252), fontSize: 12, fontWeight: FontWeight.w600)
                     ),
                   ],
                 )
              ],
            ),
         ],
       ),
     );
  }

  Widget _buildSoldStockCard(StockPositionModel stock) {
    final profit = stock.realizedProfit;
    final isProfit = profit >= 0;

    return Container(
       padding: const EdgeInsets.all(16),
       decoration: BoxDecoration(
         color: const Color(0xFF1E1E1E),
         borderRadius: BorderRadius.circular(20),
         border: Border.all(color: Colors.white.withOpacity(0.02)),
       ),
       child: IntrinsicHeight(
         child: Row(
           children: [
              Container(
                width: 4, 
                decoration: BoxDecoration(
                  color: isProfit ? const Color(0xFFC6FF00) : const Color(0xFFFF5252),
                  borderRadius: BorderRadius.circular(4)
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stock.symbol, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text('Sold on ${stock.soldDate != null ? DateFormat('MMM d').format(stock.soldDate!) : '-'}', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Text(
                     '${isProfit ? '+' : ''}${NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 2).format(profit)}', 
                     style: TextStyle(color: isProfit ? const Color(0xFFC6FF00) : const Color(0xFFFF5252), fontWeight: FontWeight.bold, fontSize: 16)
                   ),
                   const SizedBox(height: 4),
                   Text('Realized P/L', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                ],
              ),
           ],
         ),
       ),
    );
  }

  Widget _buildFixedList(AsyncValue<List<FixedInstrumentModel>> fixedAsync) {
    return fixedAsync.when(
      data: (allInstruments) {
        // Filter
        final instruments = allInstruments.where((i) {
          if (_viewMode == 0) return i.status == FixedStatus.active;
          return i.status == FixedStatus.matured;
        }).toList();

        // Sort
        instruments.sort((a, b) {
          // Both modes: Sort by Maturity Date. 
          // Active: Ascending (Earliest maturity first - critical to see what's maturing soon)
          // Completed: Descending (Most recently matured first)
          if (_viewMode == 0) {
            return a.maturityDate.compareTo(b.maturityDate);
          } else {
            return b.maturityDate.compareTo(a.maturityDate);
          }
        });

        if (instruments.isEmpty) return _buildEmptyState('No ${_viewMode == 0 ? "active" : "matured"} items');
        
        return ListView.separated(
           padding: const EdgeInsets.all(20),
          itemCount: instruments.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final instrument = instruments[index];
            return InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddInvestmentPage(fixedToEdit: instrument))),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.02)),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                       width: 48, height: 48,
                       decoration: BoxDecoration(color: const Color(0xFF2962FF).withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                       child: Icon(_getIconForType(instrument.type), color: const Color(0xFF2962FF)),
                     ),
                  title: Text(instrument.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    '${instrument.interestRate}% • ${_viewMode == 0 ? "Matures" : "Matured"} ${DateFormat('MMM y').format(instrument.maturityDate)}', 
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12)
                  ),
                  trailing: Text(NumberFormat.simpleCurrency(name: 'LKR ', decimalDigits: 2).format(instrument.principalAmount), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFC6FF00))),
      error: (err, _) => Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
    );
  }

  IconData _getIconForType(FixedInstrumentType type) {
    switch (type) {
      case FixedInstrumentType.fixedDeposit: return Icons.lock_clock;
      case FixedInstrumentType.treasuryBill: return Icons.description;
      case FixedInstrumentType.treasuryBond: return Icons.account_balance;
      case FixedInstrumentType.unitTrust: return Icons.pie_chart;
      case FixedInstrumentType.realEstate: return Icons.house;
      default: return Icons.attach_money;
    }
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
             padding: const EdgeInsets.all(32),
             decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(100)),
             child: const Icon(Icons.pie_chart_outline, size: 64, color: Colors.grey),
           ),
          const SizedBox(height: 24),
          Text(message, style: const TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
