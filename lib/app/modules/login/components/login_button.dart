import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function onPressed;
  final bool isValid;
  final String text;
  final bool loading;

  LoginButton({
    @required this.onPressed,
    @required this.isValid,
    @required this.text,
    @required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        if (loading)
          SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 50,
          decoration: BoxDecoration(
            color: loading
                ? Colors.transparent
                : isValid
                    ? Color.fromRGBO(201, 29, 69, 1)
                    : Colors.grey.shade400,
            borderRadius: new BorderRadius.circular(10),
            boxShadow: loading
                ? []
                : isValid
                    ? [
                        BoxShadow(
                          color: Color.fromRGBO(201, 29, 69, 1).withAlpha(100),
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                        )
                      ]
                    : [],
          ),
          child: loading
              ? SizedBox()
              : FlatButton(
                  color: Colors.transparent,
                  splashColor: Colors.grey.withAlpha(150),
                  textColor: Colors.black,
                  onPressed: isValid ? onPressed : null,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),
        ),
      ],
    );
  }
}
