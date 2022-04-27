class PersonaliseCategoryModel {
  PersonaliseCategoryModel({
    required this.status,
    required this.categories,
  });
  late String status;
  late List<Categories> categories;
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.image,
    required this.active,
    required this.url,
 
  });
  late int id;
  late String name;
  late String description;
  late String logo;
  late String image;
  late int active;
  late String url;

}
