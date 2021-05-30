class PhotoUrl {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  PhotoUrl(this.raw , this.full, this.regular, this.small, this.thumb);

  Map toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb
  };

  factory PhotoUrl.fromJson(dynamic json) {
    return PhotoUrl(
      json['raw'] as String,
      json['full'] as String,
      json['regular'] as String,
      json['small'] as String,
      json['thumb'] as String
    );
  }

}