class PricingCalculator {
//Get shipping Cost
  static double getShippingCost(String location) {
    return 5.00;
  }

//Get Tax Rate for Location
  static double getTaxRateForLocation(String location) {
    return 0.10;
  }

//Calculate price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingcost = getShippingCost(location);
    double totlPrice = productPrice + taxAmount + shippingcost;
    return totlPrice;
  }

  //Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  // Calculate Tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }
}
