abstract class Formatter {
  String formatCurrency(double amount);
}

class FormatterImpl implements Formatter {
  @override
  String formatCurrency(double amount) => '$amount септимов';
}