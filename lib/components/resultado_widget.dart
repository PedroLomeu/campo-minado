import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final Function() onReiniciar;

  Color _getCor() {
    if (venceu == null) {
      return Colors.yellow;
    } else if (venceu!) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  IconData _getIcon() {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    } else if (venceu!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  ResultadoWidget({this.venceu, required this.onReiniciar});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: onReiniciar(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
