import 'package:flutter/material.dart';

import '../../../../index.dart';

class HomeBodyLeftChild extends StatefulWidget {
  const HomeBodyLeftChild({super.key});

  @override
  State<HomeBodyLeftChild> createState() => _HomeBodyLeftChildState();
}

class _HomeBodyLeftChildState extends State<HomeBodyLeftChild>
    with HomeBodyLeftChildMixin {
  @override
  Widget build(BuildContext context) {
    return const UserApartmanList();
  }
}
