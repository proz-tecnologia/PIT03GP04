import 'package:flutter/material.dart';

class CardValuesHome extends StatelessWidget {
  const CardValuesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: const Color.fromRGBO(217, 217, 217, 100),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(0, 208, 58, 100),
              width: 3.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: InkWell(
            // ? Debug de teste
            onTap: () {
              Navigator.pushNamed(context, '/contas_receber');
            },
            child: SizedBox(
              width: 400,
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  ListTile(
                    minVerticalPadding: 20,
                    title: Text(
                      "RECEITA",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(0, 208, 58, 100),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "10.000,00",
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromRGBO(0, 208, 58, 100),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // ! Espaçamento entre um card e outro
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 0,
          color: const Color.fromRGBO(217, 217, 217, 100),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.red,
              width: 3.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: InkWell(
            // ? Debug de teste
            onTap: () => (debugPrint('DESPESA')),
            child: SizedBox(
              width: 5000,
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  ListTile(
                    minVerticalPadding: 20,
                    title: Text(
                      "DESPESA",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "10.000,00",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // !Espaçamento entre um card e outro
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 0,
          color: const Color.fromRGBO(217, 217, 217, 100),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(102, 102, 102, 100),
              width: 3.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: InkWell(
            // ? Debug de teste
            onTap: () => (debugPrint('SALDO')),
            child: SizedBox(
              width: 5000,
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  ListTile(
                    minVerticalPadding: 20,
                    title: Text(
                      "SALDO",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(102, 102, 102, 100),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "10.000,00",
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromRGBO(102, 102, 102, 100),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
