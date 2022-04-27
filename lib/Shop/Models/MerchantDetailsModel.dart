class MerchantDetails {
  MerchantDetails({
    required this.id,
    required this.name,
    required this.userId,
    required this.ipay_88Id,
    required this.isActive,
    required this.logo,
    required this.banner,
    required this.code,
    required this.callbackUrl,
    required this.redirectUrl,
    required this.apikey,
    required this.instore,
    required this.onlineUrl,
    required this.getCategory,
    required this.getAddress,
    required this.getCashback,
  });
  late int id;
  late String name;
  late int userId;
  late String ipay_88Id;
  late int isActive;
  late String logo;
  late String banner;
  late String code;
  late String callbackUrl;
  late String redirectUrl;

  late String apikey;
  late String instore;
  late String onlineUrl;

  late List<GetCategory> getCategory;
  late List<GetMerchantAddress> getAddress;
  late List<GetCashback> getCashback;
}

class GetCategory {
  GetCategory({
    required this.id,
    required this.merchantId,
    required this.categoryId,
    required this.categoryDetailsname,
  });
  late int id;
  late int merchantId;
  late int categoryId;

  late String categoryDetailsname;
}

class GetMerchantAddress {
  GetMerchantAddress({
    required this.id,
    required this.merchantId,
    required this.branchName,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.landmark,
    required this.isActive,
     required this.city,
      required this.state,
       required this.country,
  });
  late int id;
  late int merchantId;
  late String branchName;
  late String address;
  late String longitude;
  late String latitude;
  late String landmark;
  late int isActive;
  late String city;
  late String state;
  late String country;
}

class GetCashback {
  GetCashback({
 required this.id,
    required this.percentage,
    required this.description,
  });
  late int id;
  late String percentage;
  late String description;
}
