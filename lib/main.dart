import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'routes/home.dart';

/// Flutter code sample for NestedScrollView

// This example shows a [NestedScrollView] whose header is the combination of a
// [TabBar] in a [SliverAppBar] and whose body is a [TabBarView]. It uses a
// [SliverOverlapAbsorber]/[SliverOverlapInjector] pair to make the inner lists
// align correctly, and it uses [SafeArea] to avoid any horizontal disturbances
// (e.g. the "notch" on iOS when the phone is horizontal). In addition,
// [PageStorageKey]s are used to remember the scroll position of each tab's
// list.


void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HomeStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.