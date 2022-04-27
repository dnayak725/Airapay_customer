class HomeSliderModel {
  HomeSliderModel({
    required this.status,
    required this.slider,
  });
  late String status;
  late List<SLiderData> slider;


}

class SLiderData {
  SLiderData({
    required this.id,
    required this.title,
    required this.banner,
    required this.webUrl,
    required this.mobileUrl,
    required this.status,
 
  });
  late int id;
  late String title;
  late String banner;
  late String webUrl;
  late String mobileUrl;
  late String status;



  
}
