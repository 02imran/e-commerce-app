import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_full_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  final List<dynamic> imageList = [
    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          actions: [
            appBarCart(),
            SizedBox(width: 5),
            appBarProfile(),
          ],
        ),
        body: ListView(
          children: [
            _homeSlider(context),
            SizedBox(height: getProportionateScreenHeight(10)),
            _homeCategory(),
            SizedBox(height: getProportionateScreenHeight(10)),
            _homeProductHeader(title: 'Flash Sell'),
            SizedBox(height: getProportionateScreenHeight(10)),
            customHomeProduct(),
            SizedBox(height: getProportionateScreenHeight(10)),
            _homeProductHeader(title: 'Trending now'),
            SizedBox(height: getProportionateScreenHeight(10)),
            customHomeProduct(),
          ],
        ),
      ),
    );
  }

  Widget customHomeProduct() {
    return Column(
      children: [
        Container(
          height: SizeConfig.screenHeight / 4,
          child: ListView.builder(
            itemCount: imageList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Card(
                elevation: 5,
                child: Container(
                  width: getProportionateScreenWidth(140),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            imageList[index],
                            fit: BoxFit.cover,
                            height: getProportionateScreenHeight(120),
                            width: getProportionateScreenWidth(140),
                          ),
                          Positioned(
                            right: 0,
                            top: 5,
                            child: Container(
                              height: getProportionateScreenHeight(25),
                              width: getProportionateScreenWidth(50),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '30%',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 4, top: 4, right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '৳' + '5000',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '4.2',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Title goes heres'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Padding _homeProductHeader({String title, Function press}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(5)),
        color: Colors.green[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: press,
              child: Text(
                'See All',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _homeCategory() {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenHeight(5)),
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      height: getProportionateScreenHeight(130),
      decoration: BoxDecoration(color: Colors.green[100]),
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, inde) => Card(
          elevation: 3,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    height: getProportionateScreenHeight(70),
                    width: getProportionateScreenWidth(90),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1641113994135-a9f230b1f9b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Container(
                width: getProportionateScreenWidth(90),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                ),
                child: Center(
                    child: Text(
                  'test',
                  style: TextStyle(color: Colors.white),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeSlider(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.all(8),
        child: CarouselSlider.builder(
          itemCount: imageList.length,
          carouselController: _controller,
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
                print(index);
              },
              enlargeCenterPage: true,
              height: SizeConfig.defaultSize,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              reverse: true,
              aspectRatio: 2.5),
          itemBuilder: (context, i, id) {
            //for onTap to redirect to another screen
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                    )),
                //ClipRRect for image border radius
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageList[i],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                var url = imageList[i];
                print(url.toString());
              },
            );
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12.0,
              height: 12.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]
        // Container(
        //   color: Colors.amber,
        //   child: SizedBox(
        //     height: 20,
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: imageList.length,
        //       itemBuilder: (_, index) => Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Center(
        //             child: Container(
        //               margin: EdgeInsets.only(right: 5),
        //               height: 10,
        //               width: 10,
        //               decoration: BoxDecoration(
        //                   shape: BoxShape.circle, color: Colors.black),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // )

        );
  }

  Widget appBarCart() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(top: 7),
          padding: EdgeInsets.all(10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.green[300]),
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        Positioned(right: 5, top: 5, child: Text('0')),
      ],
    );
  }

  Widget appBarProfile() {
    return Container(
      // margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.green[300]),
      child: Icon(
        Icons.person,
        color: Colors.white,
      ),
    );
  }
}
