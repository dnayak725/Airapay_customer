// ignore_for_file: prefer_const_constructors

import 'package:aira_pay/Shop/Providers/HomeSliderProvider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderCarousel extends StatefulWidget {
  const SliderCarousel({Key? key}) : super(key: key);

  @override
  State<SliderCarousel> createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  @override
  int pageIndex = 0;
  Widget build(BuildContext context) {
    return Consumer<HomesliderProvider>(builder: (context, imgData, child) {
      return imgData.HomesliderData.slider.length != 0
          ? Column(
              children: [
                CarouselSlider.builder(
                  itemCount: imgData.images.length,
                  options: CarouselOptions(
                    height: 155,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    viewportFraction: 1,
                  ),
                  itemBuilder: (context, index, realIdx) {
                    String slides = imgData.HomesliderData.slider[index].banner;
                    String slides_text =
                        imgData.HomesliderData.slider[index].title;
                    return Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              // child: Image.network(images[index],
                              //     fit: BoxFit.cover, width: 1000)),
                              child: FadeInImage.assetNetwork(
                                  height: 155,
                                  placeholder:
                                      "assets/images/slider-loader.gif",
                                  image: slides,
                                  fit: BoxFit.cover,
                                  width: 1000),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                height: 155,
                              ),
                            ),
                            Positioned(
                              top: 35,
                              left: 60,
                              child: Text(
                                slides_text,
                                style: TextStyle(
                                    fontSize: app_tittle,
                                    color: Color(white_color),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CarouselIndicator(
                  width: 6.0,
                  height: 6.0,
                  color: Color(text_grey),
                  activeColor: Color(primary_color),
                  count: imgData.images.length,
                  index: pageIndex,
                ),
              ],
            )
          : Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(6),
                  child: Image.asset("assets/images/loading-preview.gif",
                      width: 138, height: 140, fit: BoxFit.fitWidth),
                ),
              ),
            );
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    _getmobilenumber();
  }

  _getmobilenumber() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var Token = sharedPreferences.getString(
      "AuthToken",
    );
    var userId = sharedPreferences.getString(
      "UserId",
    );
    var tokenparam = {"token": Token, "user_id": userId};
    await Provider.of<HomesliderProvider>(context, listen: false)
        .Homesliderfetch(tokenparam);
  }
}
