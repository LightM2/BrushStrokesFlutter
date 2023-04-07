import 'package:brush_strokes/models/photos/photo.dart';

class CartRepository{
  Set<Photo> photos = {};

  Set<Photo> addPainting(Photo painting) {
    photos.add(painting);
    return photos;
  }

  Set<Photo> removePainting(String id) {
    photos.removeWhere((element) => element.id == id);
    return photos;
  }
}
