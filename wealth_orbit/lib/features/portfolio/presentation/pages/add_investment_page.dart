
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/fixed_instrument_model.dart';
import '../../data/models/stock_position_model.dart';
import '../providers/portfolio_provider.dart';

class AddInvestmentPage extends ConsumerStatefulWidget {
  const AddInvestmentPage({super.key});

  @override
  ConsumerState<AddInvestmentPage> createState() => _AddInvestmentPageState();
}

class _AddInvestmentPageState extends ConsumerState<AddInvestmentPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // Stock Form Controllers
  final _stockSymbolController = TextEditingController();
  final _stockCompanyController = TextEditingController();
  final _stockBrokerController = TextEditingController();
  final _stockQtyController = TextEditingController();
  final _stockPriceController = TextEditingController();
  
  // Fixed Instrument Form Controllers
  final _fixedNameController = TextEditingController();
  final _fixedInstitutionController = TextEditingController();
  final _fixedAmountController = TextEditingController();
  final _fixedRateController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _maturityDate = DateTime.now().add(const Duration(days: 365));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Add Investment', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFC6FF00),
          labelColor: const Color(0xFFC6FF00),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'STOCKS', icon: Icon(Icons.show_chart)),
            Tab(text: 'FIXED / REAL ESTATE', icon: Icon(Icons.account_balance)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildStockForm(),
          _buildFixedForm(),
        ],
      ),
    );
  }

  Widget _buildStockForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTextField(_stockSymbolController, 'Ticker Symbol (e.g. TEEJ)'),
          const SizedBox(height: 16),
          _buildTextField(_stockCompanyController, 'Company Name'),
          const SizedBox(height: 16),
           _buildTextField(_stockBrokerController, 'Broker (e.g. CAL)'),
          const SizedBox(height: 16),
          _buildTextField(_stockQtyController, 'Quantity', isNumber: true),
          const SizedBox(height: 16),
          _buildTextField(_stockPriceController, 'Average Price', isNumber: true),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _saveStock,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC6FF00),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('ADD STOCK POSITION', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildFixedForm() {
     return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTextField(_fixedNameController, 'Name (e.g. HNB FD)'),
          const SizedBox(height: 16),
          _buildTextField(_fixedInstitutionController, 'Institution'),
          const SizedBox(height: 16),
          _buildTextField(_fixedAmountController, 'Principal Amount', isNumber: true),
          const SizedBox(height: 16),
          _buildTextField(_fixedRateController, 'Interest Rate (%)', isNumber: true),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildDatePicker('Start Date', _startDate, (d) => setState(() => _startDate = d))),
              const SizedBox(width: 16),
              Expanded(child: _buildDatePicker('Maturity Date', _maturityDate, (d) => setState(() => _maturityDate = d))),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _saveFixed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC6FF00),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('ADD FIXED INVESTMENT', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade800)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC6FF00))),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
      ),
    );
  }

  Widget _buildDatePicker(String label, DateTime date, Function(DateTime) onSelect) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2000),
          lastDate: DateTime(2050),
          builder: (context, child) {
            return Theme(
              data: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(primary: Color(0xFFC6FF00), onPrimary: Colors.black),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) onSelect(picked);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          border: Border.all(color: Colors.grey.shade800),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 4),
            Text(date.toString().split(' ')[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Future<void> _saveStock() async {
    final qty = double.tryParse(_stockQtyController.text) ?? 0;
    final price = double.tryParse(_stockPriceController.text) ?? 0;
    
    final stock = StockPositionModel()
      ..symbol = _stockSymbolController.text.toUpperCase()
      ..companyName = _stockCompanyController.text
      ..broker = _stockBrokerController.text
      ..totalQuantity = qty
      ..averagePrice = price
      ..currentPrice = price // Default to avg for now
      ..sector = "Unknown" // Can add field later
      ..lastUpdated = DateTime.now();

    final repo = await ref.read(portfolioRepositoryProvider.future);
    await repo.addStockPosition(stock);
    if (mounted) Navigator.pop(context);
  }

  Future<void> _saveFixed() async {
    final amount = double.tryParse(_fixedAmountController.text) ?? 0;
    final rate = double.tryParse(_fixedRateController.text) ?? 0;

    final fixed = FixedInstrumentModel()
      ..name = _fixedNameController.text
      ..institution = _fixedInstitutionController.text
      ..principalAmount = amount
      ..interestRate = rate
      ..startDate = _startDate
      ..maturityDate = _maturityDate
      ..type = FixedInstrumentType.fixedDeposit; // Default, can add dropdown

    final repo = await ref.read(portfolioRepositoryProvider.future);
    await repo.addFixedInstrument(fixed);
    if (mounted) Navigator.pop(context);
  }
}
