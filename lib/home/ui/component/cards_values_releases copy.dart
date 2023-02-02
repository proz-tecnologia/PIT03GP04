import 'package:flutter/material.dart';

class CardValuesReleases extends StatefulWidget {
  const CardValuesReleases({super.key});

  @override
  State<CardValuesReleases> createState() => _CardValuesReleasesState();
}

class _CardValuesReleasesState extends State<CardValuesReleases> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 236, 236, 100),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 400,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Align(
                      widthFactor: 1.1,
                      heightFactor: 1.5,
                      child: Text(
                        "Educandário Brasileirinho",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Align(
                      widthFactor: 1.4,
                      heightFactor: 1.6,
                      child: Text(
                        "Escola",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Align(
                      widthFactor: 1.3,
                      heightFactor: 1.4,
                      child: Text(
                        "03/01/2023",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Align(
                      widthFactor: 1.3,
                      heightFactor: 1.6,
                      child: Text(
                        "R\$ 12.235,00",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
