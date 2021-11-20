// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:ui' as ui;
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:image/image.dart' as img;

// class MapHelper {
//   static Future<BitmapDescriptor> getClusterBitmap(int size,
//       {String? imageUrl}) async {
//     try {
//       // final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//       // final Canvas canvas = Canvas(pictureRecorder);
//       // final offset = Offset(size / 2, size / 2);

//       // // final Paint paint1 = Paint()..color = Colors.red;
//       // // canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);

//       // final radius = size / 2;

//       // // The circle should be paint before or it will be hidden by the path
//       // Paint paintCircle = Paint()..color = Colors.yellow;
//       // Paint paintBorder = Paint()
//       //   ..color = Colors.white
//       //   ..strokeWidth = 2
//       //   ..style = PaintingStyle.stroke;
//       // canvas.drawCircle(offset, radius, paintCircle);
//       // canvas.drawCircle(offset, radius, paintBorder);

//       // final File markerImageFile =
//       //     await DefaultCacheManager().getSingleFile(imageUrl!);
//       // final Uint8List markerImageBytes = await markerImageFile.readAsBytes();

//       // var image = await loadUiImage(markerImageBytes);

//       // Path path = Path()
//       //   ..addOval(Rect.fromLTWH(size.toDouble(), size.toDouble(),
//       //       image.width.toDouble(), image.width.toDouble()));
//       // canvas.clipPath(path);
//       // canvas.drawImage(image, offset, Paint());

//       // // canvas.drawImageRect(image, src, dst, Paint());

//       // final data = await pictureRecorder.endRecording().toImage(200, 200);
//       // final finalResult = await data.toByteData(format: ui.ImageByteFormat.png);

//       // return BitmapDescriptor.fromBytes(finalResult!.buffer.asUint8List());
//       final File markerImageFile =
//           await DefaultCacheManager().getSingleFile(imageUrl!);
//       final Uint8List markerImageBytes = await markerImageFile.readAsBytes();

//       ui.Image image =
//           await resizeAndConvertImage(markerImageBytes, size, size);
//       return paintToCanvas(image, Size.zero);
//     } catch (e) {
//       print(e);
//       return defaultMarker(size);
//     }
//   }

//   static Canvas performCircleCrop(ui.Image image, Size size, Canvas canvas) {
//     // The circle should be paint before or it will be hidden by the path.
//     Paint paint = Paint();
//     canvas.drawCircle(Offset(0, 0), 0, paint);

//     // The image is already resized so no size is needed.
//     double drawImageWidth = 0;
//     double drawImageHeight = 0;

//     Path path = Path()
//       ..addOval(Rect.fromLTWH(drawImageWidth, drawImageHeight,
//           image.width.toDouble(), image.height.toDouble()));

//     canvas.clipPath(path);
//     canvas.drawImage(image, Offset(drawImageWidth, drawImageHeight), Paint());
//     return canvas;
//   }

//   static Future<ui.Image> loadUiImage(Uint8List list) async {
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(list, (img) {
//       return completer.complete(img);
//     });
//     return completer.future;
//   }

//   static Future<ui.Image> resizeAndConvertImage(
//     Uint8List data,
//     int height,
//     int width,
//   ) async {
//     img.Image baseSizeImage = img.decodeImage(data)!;
//     img.Image resizeImage = img.copyResizeCropSquare(baseSizeImage, height);

//     ui.Codec codec = await ui
//         .instantiateImageCodec(Uint8List.fromList(img.encodePng(resizeImage)));
//     ui.FrameInfo frameInfo = await codec.getNextFrame();
//     return frameInfo.image;
//   }

//   static Future<BitmapDescriptor> paintToCanvas(
//       ui.Image image, Size size) async {
//     final pictureRecorder = ui.PictureRecorder();
//     final canvas = Canvas(pictureRecorder);
//     final paint = Paint();
//     paint.isAntiAlias = true;

//     performCircleCrop(image, size, canvas);

//     final recordedPicture = pictureRecorder.endRecording();
//     ui.Image img = await recordedPicture.toImage(image.width, image.height);
//     final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
//     final buffer = byteData!.buffer.asUint8List();

//     return BitmapDescriptor.fromBytes(buffer);
//   }

//   static Future<BitmapDescriptor> defaultMarker(int size, {int? number}) async {
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint1 = Paint()..color = Colors.grey;

//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
//     if (number != null) {
//       TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
//       painter.text = TextSpan(
//         text: '$number',
//         style: TextStyle(
//             fontSize: size / 3,
//             color: Colors.white,
//             fontWeight: FontWeight.normal),
//       );
//       painter.layout();
//       painter.paint(
//         canvas,
//         Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
//       );
//     }

//     final img = await pictureRecorder.endRecording().toImage(size, size);
//     final data = await img.toByteData(format: ui.ImageByteFormat.png);

//     return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
//   }
// }
