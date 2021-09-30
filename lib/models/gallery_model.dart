class GalleryModel {
  int? photoId;
  String? photoUrl;
  bool? isPrimary;

  GalleryModel({
    this.photoId,
    this.photoUrl,
    this.isPrimary,
  });

  GalleryModel.fromJson(Map<String, dynamic> json) {
    photoId = json['photoId'];
    photoUrl = json['photoUrl'];
    isPrimary = json['isPrimary'];
  }

  Map<String, dynamic> toJson() {
    return {
      "photoId": photoId,
      "photoUrl": photoUrl,
      "isPrimary": isPrimary,
    };
  }
}
