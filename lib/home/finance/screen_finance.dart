import 'package:flutter/material.dart';
import 'package:news/bloc/news_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScreenFinance extends StatefulWidget {
  const ScreenFinance({super.key});

  @override
  State<ScreenFinance> createState() => _ScreenFinanceState();
}

class _ScreenFinanceState extends State<ScreenFinance> {
  final NewsBloc _newsBloc = NewsBloc();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    _newsBloc.getListNews1();
  }

  void _onRefresh() {
    Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() {
    Future.delayed(Duration(milliseconds: 1000));
  }
  @override
  void dispose() {
   _newsBloc.dispose()
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(),),
    );
  }
}
