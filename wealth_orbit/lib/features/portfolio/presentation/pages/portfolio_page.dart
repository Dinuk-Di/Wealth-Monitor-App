import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                indicatorColor: Color(0xFFC6FF00),
                labelColor: Color(0xFFC6FF00),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Equity (CSE)'),
                  Tab(text: 'Fixed Income'),
                ],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Stock Portfolio', style: TextStyle(color: Colors.white))),
            Center(child: Text('FDs & TBills', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
