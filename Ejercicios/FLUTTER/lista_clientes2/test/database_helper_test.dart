import 'package:flutter_test/flutter_test.dart';
import 'package:lista_clientes2/database_helper.dart';
import 'package:lista_clientes2/product.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  late DatabaseHelper databaseHelper;

  setUp(() {
    databaseHelper = DatabaseHelper();
  });

  test('insert product', () async {
    var product = Product(
      id: 1,
      name: 'Test Product',
      price: 9.99,
      description: "Test Description",
    );
    await databaseHelper.insertProductos(product);
    var products = await databaseHelper.getproduct();

    for (var product in products) {
      print(
        'ID: ${product.id} Name: ${product.name} Price: ${product.price} Description: ${product.description} ',
      );
    }
  });

  test("Update producto", () async {
    var product = Product(
      id: 2,
      name: "Test Update",
      price: 20,
      description: "Update Description",
    );
    await databaseHelper.updateProducts(product);
    var productos = await databaseHelper.getproduct();

    for (var producto in productos) {
      print(
        "ID: ${producto.id} NAME: ${producto.name} price: ${producto.price} description: ${producto.description}  ",
      );
    }
  });

  test("Delete producto", () async {
    await databaseHelper.deleteProduct(1);
    var productos = await databaseHelper.getproduct();

    for (var producto in productos) {
      print(
        "ID: ${producto.id} NAME: ${producto.name} price: ${producto.price} description: ${producto.description}  ",
      );
    }
  });
}
