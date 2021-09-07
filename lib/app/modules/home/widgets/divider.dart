import 'package:flutter/material.dart';

class Pemisah extends StatelessWidget {
  const Pemisah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 20,
      endIndent: 20,
      thickness: 0.8,
      color: Colors.black,
    );
  }
}
