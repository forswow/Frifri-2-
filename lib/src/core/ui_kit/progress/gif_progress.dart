import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class GifProgress extends StatelessWidget {
  const GifProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Gif(
      image: const AssetImage('assets/gif/plane2.gif'),
      width: 100,
      height: 100,
      fps: 8,
      autostart: Autostart.loop,
    );
  }
}
