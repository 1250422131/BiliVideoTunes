import 'dart:convert';

LoginPollInfo loginPollInfoFromJson(String str) =>
    LoginPollInfo.fromJson(json.decode(str));

String loginPollInfoToJson(LoginPollInfo data) => json.encode(data.toJson());

class LoginPollInfo {
  LoginPollInfo({
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

  LoginPollInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;

  LoginPollInfo copyWith({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) =>
      LoginPollInfo(
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
    String? refreshToken,
    num? timestamp,
    num? code,
    String? message,
  }) {
    _url = url;
    _refreshToken = refreshToken;
    _timestamp = timestamp;
    _code = code;
    _message = message;
  }

  Data.fromJson(dynamic json) {
    _url = json['url'];
    _refreshToken = json['refresh_token'];
    _timestamp = json['timestamp'];
    _code = json['code'];
    _message = json['message'];
  }

  String? _url;
  String? _refreshToken;
  num? _timestamp;
  num? _code;
  String? _message;

  Data copyWith({
    String? url,
    String? refreshToken,
    num? timestamp,
    num? code,
    String? message,
  }) =>
      Data(
        url: url ?? _url,
        refreshToken: refreshToken ?? _refreshToken,
        timestamp: timestamp ?? _timestamp,
        code: code ?? _code,
        message: message ?? _message,
      );

  String? get url => _url;

  String? get refreshToken => _refreshToken;

  num? get timestamp => _timestamp;

  num? get code => _code;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['refresh_token'] = _refreshToken;
    map['timestamp'] = _timestamp;
    map['code'] = _code;
    map['message'] = _message;
    return map;
  }
}
