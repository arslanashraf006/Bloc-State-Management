import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/image_picker/image_picker_event.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilis/image_picker_utilis.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryCapture);
  }

  void cameraCapture(CameraCapture event, Emitter<ImagePickerState> states)async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void galleryCapture(GalleryImagePicker event, Emitter<ImagePickerState> states)async{
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
