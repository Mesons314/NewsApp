import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget{
  final image, categoryName;
  const CategoryTile(this.categoryName,this.image, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 120,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black26
            ),
            child: Center(
                child: Text(
                  categoryName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
            ),
          )
        ],
      ),
    );
  }

}
