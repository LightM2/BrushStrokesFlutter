import 'package:brush_strokes/models/photos/photo.dart';

class CartRepository {
  List<Photo> photos = [];

  List<Photo> addPainting(Photo painting) {
    if (!photos.contains(painting)) {
      photos.add(painting);
    }
    return photos;
  }

  List<Photo> removePainting(int id) {
    photos.removeWhere((element) => element.id == id);
    return photos;
  }
}
