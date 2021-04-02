import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for NestedScrollView

// This example shows a [NestedScrollView] whose header is the combination of a
// [TabBar] in a [SliverAppBar] and whose body is a [TabBarView]. It uses a
// [SliverOverlapAbsorber]/[SliverOverlapInjector] pair to make the inner lists
// align correctly, and it uses [SafeArea] to avoid any horizontal disturbances
// (e.g. the "notch" on iOS when the phone is horizontal). In addition,
// [PageStorageKey]s are used to remember the scroll position of each tab's
// list.

import 'package:flutter_demo/routes/customer_app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


/// This is the stateless widget that the main application instantiates.
class HomeStatelessWidget extends StatelessWidget {
  HomeStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = ['猜你喜欢', '今日特价', '发现好店'];
    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: Scaffold(
        appBar: CustomerAppBar(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverToBoxAdapter(
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                    decoration: BoxDecoration(color: Color(0xFFFFC300)),
                    child: Row(children: [
                      Expanded(
                          child: Column(
                        children: [
                          Icon(Icons.qr_code_scanner_outlined, size: 30),
                          Text('扫一扫')
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [Icon(Icons.payment, size: 30), Text('付款码')],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Icon(Icons.card_giftcard, size: 30),
                          Text('红包/卡劵')
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Icon(Icons.bike_scooter, size: 30),
                          Text('骑车')
                        ],
                      ))
                    ])),
              ),
              SliverToBoxAdapter(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
                // decoration: BoxDecoration(color: Colors.red),
                height: 220,
                child: new Swiper(
                  outer: false,
                  itemBuilder: (c, i) {
                    return new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [0, 1, 2, 3, 4].map((i) {
                              return Expanded(
                                child: new Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.car_rental,
                                      size: 30,
                                      color: Color(0xFFFFC300),
                                    ),
                                    Text('测试', style: TextStyle(fontSize: 10))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          Row(
                            children: [0, 1, 2, 3, 4].map((i) {
                              return Expanded(
                                child: new Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.threed_rotation,
                                      size: 30,
                                      color: Color(0xFFFFC300),
                                    ),
                                    Text('测试', style: TextStyle(fontSize: 10))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          Row(
                            children: [0, 1, 2, 3, 4].map((i) {
                              return Expanded(
                                child: new Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.article,
                                      size: 30,
                                      color: Color(0xFFFFC300),
                                    ),
                                    Text('测试', style: TextStyle(fontSize: 10))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 2,
                          )
                        ]);
                  },
                  pagination: new SwiperPagination(
                    builder: new DotSwiperPaginationBuilder(
                        size: 7,
                        activeSize: 7,
                        color: Color(0xFFefefef),
                        activeColor: Color(0xFFFFC300)),
                  ),
                  itemCount: 3,
                ),
              )),
              SliverToBoxAdapter(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 10, color: Color(0xFFFFC300)),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            children: [0, 1, 2, 3, 4].map((i) {
                              return Expanded(
                                child: new Column(
                                  children: <Widget>[
                                    Icon(Icons.search, size: 40),
                                    Text('测试',
                                        style: TextStyle(
                                            fontSize: 10,
                                            backgroundColor: Colors.green))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          Row(
                            children: [0, 1, 2, 3, 4].map((i) {
                              return Expanded(
                                child: new Column(
                                  children: <Widget>[
                                    Icon(Icons.search, size: 40),
                                    Text('测试',
                                        style: TextStyle(
                                            fontSize: 10,
                                            backgroundColor: Colors.green))
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ))),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
                  title: TabBar(
                    indicatorColor: Color(0xFFFFC300),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(color: Colors.black),
                    // These are the widgets to put in each tab in the tab bar.
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  // This Builder is needed to provide a BuildContext that is
                  // "inside" the NestedScrollView, so that
                  // sliverOverlapAbsorberHandleFor() can find the
                  // NestedScrollView.
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      // The "controller" and "primary" members should be left
                      // unset, so that the NestedScrollView can control this
                      // inner scroll view.
                      // If the "controller" property is set, then this scroll
                      // view will not be associated with the NestedScrollView.
                      // The PageStorageKey should be unique to this ScrollView;
                      // it allows the list to remember its scroll position when
                      // the tab view is not on the screen.
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber
                          // above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverToBoxAdapter(
                          child: new StaggeredGridView.countBuilder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 4,
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) =>
                                new Container(
                                    color: Color(0xFFFFC300),
                                    child: new Center(
                                      child: new CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: new Text('$index'),
                                      ),
                                    )),
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                                    2, index.isEven ? 2 : 2.5),
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFFFC300),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), title: Text('电商')),
            BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('消息')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
          ],
        ),
      ),
    );
  }
}
