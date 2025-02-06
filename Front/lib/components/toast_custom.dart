import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastCustom {
  static FToast fToast = FToast();
  static remove(BuildContext context) {
    fToast.init(context);
    fToast.removeCustomToast();
  }

  static showToast(BuildContext context, String msg) {
    remove(context);
    fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: const Color.fromRGBO(66, 66, 66, 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  msg,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        gravity: ToastGravity.CENTER,
        ignorePointer: true,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 25,
            left: 10,
            right: 10,
            child: child,
          );
        });
  }

  
}
