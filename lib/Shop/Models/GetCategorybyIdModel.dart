class GetCategoryMerchant {
  GetCategoryMerchant({
    required this.id,
    required this.name,
    required this.userId,
    required this.ipay_88Id,
    required this.isActive,
    required this.logo,
    required this.banner,
    required this.code,
    required this.apikey,
    required this.instore,
    required this.onlineUrl,
    required this.getCategory,
  });
  late int id;
  late String name;
  late int userId;
  late String ipay_88Id;
  late int isActive;
  late String logo;
  late String banner;
  late String code;

  late String apikey;
  late String instore;
  late String onlineUrl;

  late List<GetByIDMerchant> getCategory;
}

class GetByIDMerchant {
  GetByIDMerchant({

  
    required this.categoryId,
    required this.categoryDetailsName,
   
  });

 
  late int categoryId;

  late String categoryDetailsName;
 
}
