import 'package:dart_frog/dart_frog.dart';
import '../../entities/product.dart';

List<Product> products = [
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

Response onRequest(
  RequestContext context,
  String id,
) {
  final product = products.firstWhere(
    (element) => element.id == int.parse(id),
    orElse: () => Product(
      id: 0,
      name: '',
      description: '',
      price: 0,
    ),
  );

  if (product.id == 0) {
    return Response.json(
      statusCode: 404,
      body: {
        'message': 'Not Found',
      },
    );
  }

  return Response.json(body: product.toJson());
}
