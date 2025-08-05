import 'dart:ui' show Color;

extension ColorBlendExtension on Color{
  Color addColor(Color other, double factor){
    return Color.lerp(this, other, factor)!;
  }
}
