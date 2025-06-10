import 'package:clientes_reto16/data_base_helper.dart';
import 'package:clientes_reto16/pages/client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;
  late DataBaseHelper databaseHelper;

  setUp(() {
    databaseHelper = DataBaseHelper();
  });

  test("Create cliente", () async {
    final newCliente = Client(
      id: 1,
      name: "TestClient",
      lastname: "TestLastName",
      email: "TestEmail",
    );

    await databaseHelper.insertClient(newCliente);

    var clients = await databaseHelper.getcliente();

    for (var allclients in clients) {
      print("${allclients.name}");
    }
  });

  test("Update producto", () async {
    final UpdateCliente = Client(
      id: 1,
      name: "UpdateCliente",
      lastname: "UpdateLastname",
      email: "updateemail",
    );

    await databaseHelper.updateClient(UpdateCliente);
    var clients = await databaseHelper.getcliente();

    for (var allclients in clients) {
      print("${allclients.name}");
    }
  });

  test("delete cliente", () async {
    await databaseHelper.deleteCliente(1);

    var clients = await databaseHelper.getcliente();

    for (var allclients in clients) {
      print("${allclients.name}");
    }
  });
}
