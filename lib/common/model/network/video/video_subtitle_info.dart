import 'dart:convert';

VideoSubtitleInfo videoSubtitleInfoFromJson(String str) =>
    VideoSubtitleInfo.fromJson(json.decode(str));

String videoSubtitleInfoToJson(VideoSubtitleInfo data) =>
    json.encode(data.toJson());

class VideoSubtitleInfo {
  VideoSubtitleInfo({
    num? fontSize,
    String? fontColor,
    num? backgroundAlpha,
    String? backgroundColor,
    String? stroke,
    String? type,
    String? lang,
    String? version,
    List<Body>? body,
  }) {
    _fontSize = fontSize;
    _fontColor = fontColor;
    _backgroundAlpha = backgroundAlpha;
    _backgroundColor = backgroundColor;
    _stroke = stroke;
    _type = type;
    _lang = lang;
    _version = version;
    _body = body;
  }

  VideoSubtitleInfo.fromJson(dynamic json) {
    _fontSize = json['font_size'];
    _fontColor = json['font_color'];
    _backgroundAlpha = json['background_alpha'];
    _backgroundColor = json['background_color'];
    _stroke = json['Stroke'];
    _type = json['type'];
    _lang = json['lang'];
    _version = json['version'];
    if (json['body'] != null) {
      _body = [];
      json['body'].forEach((v) {
        _body?.add(Body.fromJson(v));
      });
    }
  }

  num? _fontSize;
  String? _fontColor;
  num? _backgroundAlpha;
  String? _backgroundColor;
  String? _stroke;
  String? _type;
  String? _lang;
  String? _version;
  List<Body>? _body;

  VideoSubtitleInfo copyWith({
    num? fontSize,
    String? fontColor,
    num? backgroundAlpha,
    String? backgroundColor,
    String? stroke,
    String? type,
    String? lang,
    String? version,
    List<Body>? body,
  }) =>
      VideoSubtitleInfo(
        fontSize: fontSize ?? _fontSize,
        fontColor: fontColor ?? _fontColor,
        backgroundAlpha: backgroundAlpha ?? _backgroundAlpha,
        backgroundColor: backgroundColor ?? _backgroundColor,
        stroke: stroke ?? _stroke,
        type: type ?? _type,
        lang: lang ?? _lang,
        version: version ?? _version,
        body: body ?? _body,
      );

  num? get fontSize => _fontSize;

  String? get fontColor => _fontColor;

  num? get backgroundAlpha => _backgroundAlpha;

  String? get backgroundColor => _backgroundColor;

  String? get stroke => _stroke;

  String? get type => _type;

  String? get lang => _lang;

  String? get version => _version;

  List<Body>? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['font_size'] = _fontSize;
    map['font_color'] = _fontColor;
    map['background_alpha'] = _backgroundAlpha;
    map['background_color'] = _backgroundColor;
    map['Stroke'] = _stroke;
    map['type'] = _type;
    map['lang'] = _lang;
    map['version'] = _version;
    if (_body != null) {
      map['body'] = _body?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));

String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    num? from,
    num? to,
    num? sid,
    num? location,
    String? content,
    num? music,
  }) {
    _from = from;
    _to = to;
    _sid = sid;
    _location = location;
    _content = content;
    _music = music;
  }

  Body.fromJson(dynamic json) {
    _from = json['from'];
    _to = json['to'];
    _sid = json['sid'];
    _location = json['location'];
    _content = json['content'];
    _music = json['music'];
  }

  num? _from;
  num? _to;
  num? _sid;
  num? _location;
  String? _content;
  num? _music;

  Body copyWith({
    num? from,
    num? to,
    num? sid,
    num? location,
    String? content,
    num? music,
  }) =>
      Body(
        from: from ?? _from,
        to: to ?? _to,
        sid: sid ?? _sid,
        location: location ?? _location,
        content: content ?? _content,
        music: music ?? _music,
      );

  num? get from => _from;

  num? get to => _to;

  num? get sid => _sid;

  num? get location => _location;

  String? get content => _content;

  num? get music => _music;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = _from;
    map['to'] = _to;
    map['sid'] = _sid;
    map['location'] = _location;
    map['content'] = _content;
    map['music'] = _music;
    return map;
  }
}
