import 'package:flutter/material.dart';

class NumberListPage extends StatefulWidget {
  const NumberListPage({super.key});

  static const routeName = '/number_list';

  @override
  State<NumberListPage> createState() => _NumberListPageState();
}

class _NumberListPageState extends State<NumberListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
