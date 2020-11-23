import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mBet/utils/const/dims.dart';
import 'package:mBet/utils/const/font_size.dart';

bool isNullOrEmpty(Object object) {
  if (object == null)
    return true;
  else if (object is List)
    return object.isEmpty;
  else
    return false;
}

hideDialog(BuildContext context) => Navigator.pop(context);
showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    child: AlertDialog(
      content: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CircularProgressIndicator(),
          Container(
            width: NORMAL_DIM,
          ),
          Text("Loading..."),
        ],
      ),
    ),
  );
}

showWarningDialog(BuildContext context, {String message = ''}) {
  showDialog(
    context: context,
    child: AlertDialog(
      title: Icon(
        Icons.warning_rounded,
        size: 50,
      ),
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'Pyidaungsu',
          fontSize: TEXT_REGULAR,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("OK"),
        )
      ],
    ),
  );
}

showErrorDialog(BuildContext context, {String message = ''}) {
  showDialog(
    context: context,
    child: AlertDialog(
      title: Icon(Icons.error_outline, size: 50, color: Colors.redAccent),
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'Pyidaungsu',
          fontSize: TEXT_REGULAR,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("OK"),
        )
      ],
    ),
  );
}

showSuccessDialog(BuildContext context, {String message = ''}) {
  showDialog(
    context: context,
    child: AlertDialog(
      title: Icon(
        Icons.check_box_rounded,
        color: Colors.green,
        size: 50,
      ),
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'Pyidaungsu',
          fontSize: TEXT_REGULAR,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("OK"),
        )
      ],
    ),
  );
}
