class PromoDeals {
  PromoDeals({
    required this.id,
    required this.title,
    required this.getCampaignDetails,
  });
  late int id;
  late String title;

  late List<GetCampaignDetails> getCampaignDetails;
}

class GetCampaignDetails {
  GetCampaignDetails({
    required this.id,
    required this.merchantTitle,
    required this.logo,
    required this.banner,
    required this.inStore,
  });
  late int id;

  late String merchantTitle;

  late String banner;
  late String logo;
  late String inStore;
}
