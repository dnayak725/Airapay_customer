class MerchantSearch {
  MerchantSearch({
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
    required this.merchantRateId,
    required this.merchantRateId_2,
    required this.merchantRateId_3,
    required this.parentId,
    required this.merchantRateId_6,
    required this.apikey,
    required this.instore,
    required this.onlineUrl,
    required this.getCategory,
  });
   int id;
   String name;
   int userId;
   String ipay_88Id;
   int isActive;
   String logo;
   String banner;
   String code;
   String callbackUrl;
   String redirectUrl;
   int merchantRateId;
   int merchantRateId_2;
   int merchantRateId_3;
   int parentId;
   int merchantRateId_6;
   String apikey;
   String instore;
   String onlineUrl;
   List<GetSearchCategory> getCategory;
}

class GetSearchCategory {
  GetSearchCategory({
    required this.id,
    required this.categoryDetailsname,
  });
   int id;
   String categoryDetailsname;
}
