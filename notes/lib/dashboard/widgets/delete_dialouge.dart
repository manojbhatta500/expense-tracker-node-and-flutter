import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/dashboard/bloc/delete_product/delete_product_bloc.dart';
import 'package:notes/dashboard/bloc/get_product/get_product_list_bloc.dart';
import 'package:notes/dashboard/model/product.dart';
import 'package:notes/dashboard/ui/dashboard.dart';

class DeleteProductDialog extends StatelessWidget {
  final ProductClass product;

  const DeleteProductDialog({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Product?'),
      content: Text('Are you sure you want to delete : "${product.name}"?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<DeleteProductBloc>(context)
                .add(OnDeleteButtonPressedEvent(id: product.sId!));
            BlocProvider.of<GetProductListBloc>(context)
                .add(FetchingListevent());
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => DashBoard()));
          },
          child: const Text(
            'Delete',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
