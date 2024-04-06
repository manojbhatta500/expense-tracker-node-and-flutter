import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/dashboard/bloc/get_product/get_product_list_bloc.dart';
import 'package:notes/dashboard/widgets/expensebox.dart';
import 'package:notes/dashboard/widgets/product_dialouge.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    BlocProvider.of<GetProductListBloc>(context).add(FetchingListevent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense tracker'),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: ((context) {
                  return ProductDialog(
                    title: "Add",
                  );
                }));
          },
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<GetProductListBloc, GetProductListState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case GetProductListFailed:
                return Center(
                  child: Text('product list failed method called'),
                );

              case GetProductListLoading:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case GetProductListInitial:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case GetProductListSuccess:
                final data = state as GetProductListSuccess;
                if (data.data.isEmpty) {
                  return Center(
                    child: Text('Add Data To Server'),
                  );
                } else {
                  return ListView.builder(
                      itemCount: data.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpenseBox(
                          data: data.data[index],
                        );
                      });
                }
              default:
                return Center(
                  child: Text('this is default state'),
                );
            }
          },
        ));
  }
}



//  Column(
//           children: [ExpenseBox()],
//         )