class CustomerDetails {
  CustomerDetails({
    required this.id,
    required this.email,
    required this.profilepic,
    required this.customerName,
    required this.phoneNumber,
    required this.gender,
    required this.getIntrestCategory,
    required this.getFavMerchant,
  });
  int id;
  String email;
  String profilepic;
  String customerName;
  String phoneNumber;
  String gender;

  List<GetIntrestCategory> getIntrestCategory;
  List<GetFavMerchant> getFavMerchant;
}

class GetIntrestCategory {
  GetIntrestCategory({
    required this.catId,
  });
  int catId;
}

class GetFavMerchant {
  GetFavMerchant({
    required this.merchantId,
    required this.merchantName,
    required this.merchantlogo,
    required this.getCategory,
    required this.getCashback,
  });
  int merchantId;
  String merchantName;
  String merchantlogo;
  List<GetCat> getCategory;
  List<GetCashback> getCashback;
}

class GetCat {
  GetCat({
    required this.categoryName,
  });
  String categoryName;
}

class GetCashback {
  GetCashback({
    required this.cashbackId,
  });
  int cashbackId;
}
