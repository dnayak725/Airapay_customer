class CheckSpendingLimit {
  CheckSpendingLimit({
    required this.id,
    required this.spendingLimit,
    required this.installments,
  });
  late final int id;

  late final String spendingLimit;
  late final int installments;
}
