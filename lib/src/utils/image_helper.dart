import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageHelper {
  ImageHelper({ImagePicker? imagePicker, ImageCropper? imageCropper})
      : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCropper = imageCropper ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  Future<List<XFile>> pickImage(
      {ImageSource source = ImageSource.gallery,
      int imageQuality = 100,
      bool multiple = false}) async {
    if (multiple) {
      return await _imagePicker.pickMultiImage(imageQuality: imageQuality);
    }

    final file = await _imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );

    if (file != null) return [file];
    return [];
  }

  Future<CroppedFile?> crop({
    required XFile file,
    CropStyle cropStyle = CropStyle.rectangle,
    int maxHeight = 500,
    int maxWidth = 500,
    double ratioX=1.0,
    double ratioY=1.0,
  }) async =>
      await _imageCropper.cropImage(
        sourcePath: file.path,
        cropStyle: cropStyle,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY)
      );
}
