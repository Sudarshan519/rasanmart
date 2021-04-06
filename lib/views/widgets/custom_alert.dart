import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String message, String heading,
      String buttonAcceptTitle, String buttonCancelTitle) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(buttonCancelTitle),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text(buttonAcceptTitle),
      onPressed: () {

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(heading),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }