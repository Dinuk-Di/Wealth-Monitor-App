
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../data/models/fixed_instrument_model.dart';
import '../../data/models/stock_position_model.dart';
import '../providers/portfolio_provider.dart';

class AddInvestmentPage extends ConsumerStatefulWidget {
  final StockPositionModel? stockToEdit;
  final FixedInstrumentModel? fixedToEdit;

  const AddInvestmentPage({super.key, this.stockToEdit, this.fixedToEdit});

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
  final _stockCommissionController = TextEditingController();
  DateTime _stockBoughtDate = DateTime.now();
  
  // Stock Sold Section
  bool _isStockSold = false;
  final _stockSoldPriceController = TextEditingController();
  final _stockSoldCommissionController = TextEditingController();
  DateTime _stockSoldDate = DateTime.now();
  final _stockCommentsController = TextEditingController();
  
  // Fixed Instrument Form Controllers
  final _fixedNameController = TextEditingController();
  final _fixedInstitutionController = TextEditingController();
  final _fixedAmountController = TextEditingController();
  final _fixedRateController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _maturityDate = DateTime.now().add(const Duration(days: 365));
  FixedInstrumentType _fixedType = FixedInstrumentType.fixedDeposit;
  bool _isFixedMatured = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    
    if (widget.stockToEdit != null) {
      _loadStockData(widget.stockToEdit!);
    } else if (widget.fixedToEdit != null) {
      _loadFixedData(widget.fixedToEdit!);
      _tabController.index = 1; // Switch to Fixed tab
    }
  }

  void _loadStockData(StockPositionModel stock) {
    _stockSymbolController.text = stock.symbol;
    _stockCompanyController.text = stock.companyName;
    _stockBrokerController.text = stock.broker;
    _stockQtyController.text = stock.totalQuantity.toString();
    _stockPriceController.text = stock.averagePrice.toString();
    _stockCommissionController.text = stock.boughtCommission.toString();
    _stockBoughtDate = stock.boughtDate;
    _stockCommentsController.text = stock.comments ?? '';
    
    _isStockSold = stock.status == StockStatus.sold;
    if (_isStockSold) {
      _stockSoldPriceController.text = stock.soldPrice?.toString() ?? '';
      _stockSoldCommissionController.text = stock.soldCommission?.toString() ?? '';
      _stockSoldDate = stock.soldDate ?? DateTime.now();
    }
  }

  void _loadFixedData(FixedInstrumentModel fixed) {
    _fixedNameController.text = fixed.name;
    _fixedInstitutionController.text = fixed.institution;
    _fixedAmountController.text = fixed.principalAmount.toString();
    _fixedRateController.text = fixed.interestRate.toString();
    _startDate = fixed.startDate;
    _maturityDate = fixed.maturityDate;
    _fixedType = fixed.type;
    _isFixedMatured = fixed.status == FixedStatus.matured;
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.stockToEdit != null || widget.fixedToEdit != null;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Investment' : 'Add Investment', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: _confirmDelete,
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFC6FF00),
          labelColor: const Color(0xFFC6FF00),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'STOCKS', icon: Icon(Icons.show_chart)),
            Tab(text: 'FIXED / OTHER', icon: Icon(Icons.account_balance)),
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
    final isEditing = widget.stockToEdit != null;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionHeader('Stock Details'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField(_stockSymbolController, 'Ticker (e.g. TEEJ)')),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField(_stockCompanyController, 'Company Name')),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(_stockBrokerController, 'Broker (e.g. CAL)'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField(_stockQtyController, 'Quantity', isNumber: true)),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField(_stockPriceController, 'Avg Price', isNumber: true)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField(_stockCommissionController, 'Commission (Buy)', isNumber: true)),
              const SizedBox(width: 16),
              Expanded(child: _buildDatePicker('Bought Date', _stockBoughtDate, (d) => setState(() => _stockBoughtDate = d))),
            ],
          ),
          const SizedBox(height: 32),
          
          _buildSectionHeader('Status'),
          SwitchListTile(
            title: const Text('Mark as Sold / Closed', style: TextStyle(color: Colors.white)),
            activeColor: const Color(0xFFC6FF00),
            value: _isStockSold,
            onChanged: (val) => setState(() => _isStockSold = val),
          ),
          
          if (_isStockSold) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildTextField(_stockSoldPriceController, 'Sold Price', isNumber: true)),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField(_stockSoldCommissionController, 'Commission (Sell)', isNumber: true)),
              ],
            ),
            const SizedBox(height: 16),
            _buildDatePicker('Sold Date', _stockSoldDate, (d) => setState(() => _stockSoldDate = d)),
          ],

          const SizedBox(height: 16),
          _buildTextField(_stockCommentsController, 'Comments / Notes'),
          
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _saveStock,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC6FF00),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(isEditing ? 'UPDATE STOCK POSITION' : 'ADD STOCK POSITION', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildFixedForm() {
    final isEditing = widget.fixedToEdit != null;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionHeader('Instrument Details'),
          const SizedBox(height: 16),
          DropdownButtonFormField<FixedInstrumentType>(
            value: _fixedType,
            dropdownColor: const Color(0xFF1E1E1E),
            style: const TextStyle(color: Colors.white),
            decoration: _inputDecoration('Type'),
            items: FixedInstrumentType.values.map((e) => DropdownMenuItem(
              value: e, 
              child: Text(e.name.replaceFirst(e.name[0], e.name[0].toUpperCase())),
            )).toList(),
            onChanged: (val) => setState(() => _fixedType = val!),
          ),
          const SizedBox(height: 16),
          _buildTextField(_fixedNameController, 'Name (e.g. HNB FD)'),
          const SizedBox(height: 16),
          _buildTextField(_fixedInstitutionController, 'Institution'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField(_fixedAmountController, 'Principal Amount', isNumber: true)),
              const SizedBox(width: 16),
              Expanded(child: _buildTextField(_fixedRateController, 'Interest Rate (%)', isNumber: true)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildDatePicker('Start Date', _startDate, (d) => setState(() => _startDate = d))),
              const SizedBox(width: 16),
              Expanded(child: _buildDatePicker('Maturity Date', _maturityDate, (d) => setState(() => _maturityDate = d))),
            ],
          ),
          const SizedBox(height: 32),
           _buildSectionHeader('Status'),
           SwitchListTile(
            title: const Text('Mark as Matured / Completed', style: TextStyle(color: Colors.white)),
            activeColor: const Color(0xFFC6FF00),
            value: _isFixedMatured,
            onChanged: (val) => setState(() => _isFixedMatured = val),
          ),

          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _saveFixed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC6FF00),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(isEditing ? 'UPDATE INVESTMENT' : 'ADD INVESTMENT', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: const TextStyle(color: Color(0xFFC6FF00), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5));
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: _inputDecoration(label),
    );
  }
  
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade800)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC6FF00))),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
      );
  }

  Widget _buildDatePicker(String label, DateTime date, Function(DateTime) onSelect) {
    return Material(
      color: const Color(0xFF1E1E1E),
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
         borderRadius: BorderRadius.circular(4),
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
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
            border: Border.all(color: Colors.grey.shade800),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 4),
              Text(DateFormat('MMM d, y').format(date), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveStock() async {
    final qty = double.tryParse(_stockQtyController.text) ?? 0;
    final price = double.tryParse(_stockPriceController.text) ?? 0;
    final commission = double.tryParse(_stockCommissionController.text) ?? 0;
    
    // Sold Values
    final soldPrice = double.tryParse(_stockSoldPriceController.text);
    final soldCommission = double.tryParse(_stockSoldCommissionController.text);

    final stock = widget.stockToEdit ?? StockPositionModel();
    stock
      ..symbol = _stockSymbolController.text.toUpperCase()
      ..companyName = _stockCompanyController.text
      ..broker = _stockBrokerController.text
      ..totalQuantity = qty
      ..averagePrice = price
      ..currentPrice = price // Keep existing if editing? For now overwrite or user logic needed
      ..sector = "Unknown" 
      ..lastUpdated = DateTime.now()
      ..boughtDate = _stockBoughtDate
      ..boughtCommission = commission
      ..comments = _stockCommentsController.text
      ..status = _isStockSold ? StockStatus.sold : StockStatus.open
      ..soldPrice = _isStockSold ? soldPrice : null
      ..soldDate = _isStockSold ? _stockSoldDate : null
      ..soldCommission = _isStockSold ? soldCommission : null;

    final repo = await ref.read(portfolioRepositoryProvider.future);
    if (widget.stockToEdit != null) {
      await repo.updateStockPosition(stock);
    } else {
      await repo.addStockPosition(stock);
    }
    if (mounted) Navigator.pop(context);
  }

  Future<void> _saveFixed() async {
    final amount = double.tryParse(_fixedAmountController.text) ?? 0;
    final rate = double.tryParse(_fixedRateController.text) ?? 0;

    final fixed = widget.fixedToEdit ?? FixedInstrumentModel();
    fixed
      ..name = _fixedNameController.text
      ..institution = _fixedInstitutionController.text
      ..principalAmount = amount
      ..interestRate = rate
      ..startDate = _startDate
      ..maturityDate = _maturityDate
      ..type = _fixedType
      ..status = _isFixedMatured ? FixedStatus.matured : FixedStatus.active;

    final repo = await ref.read(portfolioRepositoryProvider.future);
    if (widget.fixedToEdit != null) {
      await repo.updateFixedInstrument(fixed);
    } else {
      await repo.addFixedInstrument(fixed);
    }
    if (mounted) Navigator.pop(context);
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('Delete Investment?', style: TextStyle(color: Colors.white)),
        content: const Text('This action cannot be undone.', style: TextStyle(color: Colors.grey)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('CANCEL', style: TextStyle(color: Colors.grey))),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('DELETE', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
        ],
      ),
    );

    if (confirmed == true) {
      final repo = await ref.read(portfolioRepositoryProvider.future);
      if (widget.stockToEdit != null) {
        await repo.deleteStockPosition(widget.stockToEdit!.id);
      } else if (widget.fixedToEdit != null) {
        await repo.deleteFixedInstrument(widget.fixedToEdit!.id);
      }
      if (mounted) Navigator.pop(context);
    }
  }
}
