class PaymentMethod {
  final String name;
  final String imagePath;

  PaymentMethod({required this.name, required this.imagePath});
}

List<PaymentMethod> paymentMethods = [
  PaymentMethod(
      name: 'Google Pay', imagePath: 'Assets/images/Payments/gpay.png'),
  PaymentMethod(name: 'UPI', imagePath: 'Assets/images/Payments/upi.png'),
  PaymentMethod(
      name: 'Wallets', imagePath: 'Assets/images/Payments/ewallet.png'),
  PaymentMethod(
      name: 'Credit / Debit / ATM Card',
      imagePath: 'Assets/images/Payments/credit.png'),
  PaymentMethod(
      name: 'Cash on Delivery', imagePath: 'Assets/images/Payments/cod.png'),
];
