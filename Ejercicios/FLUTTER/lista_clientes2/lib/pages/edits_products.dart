import 'package:flutter/material.dart';
import 'package:lista_clientes2/database_helper.dart';
import 'package:lista_clientes2/product.dart';

class Editsproducts extends StatefulWidget {
  final Product product;
  const Editsproducts({super.key, required this.product});

  @override
  State<StatefulWidget> createState() {
    return EditsproductsState();
  }
}

class EditsproductsState extends State<Editsproducts> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product.name);
    priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
    descriptionController = TextEditingController(
      text: widget.product.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edición de Productos"),
        leading: Icon(Icons.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "First Name",
                prefixIcon: Icon(Icons.abc),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: "Price",
                hintText: "0.0",
                prefix: Icon(Icons.money),
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                hintText: "Description Product",
                prefix: Icon(Icons.abc),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final productUpdate = Product(
                  id: widget.product.id,
                  name: nameController.text,
                  price: double.parse(priceController.text),
                  description: descriptionController.text,
                );

                await DatabaseHelper().updateProducts(productUpdate);
                print("Producto Update: ${productUpdate.name}");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Producto UPdate")),
                );
                Navigator.pop(context, true);
              },
              child: Column(
                children: [Text("Product Update"), Icon(Icons.check)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
