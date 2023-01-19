import 'package:flutter/material.dart';

class FlutterColorPicker extends StatefulWidget {
  FlutterColorPicker({
    Key? key,
    required this.onTap,
    this.initialColor,
    this.title = 'Choose Color',
    List<Color>? colors,
  }) : super(key: key) {
    this.colors = colors ??
        Colors.primaries.map((MaterialColor color) {
          return color.shade500;
        }).toList();
  }

  final Color? initialColor;
  final void Function(Color) onTap;
  final String title;
  late final List<Color> colors;

  @override
  State<FlutterColorPicker> createState() => _FlutterColorPickerState();
}

class _FlutterColorPickerState extends State<FlutterColorPicker> {
  late Color? selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.title),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 75.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: widget.colors.length,
              itemBuilder: (BuildContext context, int index) {
                return _Dot(
                  color: widget.colors[index],
                  isSelected: widget.colors[index] == selectedColor,
                  onTap: (Color color) {
                    setState(() {
                      selectedColor = color;
                    });
                    widget.onTap(color);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final void Function(Color) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(color),
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(),
        ),
        child: Center(
          child: isSelected
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
