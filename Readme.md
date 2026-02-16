
WealthOrbit 🪐

**The All-in-One Personal Finance & Wealth Ecosystem**

**WealthOrbit** is a premium, cross-platform (iOS, Android, Tablet) Flutter application built to replace scattered Excel sheets with a unified, intelligent financial command center.

It goes beyond simple stock tracking to manage your **entire financial life** : from daily grocery runs and electricity bills to complex Colombo Stock Exchange (CSE) portfolios, Treasury Bonds, and Fixed Deposits. All wrapped in a stunning, responsive Dark Mode UI.

---

## 🎯 Project Vision

1. **Total Financial Control:** A single source of truth for every rupee—whether it's cash in hand, invested in the market, or locked in a Treasury Bond.
2. **Local Context First:** Specifically designed for Sri Lankan financial instruments (CSE Equity, Unit Trusts, T-Bills/Bonds).
3. **Smart Automation:** * Auto-calculation of weighted average costs for stocks.
   * Auto-calculation of maturity values for Fixed Deposits.
   * AI-driven cash flow predictions.
4. **Frictionless Security:** fast, secure access via Google Sign-In and Biometrics.
5. **Performance:** Built on **Antigravity** for 60fps performance and offline-first capability.

---

## ✨ Features Breakdown

### 🔐 1. Authentication & Security

* **Social Login:** One-tap **Google Sign-In** (via Firebase Auth) for instant onboarding.
* **Privacy Mode:** App content blurs when switching apps to prevent prying eyes.
* **Biometric Lock:** Secure your wealth data with FaceID/Fingerprint.

### 💸 2. Daily Cash Flow (Income & Expenses)

* **Granular Tracking:** Log every transaction with custom categories:
  * *Expenses:* Groceries, Utility Bills (Light/Water), Transport, Dining, Subscriptions.
  * *Income:* Salary, Dividends, Freelance, Gifts (e.g., "From Job").
  * Investment: Stock/ Fixed Deposit/ Unit Trust/ Treasury Bond/ Money Market
* **Smart Budgets:** Set monthly limits for categories (e.g., "Max 50k for Groceries") and get alerts when nearing the limit.
* **Recurring Bills:** Auto-log fixed monthly expenses like internet or rent.

### 📈 3. Investment Portfolio (The Core)

#### A. Equity (Colombo Stock Exchange)

* **Transaction Recorder:** Log `Buy`/`Sell` orders with precision (Price, Units, Commission).
* **Auto-Analytics:** * Calculates Realized vs. Unrealized Gain/Loss instantly.
  * Tracks "Remaining Units" after partial sales.
  * Visual History timeline for every stock held.

#### B. Fixed Income & Debt Instruments

* **Fixed Deposits (FD):** Track Principal, Rate, and Maturity Date.
  * *Alert:* "FD HNB #123 matures in 3 days."
* **Treasury Bonds & Bills:** Specialized input fields for Face Value, Discount Rate, and Yield.
* **Unit Trusts & Money Markets:** Track daily NAV changes and total value.

### 🧠 4. Lightweight Predictive AI (On-Device)

* **Goal:** Predict "End-of-Month Balance" and "Portfolio Trajectory" without bloating the app.
* **Technology:**  **TensorFlow Lite (TFLite)** .
* **Capabilities:**
  * **Expense Forecasting:** Analyzes past spending (e.g., rising electricity bills) to predict next month's costs.
  * **Wealth Projection:** A dotted line on your net worth chart showing where you'll likely be in 30 days based on current saving/spending trends.
  * *Privacy:* AI runs 100% locally on the device. No financial data leaves the phone.

### 📊 5. Dashboard & Reports

* **Net Worth Engine:** Real-time aggregation of `(Cash + Equity Value + Fixed Income Value) - Liabilities`.
* **Visuals:**
  * Donut Chart: Asset Allocation (e.g., 40% Stocks, 30% FDs, 30% Cash).
  * Bar Chart: Monthly Income vs. Expense.
* **Filters:** "Show me all *Grocery* expenses > 5000 LKR from  *Last Month* ."

---

## 📱 UI/UX Specifications

* **Theme:** "Cyber Finance" – Deep Black background, Card surfaces in Dark Grey (`#1E1E1E`), Text in White/Light Grey, Accents in **Lime Green** (Positive) and **Crimson Red** (Negative).
* **Responsiveness:**
  * *Mobile:* List views and vertical scrolling.
  * *Tablet:* Split-pane views (Menu on left, detailed charts/tables on right).

---

## 🛠 Tech Stack (Antigravity Standard)

* **Framework:** Flutter (Dart)
* **Architecture:** Clean Architecture with Antigravity
* **State Management:** Riverpod / Bloc
* **Auth:** Firebase Auth (Google Provider)
* **Database:** * *Local:* **Isar** or **Hive** (Super fast, perfect for transaction lists).
  * *Cloud:* Firestore (Optional backup).
* **AI:** `tflite_flutter` (running `.tflite` quantized models).

---

## 💾 Data Schema (Simplified)

**Dart**

```
// 1. Transaction (The base unit for Money In/Out)
class Transaction {
  final String id;
  final double amount;
  final TransactionType type; // INCOME, EXPENSE
  final String category; // "Groceries", "Light Bill", "Salary"
  final DateTime date;
  final String? note;
}

// 2. Asset (Abstract base for Investments)
abstract class Asset {
  final String name;
  final double investedAmount;
  final double currentValue;
}

// 3. StockPosition (Extends Asset)
class StockPosition extends Asset {
  final String symbol; // "JKH.N"
  final List<StockTrade> trades; // History of buys/sells
  double get averageBuyPrice => ...; // Calculated
  double get totalProfit => ...; // Calculated
}

// 4. FixedInstrument (Extends Asset)
class FixedInstrument extends Asset {
  final String type; // "FD", "TBond", "UnitTrust"
  final double interestRate;
  final DateTime maturityDate;
  bool get isMatured => DateTime.now().isAfter(maturityDate);
}
```

---

## 🚀 Build Instructions

### 1. Setup Environment

**Bash**

```
# Ensure Flutter is at latest stable
flutter upgrade

# Install Antigravity CLI (if applicable)
dart pub global activate antigravity_cli 
```

### 2. Initialization

**Bash**

```
# Clone
git clone https://github.com/your-repo/wealthorbit.git
cd wealthorbit

# Install dependencies & generate code
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Configure Google Auth

1. Go to **Firebase Console** -> Add Project.
2. Enable **Authentication** ->  **Google Sign-In** .
3. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).
4. Place them in `android/app/` and `ios/Runner/` respectively.

### 4. Run

**Bash**

```
flutter run
```

---

## 📅 Development Roadmap

**Phase 1: Foundation** 

* [ ] Antigravity Project Setup.
* [ ] Google Auth & Biometrics integration.
* [ ] "Wallet" Module: Create/Read/Update/Delete (CRUD) for Expenses (Groceries, Bills) and Income.

**Phase 2: The Investor**

* [ ] **Equity Module:** Implement complex logic for CSE stock trading (avg cost, profit calc).
* [ ] **Fixed Income Module:** Screens for FDs, T-Bonds, and Unit Trusts.
* [ ] Database wiring (Isar/Hive) for persistent storage.

**Phase 3: Intelligence & UI Polish**

* [ ] **Dashboard:** Aggregate data from Wallet + Investor modules into one Net Worth card.
* [ ] **AI Integration:** Train simple TFLite model on sample spending data and integrate "Forecast" widget.
* [ ] **Responsive Design:** Tweaking UI for Tablet layouts (split-screens).
