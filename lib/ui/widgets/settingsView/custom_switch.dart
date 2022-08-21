import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomSwitch extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  final bool value;
  const CustomSwitch({
    Key? key,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? activeColor = Theme.of(context).colorScheme.tertiary;
    Color? inactiveColor = Theme.of(context).colorScheme.secondary;
    return GestureDetector(
      onTap: () {
        onChanged(!value);
        Fluttertoast.showToast(msg: 'Rooted: ${!value}');
      },
      child: SizedBox(
        height: 25,
        width: 50,
        child: Stack(
          children: [
            AnimatedContainer(
              height: 25,
              width: 50,
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25.0),
                ),
                color: !value ? activeColor : inactiveColor,
              ),
            ),
            AnimatedAlign(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
              alignment: !value ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                height: 20,
                width: 20,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}