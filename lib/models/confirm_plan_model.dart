class ConfirmPlanModel {
  final String title;
  final String price;
  final String credits;
  final String plan_id;
  final List<String> benefits;

  const ConfirmPlanModel({
    required this.title,
    required this.price,
    required this.credits,
    required this.plan_id,
    this.benefits = const [
      'Investor Connections',
      'Create Funding Posts',
      'Company for Sale listing',
    ],
  });
}
