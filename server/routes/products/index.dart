import 'package:dart_frog/dart_frog.dart';
import '../../entities/product.dart';

Future<Response> onRequest(RequestContext context) async {
  final products = [
    Product(
      id: 1,
      name: 'Product 1',
      description: 'Description 1',
      price: 100,
    ),
    Product(
      id: 2,
      name: 'Product 2',
      description: 'Description 2',
      price: 200,
    ),
    Product(
      id: 3,
      name: 'Product 3',
      description: 'Description 3',
      price: 300,
    ),
  ];

  if (context.request.method == HttpMethod.get) {
    return Response.json(
      body: products,
      headers: {'hty-custom-header': 'hty-custom-value'},
    );
  } else if (context.request.method == HttpMethod.post) {
    final request = context.request;
    final dynamic body = await request.json();

    if (body == null) {
      return Response(
        statusCode: 201,
        body: 'Created',
      );
    }

    final name = (body as Map<String, dynamic>)['name'].toString();
    final description = body['description'].toString();
    final price = double.parse(body['price'].toString());

    final newProduct = Product(
      id: products.length + 1,
      name: name,
      description: description,
      price: price,
    );

    products.add(newProduct);

    return Response.json(
      body: newProduct,
      statusCode: 201,
    );
  } else if (context.request.method == HttpMethod.delete) {
    return Response(
      body: 'OK',
    );
  } else if (context.request.method == HttpMethod.put) {
    final request = context.request;
    final dynamic body = await request.json();

    if (body == null) {
      return Response(
        body: 'OK',
      );
    }

    final newName = (body as Map<String, dynamic>)['name'].toString();
    final newDescription = body['description'].toString();
    final newPrice = double.parse(body['price'].toString());

    return Response.json(
      body: Product(
        id: 1,
        name: newName,
        description: newDescription,
        price: newPrice,
      ),
    );
  } else {
    return Response(body: 'Unsupported method');
  }
}
