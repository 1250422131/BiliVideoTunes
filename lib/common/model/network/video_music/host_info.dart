import 'dart:convert';
HostInfo hostInfoFromJson(String str) => HostInfo.fromJson(json.decode(str));
String hostInfoToJson(HostInfo data) => json.encode(data.toJson());
class HostInfo {
  HostInfo({
      num? code,
      String? message,
      num? ttl,
      List<Data>? data,}){
    _code = code;
    _message = message;
    _ttl = ttl;
    _data = data;
}

  HostInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _code;
  String? _message;
  num? _ttl;
  List<Data>? _data;
HostInfo copyWith({  num? code,
  String? message,
  num? ttl,
  List<Data>? data,
}) => HostInfo(  code: code ?? _code,
  message: message ?? _message,
  ttl: ttl ?? _ttl,
  data: data ?? _data,
);
  num? get code => _code;
  String? get message => _message;
  num? get ttl => _ttl;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    map['ttl'] = _ttl;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? rid,
      List<Tags>? tags,}){
    _rid = rid;
    _tags = tags;
}

  Data.fromJson(dynamic json) {
    _rid = json['rid'];
    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
  }
  num? _rid;
  List<Tags>? _tags;
Data copyWith({  num? rid,
  List<Tags>? tags,
}) => Data(  rid: rid ?? _rid,
  tags: tags ?? _tags,
);
  num? get rid => _rid;
  List<Tags>? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rid'] = _rid;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Tags tagsFromJson(String str) => Tags.fromJson(json.decode(str));
String tagsToJson(Tags data) => json.encode(data.toJson());
class Tags {
  Tags({
      num? tagId,
      String? tagName,
      num? highlight,
      num? isAtten,}){
    _tagId = tagId;
    _tagName = tagName;
    _highlight = highlight;
    _isAtten = isAtten;
}

  Tags.fromJson(dynamic json) {
    _tagId = json['tag_id'];
    _tagName = json['tag_name'];
    _highlight = json['highlight'];
    _isAtten = json['is_atten'];
  }
  num? _tagId;
  String? _tagName;
  num? _highlight;
  num? _isAtten;
Tags copyWith({  num? tagId,
  String? tagName,
  num? highlight,
  num? isAtten,
}) => Tags(  tagId: tagId ?? _tagId,
  tagName: tagName ?? _tagName,
  highlight: highlight ?? _highlight,
  isAtten: isAtten ?? _isAtten,
);
  num? get tagId => _tagId;
  String? get tagName => _tagName;
  num? get highlight => _highlight;
  num? get isAtten => _isAtten;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tag_id'] = _tagId;
    map['tag_name'] = _tagName;
    map['highlight'] = _highlight;
    map['is_atten'] = _isAtten;
    return map;
  }

}