import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
import '../../../../features/trans/data/models/transaction_model.dart';
import '../../../../features/trans/presentation/providers/transaction_provider.dart';
import '../../../../features/portfolio/data/models/stock_position_model.dart';
import '../../../../features/portfolio/data/models/fixed_instrument_model.dart';
import '../../../../features/portfolio/presentation/providers/portfolio_provider.dart';

part 'cash_flow_provider.g.dart';

class MonthlyStats {
  final int year;
  final int month;
  final double income;
  final double expense;
  final double invested;
  final double remaining;

  MonthlyStats({
    required this.year,
    required this.month,
    required this.income,
    required this.expense,
    required this.invested,
    required this.remaining,
  });
}

class CashFlowSummary {
  final double totalBalance;
  final double totalIncome;
  final double totalExpense;
  final double totalInvested;
  final MonthlyStats currentMonth;
  final List<MonthlyStats> history;

  CashFlowSummary({
    required this.totalBalance, 
    required this.totalIncome,
    required this.totalExpense,
    required this.totalInvested,
    required this.currentMonth,
    required this.history
  });
}

@riverpod
Future<CashFlowSummary> cashFlowSummary(CashFlowSummaryRef ref) async {
  final transactions = await ref.watch(transactionListProvider.future);
  final stocks = await ref.watch(stockPositionsProvider.future);
  final fixedPlugin = await ref.watch(fixedInstrumentsProvider.future);

  // 1. Total Balance Calculation
  double totalIncome = 0;
  double totalExpense = 0;
  
  for (var t in transactions) {
    if (t.type == TransactionType.income) totalIncome += t.amount;
    if (t.type == TransactionType.expense) totalExpense += t.amount;
  }

  double totalInvested = 0;
  double totalRealizedProfit = 0;

  for (var s in stocks) {
    if (s.status == StockStatus.open) {
      totalInvested += s.totalInvested;
    } else if (s.status == StockStatus.sold) {
      // For sold stocks, the profit is effectively "Income" (Capital Gains)
      // The principal is returned to cash, so it's not "Invested" anymore.
      totalRealizedProfit += s.realizedProfit;
    }
  }

  for (var f in fixedPlugin) {
    if (f.status == FixedStatus.active) {
      totalInvested += f.principalAmount;
    }
    // Matured FDs principal presumably returns to cash. 
    // Interest handling requires transaction logging or complex logic, we'll keep simple for now.
  }

  // Treat Realized Profit as Income for Cash Balance purposes
  totalIncome += totalRealizedProfit;

  final totalBalance = totalIncome - (totalExpense + totalInvested);

  // 2. Monthly History Calculation
  // We need to identify all unique months from transactions and investments
  final months = <String>{}; // "YYYY-MM"
  
  void addMonth(DateTime date) {
    months.add('${date.year}-${date.month.toString().padLeft(2, '0')}');
  }

  for (var t in transactions) addMonth(t.date);
  for (var s in stocks) addMonth(s.lastUpdated);
  for (var f in fixedPlugin) addMonth(f.startDate);

  // If no data, add current month
  if (months.isEmpty) addMonth(DateTime.now());

  final history = <MonthlyStats>[];

  for (var key in months) {
    final parts = key.split('-');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    
    final startOfMonth = DateTime(year, month, 1);
    final endOfMonth = DateTime(year, month + 1, 0);

    double mIncome = 0;
    double mExpense = 0;
    double mInvested = 0;

    for (var t in transactions) {
      if (t.date.isAfter(startOfMonth.subtract(const Duration(seconds: 1))) && 
          t.date.isBefore(endOfMonth.add(const Duration(seconds: 1)))) {
        if (t.type == TransactionType.income) mIncome += t.amount;
        if (t.type == TransactionType.expense) mExpense += t.amount;
      }
    }

    // Stocks: Invested Amount (based on Bought Date)
    for (var s in stocks) {
      if (s.boughtDate.isAfter(startOfMonth) && s.boughtDate.isBefore(endOfMonth)) {
         mInvested += s.totalInvested;
      }
      
      // Stocks: Realized Profit (Income) (based on Sold Date)
      if (s.status == StockStatus.sold && s.soldDate != null) {
        if (s.soldDate!.isAfter(startOfMonth) && s.soldDate!.isBefore(endOfMonth)) {
          mIncome += s.realizedProfit;
        }
      }
    }
    
    // Fixed Instruments (Invested based on Start Date)
    for (var f in fixedPlugin) {
      if (f.startDate.isAfter(startOfMonth) && f.startDate.isBefore(endOfMonth)) {
        mInvested += f.principalAmount;
      }
    }

    history.add(MonthlyStats(
      year: year,
      month: month,
      income: mIncome,
      expense: mExpense,
      invested: mInvested,
      remaining: mIncome - (mExpense + mInvested),
    ));
  }

  // Sort descending (newest first)
  history.sort((a, b) {
    if (a.year != b.year) return b.year.compareTo(a.year);
    return b.month.compareTo(a.month);
  });

  // Get current month stats (or empty if not found)
  final now = DateTime.now();
  final current = history.firstWhereOrNull((h) => h.year == now.year && h.month == now.month) 
      ?? MonthlyStats(year: now.year, month: now.month, income: 0, expense: 0, invested: 0, remaining: 0);

  return CashFlowSummary(
    totalBalance: totalBalance,
    totalIncome: totalIncome,
    totalExpense: totalExpense,
    totalInvested: totalInvested,
    currentMonth: current,
    history: history,
  );
}
