import 'package:flutter/material.dart';
import 'package:notes/dashboard/bloc/delete_product/delete_product_bloc.dart';
import 'package:notes/dashboard/bloc/get_product/get_product_list_bloc.dart';
import 'package:notes/dashboard/bloc/patch_product/patch_product_bloc.dart';
import 'package:notes/dashboard/bloc/post_product/post_product_bloc.dart';
import 'package:notes/dashboard/ui/dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductListBloc(),
        ),
        BlocProvider(
          create: (context) => PostProductBloc(),
        ),
        BlocProvider(
          create: (context) => DeleteProductBloc(),
        ),
        BlocProvider(
          create: (context) => PatchProductBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashBoard(),
      ),
    );
  }
}
