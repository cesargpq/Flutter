import 'package:flutter/material.dart';
import 'package:weather/ui/cities/cites_page.dart';
import 'package:weather/ui_constants/ui_constants.dart';

class HomePage extends StatelessWidget {
  void handleNavigateTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CitiesPages(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            'assets/welcome.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: maxPageWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(
                    height: 30.0,
                  ),
                  Image.asset(
                    'assets/viru.png',
                    height: 100.0,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Innovadores,\npor Naturaleza',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Qué te parece si conocemos un poco más de nuestros productos?',
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  RaisedButton(
                    color: Colors.white,
                    elevation: 0,
                    splashColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: Text('Empecemos'),
                    onPressed: () => handleNavigateTap(context),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
