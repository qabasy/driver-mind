// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:m_toast/m_toast.dart';

void showCustomDialog(
  BuildContext context, {
  final void Function()? onDeletePressed,
  required Widget content,
  String title = "Dialog",
  List<Widget>? actions,
  void Function()? onPressed,
}) {
  showDialog(
    traversalEdgeBehavior: TraversalEdgeBehavior.leaveFlutterView,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: content,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            IconButton(
              onPressed: () {
                if (onDeletePressed != null) {
                  onDeletePressed();
                  ShowMToast(context).successToast(
                    message: "Deletion Success",
                    alignment: Alignment.bottomCenter,
                  );
                }
              },
              icon: Icon(Icons.delete_forever_rounded),
              color: onDeletePressed != null
                  ? Theme.of(context).colorScheme.error
                  : null,
            ),
          ],
        ),
        elevation: 10,
        scrollable: true,
        buttonPadding: EdgeInsets.all(20),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.all(18),
        insetPadding: EdgeInsets.all(15),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        alignment: AlignmentDirectional.center,
        actions: actions,
      );
    },
  );
}
