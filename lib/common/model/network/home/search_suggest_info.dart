/// exp_str : ""
/// code : 0
/// result : {"tag":[{"value":"小霖QL","term":"小霖QL","ref":0,"name":"<em class=\"suggest_high_light\">小</em>霖QL","spid":5,"type":""},{"value":"小小小酷哥直播回放","term":"小小小酷哥直播回放","ref":0,"name":"<em class=\"suggest_high_light\">小</em>小小酷哥直播回放","spid":5,"type":""},{"value":"小潮院长","term":"小潮院长","ref":0,"name":"<em class=\"suggest_high_light\">小</em>潮院长","spid":5,"type":""},{"value":"小男娘","term":"小男娘","ref":0,"name":"<em class=\"suggest_high_light\">小</em>男娘","spid":5,"type":""},{"value":"小万桑","term":"小万桑","ref":0,"name":"<em class=\"suggest_high_light\">小</em>万桑","spid":5,"type":""},{"value":"小约翰可汗","term":"小约翰可汗","ref":0,"name":"<em class=\"suggest_high_light\">小</em>约翰可汗","spid":5,"type":""},{"value":"小豪","term":"小豪","ref":0,"name":"<em class=\"suggest_high_light\">小</em>豪","spid":5,"type":""},{"value":"小熊移植回想码是多少","term":"小熊移植回想码是多少","ref":0,"name":"<em class=\"suggest_high_light\">小</em>熊移植回想码是多少","spid":5,"type":""},{"value":"小说","term":"小说","ref":0,"name":"<em class=\"suggest_high_light\">小</em>说","spid":5,"type":""},{"value":"小说推文一口气看完","term":"小说推文一口气看完","ref":0,"name":"<em class=\"suggest_high_light\">小</em>说推文一口气看完","spid":5,"type":""}]}
/// stoken : "130179087369784079"

class SearchSuggestInfo {
  SearchSuggestInfo({
    String? expStr,
    num? code,
    Result? result,
    String? stoken,}) {
    _expStr = expStr;
    _code = code;
    _result = result;
    _stoken = stoken;
  }

  SearchSuggestInfo.fromJson(dynamic json) {
    _expStr = json['exp_str'];
    _code = json['code'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _stoken = json['stoken'];
  }

  String? _expStr;
  num? _code;
  Result? _result;
  String? _stoken;

  SearchSuggestInfo copyWith({ String? expStr,
    num? code,
    Result? result,
    String? stoken,
  }) =>
      SearchSuggestInfo(expStr: expStr ?? _expStr,
        code: code ?? _code,
        result: result ?? _result,
        stoken: stoken ?? _stoken,
      );

  String? get expStr => _expStr;

  num? get code => _code;

  Result? get result => _result;

  String? get stoken => _stoken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['exp_str'] = _expStr;
    map['code'] = _code;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    map['stoken'] = _stoken;
    return map;
  }

}

/// tag : [{"value":"小霖QL","term":"小霖QL","ref":0,"name":"<em class=\"suggest_high_light\">小</em>霖QL","spid":5,"type":""},{"value":"小小小酷哥直播回放","term":"小小小酷哥直播回放","ref":0,"name":"<em class=\"suggest_high_light\">小</em>小小酷哥直播回放","spid":5,"type":""},{"value":"小潮院长","term":"小潮院长","ref":0,"name":"<em class=\"suggest_high_light\">小</em>潮院长","spid":5,"type":""},{"value":"小男娘","term":"小男娘","ref":0,"name":"<em class=\"suggest_high_light\">小</em>男娘","spid":5,"type":""},{"value":"小万桑","term":"小万桑","ref":0,"name":"<em class=\"suggest_high_light\">小</em>万桑","spid":5,"type":""},{"value":"小约翰可汗","term":"小约翰可汗","ref":0,"name":"<em class=\"suggest_high_light\">小</em>约翰可汗","spid":5,"type":""},{"value":"小豪","term":"小豪","ref":0,"name":"<em class=\"suggest_high_light\">小</em>豪","spid":5,"type":""},{"value":"小熊移植回想码是多少","term":"小熊移植回想码是多少","ref":0,"name":"<em class=\"suggest_high_light\">小</em>熊移植回想码是多少","spid":5,"type":""},{"value":"小说","term":"小说","ref":0,"name":"<em class=\"suggest_high_light\">小</em>说","spid":5,"type":""},{"value":"小说推文一口气看完","term":"小说推文一口气看完","ref":0,"name":"<em class=\"suggest_high_light\">小</em>说推文一口气看完","spid":5,"type":""}]

class Result {
  Result({
    List<Tag>? tag,}) {
    _tag = tag;
  }

  Result.fromJson(dynamic json) {
    if (json['tag'] != null) {
      _tag = [];
      json['tag'].forEach((v) {
        _tag?.add(Tag.fromJson(v));
      });
    }
  }

  List<Tag>? _tag;

  Result copyWith({ List<Tag>? tag,
  }) =>
      Result(tag: tag ?? _tag,
      );

  List<Tag>? get tag => _tag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_tag != null) {
      map['tag'] = _tag?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// value : "小霖QL"
/// term : "小霖QL"
/// ref : 0
/// name : "<em class=\"suggest_high_light\">小</em>霖QL"
/// spid : 5
/// type : ""

class Tag {
  Tag({
    String? value,
    String? term,
    num? ref,
    String? name,
    num? spid,
    String? type,}) {
    _value = value;
    _term = term;
    _ref = ref;
    _name = name;
    _spid = spid;
    _type = type;
  }

  Tag.fromJson(dynamic json) {
    _value = json['value'];
    _term = json['term'];
    _ref = json['ref'];
    _name = json['name'];
    _spid = json['spid'];
    _type = json['type'];
  }

  String? _value;
  String? _term;
  num? _ref;
  String? _name;
  num? _spid;
  String? _type;

  Tag copyWith({ String? value,
    String? term,
    num? ref,
    String? name,
    num? spid,
    String? type,
  }) =>
      Tag(
        value: value ?? _value,
        term: term ?? _term,
        ref: ref ?? _ref,
        name: name ?? _name,
        spid: spid ?? _spid,
        type: type ?? _type,
      );

  String? get value => _value;

  String? get term => _term;

  num? get ref => _ref;

  String? get name => _name;

  num? get spid => _spid;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    map['term'] = _term;
    map['ref'] = _ref;
    map['name'] = _name;
    map['spid'] = _spid;
    map['type'] = _type;
    return map;
  }

}