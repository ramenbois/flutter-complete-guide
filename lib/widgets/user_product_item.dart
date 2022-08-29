import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({
    Key? key,
    this.id,
    this.title,
    this.imageUrl,
  }) : super(key: key);

  final String? id;
  final String? title;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title!),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl!),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.purple,
              ),
            ),
            IconButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .deleteProduct(id!);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
