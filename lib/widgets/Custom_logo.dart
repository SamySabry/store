import 'package:flutter/material.dart';

class Custom_logo extends StatelessWidget {
  const Custom_logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 50),
      child: Container(
        height: MediaQuery.of(context).size.height*0.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage('images/icons/buy100.png'),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'buy it',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}