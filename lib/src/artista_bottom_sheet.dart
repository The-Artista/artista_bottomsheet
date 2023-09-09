import 'package:flutter/material.dart';

class ArtistaBottomSheet {
  final BuildContext context;
  final Widget child;
  double? height;
  bool? isBarIcon;
  bool? isDismissible;

  ArtistaBottomSheet({
    required this.context,
    required this.child,
    this.height,
    this.isBarIcon = true,
    this.isDismissible = true,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible ?? true,
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pop(context);
          },
          child: GestureDetector(
            onTap: () {},
            child: DraggableScrollableSheet(
              initialChildSize: height ?? 0.6,
              minChildSize: height ?? 0.3,
              builder: (context, scrollController) => DecoratedBox(
                decoration: BoxDecoration(
                  color: true /// TODO: condition based on theme data
                      ? Colors.white
                      : Colors.black,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: ListView(
                  controller: isDismissible == true ? scrollController : null,
                  children: [
                    if (isBarIcon == true)
                      Icon(
                        Icons.remove,
                        color: Colors.grey[600],
                      ),
                    child
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
