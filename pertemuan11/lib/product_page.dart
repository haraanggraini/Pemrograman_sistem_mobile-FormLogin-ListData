import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Buku Tulis', 'price': 5500},
    {'name': 'Buku Gambar', 'price': 6000},
    {'name': 'Pulpen', 'price': 2000},
    {'name': 'Pensil', 'price': 2000},
    {'name': 'Penggaris', 'price': 4000},
    {'name': 'Gunting', 'price': 7000},
    {'name': 'Penghapus', 'price': 1000},
    {'name': 'Buku Binder', 'price': 25000},
    {'name': 'Pensil Warna', 'price': 18000},
    {'name': 'Sampul Plastik', 'price': 12000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Produk'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: ProductList(products),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductList(this.products);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(products[index], index + 1);
      },
    );
  }
}

class ProductListItem extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productNumber;

  ProductListItem(this.product, this.productNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.white,
      child: ListTile(
        title: Row(
          children: [
            Text(
              '$productNumber',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product['name']}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 4.0), // Jarak antara nama produk dan harga
                  Row(
                    children: [
                      Text(
                        'Harga: ',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        'Rp. ${product['price'].toString()}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
          },
        ),
      ),
    );
  }
}
