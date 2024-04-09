/// code : 0
/// message : "0"
/// ttl : 1
/// data : {"seid":"7573932994178312451","id":4299387006035339000,"type":0,"show_name":"第一军情 ·3小时前更新","name":"第一军情","goto_type":0,"goto_value":"","url":"https://search.bilibili.com/all?keyword=第一军情"}

class SearchDefaultInfo {
  SearchDefaultInfo({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) {
    _code = code;
    _message = message;
    _ttl = ttl;
    _data = data;
  }

  SearchDefaultInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;

  SearchDefaultInfo copyWith({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) =>
      SearchDefaultInfo(
        code: code ?? _code,
        message: message ?? _message,
        ttl: ttl ?? _ttl,
        data: data ?? _data,
      );

  num? get code => _code;

  String? get message => _message;

  num? get ttl => _ttl;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    map['ttl'] = _ttl;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// seid : "7573932994178312451"
/// id : 4299387006035339000
/// type : 0
/// show_name : "第一军情 ·3小时前更新"
/// name : "第一军情"
/// goto_type : 0
/// goto_value : ""
/// url : "https://search.bilibili.com/all?keyword=第一军情"

class Data {
  Data({
    String? seid,
    num? id,
    num? type,
    String? showName,
    String? name,
    num? gotoType,
    String? gotoValue,
    String? url,
  }) {
    _seid = seid;
    _id = id;
    _type = type;
    _showName = showName;
    _name = name;
    _gotoType = gotoType;
    _gotoValue = gotoValue;
    _url = url;
  }

  Data.fromJson(dynamic json) {
    _seid = json['seid'];
    _id = json['id'];
    _type = json['type'];
    _showName = json['show_name'];
    _name = json['name'];
    _gotoType = json['goto_type'];
    _gotoValue = json['goto_value'];
    _url = json['url'];
  }

  String? _seid;
  num? _id;
  num? _type;
  String? _showName;
  String? _name;
  num? _gotoType;
  String? _gotoValue;
  String? _url;

  Data copyWith({
    String? seid,
    num? id,
    num? type,
    String? showName,
    String? name,
    num? gotoType,
    String? gotoValue,
    String? url,
  }) =>
      Data(
        seid: seid ?? _seid,
        id: id ?? _id,
        type: type ?? _type,
        showName: showName ?? _showName,
        name: name ?? _name,
        gotoType: gotoType ?? _gotoType,
        gotoValue: gotoValue ?? _gotoValue,
        url: url ?? _url,
      );

  String? get seid => _seid;

  num? get id => _id;

  num? get type => _type;

  String? get showName => _showName;

  String? get name => _name;

  num? get gotoType => _gotoType;

  String? get gotoValue => _gotoValue;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seid'] = _seid;
    map['id'] = _id;
    map['type'] = _type;
    map['show_name'] = _showName;
    map['name'] = _name;
    map['goto_type'] = _gotoType;
    map['goto_value'] = _gotoValue;
    map['url'] = _url;
    return map;
  }
}
