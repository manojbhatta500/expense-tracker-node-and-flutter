import 'package:flutter/material.dart';
import 'package:notes/dashboard/model/product.dart';
import 'package:notes/dashboard/widgets/delete_dialouge.dart';
import 'package:notes/dashboard/widgets/edit_dialouge.dart';
import 'package:notes/dashboard/widgets/product_dialouge.dart';

class ExpenseBox extends StatelessWidget {
  const ExpenseBox({super.key, required this.data});

  final ProductClass data;

  void onPressed() {
    print(1 + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      color: Colors.black45.withOpacity(0.7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            data.price.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            data.name!,
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return EditDialouge(data: data);
                      }));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return DeleteProductDialog(
                          product: data,
                        );
                      }));
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
