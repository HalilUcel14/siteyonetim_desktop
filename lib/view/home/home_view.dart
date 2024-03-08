import 'package:codeofland/codeofland.dart';
import 'package:codeofwidget/codeofwidget.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HoveViewState();
}

class _HoveViewState extends State<HomeView> with HomeViewMixin {
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKeys.of.homeKey,
      appBar: const HomeAppBar(),
      drawer: const HomeViewDrawer(),
      body: const HomeViewBody().padding(
        pad: SizeEnum.hexa.size.withPaddingAll,
      ),
      floatingActionButton: floatingButton(context),
    );
  }

  FloatingActionButton floatingButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.home),
      onPressed: () => context.customShowDialog(
        const FormViewDialog(child: ApartmentForm()),
      ),
    );
  }
}
