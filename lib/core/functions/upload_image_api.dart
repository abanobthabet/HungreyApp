import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<MultipartFile> upLoadImagetoapi(XFile image) async {
  return await MultipartFile.fromFile(image.path, filename: image.name);
}
