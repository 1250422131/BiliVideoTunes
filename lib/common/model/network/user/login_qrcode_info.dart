import 'dart:convert';

LoginQrcodeInfo loginQrcodeInfoFromJson(String str) =>
    LoginQrcodeInfo.fromJson(json.decode(str));

String loginQrcodeInfoToJson(LoginQrcodeInfo data) =>
    json.encode(data.toJson());

class LoginQrcodeInfo {
  LoginQrcodeInfo({
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

  LoginQrcodeInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;

  LoginQrcodeInfo copyWith({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) =>
      LoginQrcodeInfo(
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

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? url,
    String? qrcodeKey,
  }) {
    _url = url;
    _qrcodeKey = qrcodeKey;
  }

  Data.fromJson(dynamic json) {
    _url = json['url'];
    _qrcodeKey = json['qrcode_key'];
  }

  String? _url;
  String? _qrcodeKey;

  Data copyWith({
    String? url,
    String? qrcodeKey,
  }) =>
      Data(
        url: url ?? _url,
        qrcodeKey: qrcodeKey ?? _qrcodeKey,
      );

  String? get url => _url;

  String? get qrcodeKey => _qrcodeKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['qrcode_key'] = _qrcodeKey;
    return map;
  }
}
