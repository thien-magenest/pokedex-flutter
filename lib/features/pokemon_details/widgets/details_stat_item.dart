import 'package:flutter/material.dart';
import 'package:pokemon/common/theme/colors.dart';

class DetailsStatItem extends StatefulWidget {
  final String label;
  final int stat;

  const DetailsStatItem({
    super.key,
    required this.label,
    required this.stat,
  });

  @override
  State<DetailsStatItem> createState() => _DetailsStatItemState();
}

class _DetailsStatItemState extends State<DetailsStatItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.stat / 100).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            widget.label,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            height: 6,
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(3),
            ),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return FractionallySizedBox(
                  widthFactor: _animation.value,
                  child: Container(
                    color: widget.stat > 50
                        ? PokemonColors.green
                        : PokemonColors.red,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
