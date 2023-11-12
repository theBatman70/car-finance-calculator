int parseAmountIntoInt(String priceText) {
  try {
    final numericText = priceText.replaceAll(RegExp(r'[^0-9]'), '');
    int amount = int.parse(numericText);
    print(amount);

    if (amount <= 0) {
      // Handle the case where the parsed value is 0 or negative
      // You can show an error message or take another appropriate action
      return -1; // Return null to indicate an error
    }

    return amount;
  } on FormatException {
    // Handle the parsing error gracefully, e.g., show an error message to the user
    return -1; // Return null to indicate an error
  }
}

double parseAmountIntoDouble(String numericText) {
  try {
    double number = double.parse(numericText);
    print(number);

    if (number <= 0) {
      // Handle the case where the parsed value is 0 or negative
      // You can show an error message or take another appropriate action
      return -1; // Return null to indicate an error
    }

    return number;
  } on FormatException {
    // Handle the parsing error gracefully, e.g., show an error message to the user
    return -1; // Return null to indicate an error
  }
}
