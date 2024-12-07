import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sell_your_crop/core/networking/di/dependency_injection.dart';

class PickImageUtils {
  factory PickImageUtils() {
    return _instance;
  }

  const PickImageUtils._();

  static const PickImageUtils _instance = PickImageUtils._();

  Future<XFile?> pickSingleImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        return XFile(image.path);
      }
      return null;
    } catch (e) {
      await _handlePermissionError(e);
    }
    return null;
  }

  Future<List<XFile>?> pickMultipleImages() async {
    try {
      final images = await ImagePicker().pickMultiImage();

      if (images.isNotEmpty) {
        return images;
      }
      return null;
    } catch (e) {
      await _handlePermissionError(e);
    }
    return null;
  }

  Future<void> _handlePermissionError(dynamic e) async {
    final permissionStatus = await Permission.photos.status;

    if (permissionStatus.isDenied) {
      await _showAlertPermissionsDialog();
    } else {
      debugPrint('Image Exception ==> $e');
    }
  }

  Future<void> _showAlertPermissionsDialog() {
    return showCupertinoDialog(
      context: getIt<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: openAppSettings,
              child: Text('Settings'),
            ),
          ],
        );
      },
    );
  }
}