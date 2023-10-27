import 'dart:convert';

List<ModelYourNews> modelYourNewsFromJson(List listData) =>
    List<ModelYourNews>.from(listData.map((e) => ModelYourNews.fromJson(e)));

String modelYourNewsToJson(List<ModelYourNews> data) =>
    json.encode(List.from(data.map((x) => x.toJson())));

class ModelYourNews {
  int? id;
  String? tinhThanhPho;
  String? tieuDe;
  String? content;
  String? noiDung;
  String? tacGia;
  String? chuDe;
  int? soNguoiDaDoc;
  String? thoiGian;
  String? imageTieuDe;
  String? image2;

  ModelYourNews({
    this.id,
    this.tinhThanhPho,
    this.tieuDe,
    this.content,
    this.noiDung,
    this.tacGia,
    this.chuDe,
    this.soNguoiDaDoc,
    this.thoiGian,
    this.imageTieuDe,
    this.image2,
  });

  factory ModelYourNews.fromJson(Map<String, dynamic> json) => ModelYourNews(
        id: json["id"],
        tinhThanhPho: json["tinhThanhPho"],
        tieuDe: json["tieuDe"],
        content: json["content"],
        noiDung: json["NoiDung"],
        tacGia: json["tacGia"],
        chuDe: json["ChuDe"],
        soNguoiDaDoc: json["SoNguoiDaDoc"],
        thoiGian: json["thoiGian"],
        imageTieuDe: json["imageTieuDe"],
        image2: json["image2"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tinhThanhPho": tinhThanhPho,
        "tieuDe": tieuDe,
        "content": content,
        "NoiDung": noiDung,
        "tacGia": tacGia,
        "ChuDe": chuDe,
        "SoNguoiDaDoc": soNguoiDaDoc,
        "thoiGian": thoiGian,
        "imageTieuDe": imageTieuDe,
        "image2": image2,
      };
}
