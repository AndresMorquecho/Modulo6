import 'package:flutter/material.dart';
import 'package:lista_clientes2/database_helper.dart';
import 'package:lista_clientes2/product.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProductFormState();
  }
}

class ProductFormState extends State<ProductForm> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final priceControlller = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Ingreso de Productos")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Precio'),
            ),
            TextField(
              controller: priceControlller,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  id: DateTime.now().millisecond,
                  name: nameController.text,
                  price: double.parse(priceControlller.text),
                  description: descriptionController.text,
                );
                DatabaseHelper().insertProductos(product);
                print('Producto ingreso en base de datos: ${product.name}');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Producto añadido con exito')),
                );
                Navigator.pop(context, true);
              },
              child: const Text('GRABAR'),
            ),
          ],
        ),
      ),
    );
  }
}
