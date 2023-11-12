import 'package:flutter/material.dart';
import 'dart:math';

class LoanOption with ChangeNotifier {
  late int _carPrice;

  late int _downPayment;
  late double _apr;
  late int _timePeriod;

  late double monthlyPayment;
  late double totalInterestPaid;
  late double costOfLoan;

  bool isEntered = false;

  int get carPrice => _carPrice;

  set carPrice(int value) {
    _carPrice = value;
    notifyListeners();
  }

  int get downPayment => _downPayment;

  set downPayment(int value) {
    _downPayment = value;
    notifyListeners();
  }

  double get apr => _apr;

  set apr(double value) {
    _apr = value;
    notifyListeners();
  }

  int get timePeriod => _timePeriod;

  set timePeriod(int value) {
    _timePeriod = value;
    notifyListeners();
  }

  void calculateLoanDetails() {
    // Calculate the loan amount
    double loanAmount = (carPrice - downPayment).toDouble();

    // Calculate the monthly payment
    double monthlyInterestRate = (apr / 12 / 100);
    int totalMonths = timePeriod;

    // Use the pow function correctly
    monthlyPayment = loanAmount *
        monthlyInterestRate /
        (1 - pow(1 + monthlyInterestRate, -totalMonths));

    print(monthlyPayment);

    // Calculate the total interest paid
    totalInterestPaid = (monthlyPayment * totalMonths - loanAmount);

    // Calculate the cost of the loan
    costOfLoan = loanAmount + totalInterestPaid;
    notifyListeners();
  }
}
