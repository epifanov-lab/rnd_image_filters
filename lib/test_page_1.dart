import 'package:flutter/material.dart';

class TestPage1 extends StatelessWidget {
  const TestPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              ..._buildImageList(5, Colors.blue, BlendMode.clear),
              ..._buildImageList(5, Colors.blue, BlendMode.src),
              ..._buildImageList(5, Colors.blue, BlendMode.dst),
              ..._buildImageList(5, Colors.blue, BlendMode.srcOver),
              ..._buildImageList(5, Colors.blue, BlendMode.dstOver),
              ..._buildImageList(5, Colors.blue, BlendMode.srcIn),
              ..._buildImageList(5, Colors.blue, BlendMode.dstIn),
              ..._buildImageList(5, Colors.blue, BlendMode.srcOut),
              ..._buildImageList(5, Colors.blue, BlendMode.dstOut),
              ..._buildImageList(5, Colors.blue, BlendMode.srcATop),
              ..._buildImageList(5, Colors.blue, BlendMode.dstATop),
              ..._buildImageList(5, Colors.blue, BlendMode.xor),
              ..._buildImageList(5, Colors.blue, BlendMode.plus),
              ..._buildImageList(5, Colors.blue, BlendMode.modulate),
              ..._buildImageList(5, Colors.blue, BlendMode.screen),
              ..._buildImageList(5, Colors.blue, BlendMode.overlay),
              ..._buildImageList(5, Colors.blue, BlendMode.darken),
              ..._buildImageList(5, Colors.blue, BlendMode.lighten),
              ..._buildImageList(5, Colors.blue, BlendMode.colorDodge),
              ..._buildImageList(5, Colors.blue, BlendMode.colorBurn),
              ..._buildImageList(5, Colors.blue, BlendMode.hardLight),
              ..._buildImageList(5, Colors.blue, BlendMode.softLight),
              ..._buildImageList(5, Colors.blue, BlendMode.difference),
              ..._buildImageList(5, Colors.blue, BlendMode.exclusion),
              ..._buildImageList(5, Colors.blue, BlendMode.multiply),
              ..._buildImageList(5, Colors.blue, BlendMode.hue),
              ..._buildImageList(5, Colors.blue, BlendMode.saturation),
              ..._buildImageList(5, Colors.blue, BlendMode.color),
              ..._buildImageList(5, Colors.blue, BlendMode.luminosity),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildImageList(int count, Color color, BlendMode blendMode) {
    return [
      const SizedBox(height: 24),
      Text(
        "${blendMode.toString().toUpperCase()}, Color: blue",
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
      SizedBox(
        height: 136 * 0.66,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: count,
          itemBuilder: (context, index) {
            var opacity = _calcOpacity(count, index);
            return _buildImageItem(
              _getColorFilter(count, index, color, blendMode, opacity),
              opacity,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 4),
        ),
      )
    ];
  }

  Widget _buildImageItem(
    ColorFilter filter,
    double opacity,
  ) {
    return Stack(
      children: [
        SizedBox(
          width: 232 * 0.66,
          height: 136 * 0.66,
          child: ColorFiltered(
            colorFilter: filter,
            child: Image.asset('assets/img/test_image_1.png'),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(4),
          child: Text(
            "$opacity",
            style: const TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.w800,
              fontSize: 10,
            ),
          ),
        )
      ],
    );
  }

  ColorFilter _getColorFilter(
    int count,
    int index,
    Color color,
    BlendMode blendMode,
    double opacity,
  ) {
    return ColorFilter.mode(
      color.withOpacity(opacity),
      blendMode,
    );
  }

  double _calcOpacity(int count, int index) {
    if (index == 0) {
      return 1;
    } else if (index == count) {
      return 0;
    }
    return 1 - 1 / (count - index);
  }
}
