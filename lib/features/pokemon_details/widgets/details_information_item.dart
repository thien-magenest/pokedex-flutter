import 'package:flutter/material.dart';

class DetailsInformationItem extends StatelessWidget {
  final String label;
  final Widget child;

  const DetailsInformationItem({
    super.key,
    required this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '$label:',
              style: const TextStyle(color: Colors.black54),
            )),
        Expanded(flex: 7, child: child)
      ],
    );
  }
}
