import 'package:flutter/material.dart';

class CategoryCardValues extends StatelessWidget {
  const CategoryCardValues(this._nameCategory, {super.key});

  final String _nameCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(236, 236, 236, 100),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 400,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Align(
                widthFactor: 1.1,
                heightFactor: 1.5,
                child: Text(
                  // Todo: Setando o nome que vai vir quando instanciar a classe
                  _nameCategory,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
