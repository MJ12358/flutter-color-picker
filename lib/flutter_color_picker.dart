import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({
    Key? key,
    required this.initialColor,
    required this.onTap,
  }) : super(key: key);

  final int initialColor;
  final void Function(int) onTap;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  late int selectedColor;

  static List<Color> get _colors => Colors.primaries.map((MaterialColor color) {
        return color.shade500;
      }).toList();

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Choose Color'),
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
              itemCount: _colors.length,
              itemBuilder: (BuildContext context, int index) {
                return _Dot(
                  color: _colors[index],
                  selectedColor: Color(selectedColor),
                  onTap: (int value) {
                    setState(() {
                      selectedColor = value;
                    });
                    widget.onTap(value);
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
    required this.selectedColor,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final Color selectedColor;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(color.value),
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(),
        ),
        child: Center(
          child: color == selectedColor
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
