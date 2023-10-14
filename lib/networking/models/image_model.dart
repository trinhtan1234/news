import 'dart:convert';

ImageModel imageModelFromJson(Map<String, dynamic> imageData) =>
    ImageModel.fromJson(imageData);

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  String? message;
  String? status;

  ImageModel({
    this.message,
    this.status,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
