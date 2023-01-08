import 'package:flutter/material.dart';

class CardValuesReleases extends StatelessWidget {
  const CardValuesReleases({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "03/01/2023",
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Align(
                  widthFactor: 1.1,
                  child: Text(
                    "Educandário Brasileirinho",
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Align(
                  widthFactor: 1,
                  child: Text("R\$ 12.235,00"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
