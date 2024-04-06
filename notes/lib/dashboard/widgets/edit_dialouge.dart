import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/dashboard/bloc/get_product/get_product_list_bloc.dart';
import 'package:notes/dashboard/bloc/patch_product/patch_product_bloc.dart';
import 'package:notes/dashboard/bloc/post_product/post_product_bloc.dart';
import 'package:notes/dashboard/model/product.dart';
import 'package:notes/dashboard/ui/dashboard.dart';

class EditDialouge extends StatefulWidget {
  final ProductClass data;

  const EditDialouge({Key? key, required this.data}) : super(key: key);

  @override
  State<EditDialouge> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<EditDialouge> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${widget.data.name} Expense'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Avoid excessive vertical space
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product name.';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price.';
                }
                try {
                  int.parse(value);
                  return null;
                } catch (e) {
                  return 'Please enter a valid price.';
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final name = _nameController.text;
              final price = int.parse(_priceController.text);
              // hitPostApi(name, price, id);
              BlocProvider.of<PatchProductBloc>(context).add(
                  OnPatchProductEvent(
                      id: widget.data.sId!, name: name, price: price));

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashBoard()));
              BlocProvider.of<GetProductListBloc>(context)
                  .add(FetchingListevent());
            }
          },
          child: const Text('Send'),
        ),
      ],
    );
  }
}
