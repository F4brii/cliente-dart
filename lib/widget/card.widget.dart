import 'package:dart/models/bovine-model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final BovineModel bovine;

  CardWidget({@required this.bovine});

  @override
  Widget build(BuildContext context) {
    print('object');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          child: Column(
            children: [Container()],
          ),
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
