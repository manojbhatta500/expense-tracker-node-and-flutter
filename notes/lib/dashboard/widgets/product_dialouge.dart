import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/dashboard/bloc/post_product/post_product_bloc.dart';
import 'package:notes/dashboard/ui/dashboard.dart';

class ProductDialog extends StatefulWidget {
  final String title;

  const ProductDialog({Key? key, required this.title}) : super(key: key);

  @override
  State<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void hitPostApi(String name, int id) {
    BlocProvider.of<PostProductBloc>(context)
        .add(OnPostProductEvent(name: name, price: id));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${widget.title} Expense'),
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
              hitPostApi(name, price);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashBoard()));
            }
          },
          child: const Text('Send'),
        ),
      ],
    );
  }
}
