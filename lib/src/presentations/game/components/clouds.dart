

// class Clouds extends ParallaxComponent<FlappyBirdGame>
//     with HasGameRef<FlappyBirdGame> {
//   Clouds();

//   @override
//   Future<void> onLoad() async {
//     final image = await Flame.images.load(Assets.clouds);
//     position = Vector2(x, -(gameRef.size.y - Config.cloudsHeight));
//     parallax = Parallax([
//       ParallaxLayer(
//         ParallaxImage(image, fill: LayerFill.none),
//       ),
//     ]);
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     parallax?.baseVelocity.x = Config.gameSpeed;
//   }
// }
