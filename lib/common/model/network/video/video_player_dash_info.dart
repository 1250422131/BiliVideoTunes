import 'dart:convert';
VideoPlayerDashInfo videoPlayerDashInfoFromJson(String str) => VideoPlayerDashInfo.fromJson(json.decode(str));
String videoPlayerDashInfoToJson(VideoPlayerDashInfo data) => json.encode(data.toJson());
class VideoPlayerDashInfo {
  VideoPlayerDashInfo({
      num? code, 
      String? message, 
      num? ttl, 
      Data? data,}){
    _code = code;
    _message = message;
    _ttl = ttl;
    _data = data;
}

  VideoPlayerDashInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;
VideoPlayerDashInfo copyWith({  num? code,
  String? message,
  num? ttl,
  Data? data,
}) => VideoPlayerDashInfo(  code: code ?? _code,
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
      String? from, 
      String? result, 
      String? message, 
      num? quality, 
      String? format, 
      num? timelength, 
      String? acceptFormat, 
      List<String>? acceptDescription, 
      List<num>? acceptQuality, 
      num? videoCodecid, 
      String? seekParam, 
      String? seekType, 
      Dash? dash, 
      List<SupportFormats>? supportFormats, 
      dynamic highFormat, 
      num? lastPlayTime, 
      num? lastPlayCid,}){
    _from = from;
    _result = result;
    _message = message;
    _quality = quality;
    _format = format;
    _timelength = timelength;
    _acceptFormat = acceptFormat;
    _acceptDescription = acceptDescription;
    _acceptQuality = acceptQuality;
    _videoCodecid = videoCodecid;
    _seekParam = seekParam;
    _seekType = seekType;
    _dash = dash;
    _supportFormats = supportFormats;
    _highFormat = highFormat;
    _lastPlayTime = lastPlayTime;
    _lastPlayCid = lastPlayCid;
}

  Data.fromJson(dynamic json) {
    _from = json['from'];
    _result = json['result'];
    _message = json['message'];
    _quality = json['quality'];
    _format = json['format'];
    _timelength = json['timelength'];
    _acceptFormat = json['accept_format'];
    _acceptDescription = json['accept_description'] != null ? json['accept_description'].cast<String>() : [];
    _acceptQuality = json['accept_quality'] != null ? json['accept_quality'].cast<num>() : [];
    _videoCodecid = json['video_codecid'];
    _seekParam = json['seek_param'];
    _seekType = json['seek_type'];
    _dash = json['dash'] != null ? Dash.fromJson(json['dash']) : null;
    if (json['support_formats'] != null) {
      _supportFormats = [];
      json['support_formats'].forEach((v) {
        _supportFormats?.add(SupportFormats.fromJson(v));
      });
    }
    _highFormat = json['high_format'];
    _lastPlayTime = json['last_play_time'];
    _lastPlayCid = json['last_play_cid'];
  }
  String? _from;
  String? _result;
  String? _message;
  num? _quality;
  String? _format;
  num? _timelength;
  String? _acceptFormat;
  List<String>? _acceptDescription;
  List<num>? _acceptQuality;
  num? _videoCodecid;
  String? _seekParam;
  String? _seekType;
  Dash? _dash;
  List<SupportFormats>? _supportFormats;
  dynamic _highFormat;
  num? _lastPlayTime;
  num? _lastPlayCid;
Data copyWith({  String? from,
  String? result,
  String? message,
  num? quality,
  String? format,
  num? timelength,
  String? acceptFormat,
  List<String>? acceptDescription,
  List<num>? acceptQuality,
  num? videoCodecid,
  String? seekParam,
  String? seekType,
  Dash? dash,
  List<SupportFormats>? supportFormats,
  dynamic highFormat,
  num? lastPlayTime,
  num? lastPlayCid,
}) => Data(  from: from ?? _from,
  result: result ?? _result,
  message: message ?? _message,
  quality: quality ?? _quality,
  format: format ?? _format,
  timelength: timelength ?? _timelength,
  acceptFormat: acceptFormat ?? _acceptFormat,
  acceptDescription: acceptDescription ?? _acceptDescription,
  acceptQuality: acceptQuality ?? _acceptQuality,
  videoCodecid: videoCodecid ?? _videoCodecid,
  seekParam: seekParam ?? _seekParam,
  seekType: seekType ?? _seekType,
  dash: dash ?? _dash,
  supportFormats: supportFormats ?? _supportFormats,
  highFormat: highFormat ?? _highFormat,
  lastPlayTime: lastPlayTime ?? _lastPlayTime,
  lastPlayCid: lastPlayCid ?? _lastPlayCid,
);
  String? get from => _from;
  String? get result => _result;
  String? get message => _message;
  num? get quality => _quality;
  String? get format => _format;
  num? get timelength => _timelength;
  String? get acceptFormat => _acceptFormat;
  List<String>? get acceptDescription => _acceptDescription;
  List<num>? get acceptQuality => _acceptQuality;
  num? get videoCodecid => _videoCodecid;
  String? get seekParam => _seekParam;
  String? get seekType => _seekType;
  Dash? get dash => _dash;
  List<SupportFormats>? get supportFormats => _supportFormats;
  dynamic get highFormat => _highFormat;
  num? get lastPlayTime => _lastPlayTime;
  num? get lastPlayCid => _lastPlayCid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = _from;
    map['result'] = _result;
    map['message'] = _message;
    map['quality'] = _quality;
    map['format'] = _format;
    map['timelength'] = _timelength;
    map['accept_format'] = _acceptFormat;
    map['accept_description'] = _acceptDescription;
    map['accept_quality'] = _acceptQuality;
    map['video_codecid'] = _videoCodecid;
    map['seek_param'] = _seekParam;
    map['seek_type'] = _seekType;
    if (_dash != null) {
      map['dash'] = _dash?.toJson();
    }
    if (_supportFormats != null) {
      map['support_formats'] = _supportFormats?.map((v) => v.toJson()).toList();
    }
    map['high_format'] = _highFormat;
    map['last_play_time'] = _lastPlayTime;
    map['last_play_cid'] = _lastPlayCid;
    return map;
  }

}

SupportFormats supportFormatsFromJson(String str) => SupportFormats.fromJson(json.decode(str));
String supportFormatsToJson(SupportFormats data) => json.encode(data.toJson());
class SupportFormats {
  SupportFormats({
      num? quality, 
      String? format, 
      String? newDescription, 
      String? displayDesc, 
      String? superscript, 
      List<String>? codecs,}){
    _quality = quality;
    _format = format;
    _newDescription = newDescription;
    _displayDesc = displayDesc;
    _superscript = superscript;
    _codecs = codecs;
}

  SupportFormats.fromJson(dynamic json) {
    _quality = json['quality'];
    _format = json['format'];
    _newDescription = json['new_description'];
    _displayDesc = json['display_desc'];
    _superscript = json['superscript'];
    _codecs = json['codecs'] != null ? json['codecs'].cast<String>() : [];
  }
  num? _quality;
  String? _format;
  String? _newDescription;
  String? _displayDesc;
  String? _superscript;
  List<String>? _codecs;
SupportFormats copyWith({  num? quality,
  String? format,
  String? newDescription,
  String? displayDesc,
  String? superscript,
  List<String>? codecs,
}) => SupportFormats(  quality: quality ?? _quality,
  format: format ?? _format,
  newDescription: newDescription ?? _newDescription,
  displayDesc: displayDesc ?? _displayDesc,
  superscript: superscript ?? _superscript,
  codecs: codecs ?? _codecs,
);
  num? get quality => _quality;
  String? get format => _format;
  String? get newDescription => _newDescription;
  String? get displayDesc => _displayDesc;
  String? get superscript => _superscript;
  List<String>? get codecs => _codecs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quality'] = _quality;
    map['format'] = _format;
    map['new_description'] = _newDescription;
    map['display_desc'] = _displayDesc;
    map['superscript'] = _superscript;
    map['codecs'] = _codecs;
    return map;
  }

}

Dash dashFromJson(String str) => Dash.fromJson(json.decode(str));
String dashToJson(Dash data) => json.encode(data.toJson());
class Dash {
  Dash({
      num? duration, 
      num? minBufferTime, 
      num? min_Buffer_Time,
      List<Video>? video,
      List<Audio>? audio, 
      Dolby? dolby, 
      dynamic flac,}){
    _duration = duration;
    _minBufferTime = minBufferTime;
    _min_Buffer_Time = min_Buffer_Time;
    _video = video;
    _audio = audio;
    _dolby = dolby;
    _flac = flac;
}

  Dash.fromJson(dynamic json) {
    _duration = json['duration'];
    _minBufferTime = json['minBufferTime'];
    _min_Buffer_Time = json['min_buffer_time'];
    if (json['video'] != null) {
      _video = [];
      json['video'].forEach((v) {
        _video?.add(Video.fromJson(v));
      });
    }
    if (json['audio'] != null) {
      _audio = [];
      json['audio'].forEach((v) {
        _audio?.add(Audio.fromJson(v));
      });
    }
    _dolby = json['dolby'] != null ? Dolby.fromJson(json['dolby']) : null;
    _flac = json['flac'];
  }
  num? _duration;
  num? _minBufferTime;
  num? _min_Buffer_Time;
  List<Video>? _video;
  List<Audio>? _audio;
  Dolby? _dolby;
  dynamic _flac;
Dash copyWith({  num? duration,
  num? minBufferTime,
  num? min_Buffer_Time,
  List<Video>? video,
  List<Audio>? audio,
  Dolby? dolby,
  dynamic flac,
}) => Dash(  duration: duration ?? _duration,
  minBufferTime: minBufferTime ?? _minBufferTime,
  min_Buffer_Time: minBufferTime ?? _min_Buffer_Time,
  video: video ?? _video,
  audio: audio ?? _audio,
  dolby: dolby ?? _dolby,
  flac: flac ?? _flac,
);
  num? get duration => _duration;
  num? get minBufferTime => _minBufferTime;
  num? get min_Buffer_Time => _min_Buffer_Time;
  List<Video>? get video => _video;
  List<Audio>? get audio => _audio;
  Dolby? get dolby => _dolby;
  dynamic get flac => _flac;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['duration'] = _duration;
    map['minBufferTime'] = _minBufferTime;
    map['min_buffer_time'] = _min_Buffer_Time;
    if (_video != null) {
      map['video'] = _video?.map((v) => v.toJson()).toList();
    }
    if (_audio != null) {
      map['audio'] = _audio?.map((v) => v.toJson()).toList();
    }
    if (_dolby != null) {
      map['dolby'] = _dolby?.toJson();
    }
    map['flac'] = _flac;
    return map;
  }

}

Dolby dolbyFromJson(String str) => Dolby.fromJson(json.decode(str));
String dolbyToJson(Dolby data) => json.encode(data.toJson());
class Dolby {
  Dolby({
      num? type, 
      dynamic audio,}){
    _type = type;
    _audio = audio;
}

  Dolby.fromJson(dynamic json) {
    _type = json['type'];
    _audio = json['audio'];
  }
  num? _type;
  dynamic _audio;
Dolby copyWith({  num? type,
  dynamic audio,
}) => Dolby(  type: type ?? _type,
  audio: audio ?? _audio,
);
  num? get type => _type;
  dynamic get audio => _audio;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['audio'] = _audio;
    return map;
  }

}

Audio audioFromJson(String str) => Audio.fromJson(json.decode(str));
String audioToJson(Audio data) => json.encode(data.toJson());
class Audio {
  Audio({
      num? id, 
      String? baseUrl, 
      String? base_Url,
      List<String>? backupUrl, 
      List<String>? backup_Url,
      num? bandwidth, 
      String? mimeType, 
      String? mime_Type,
      String? codecs, 
      num? width, 
      num? height, 
      String? frameRate, 
      String? frame_Rate,
      String? sar, 
      num? startWithSap, 
      num? start_With_Sap,
      SegmentBase? segmentBase,
      SegmentBase? segment_Base,
      num? codecid,}){
    _id = id;
    _baseUrl = baseUrl;
    _base_Url = base_Url;
    _backupUrl = backupUrl;
    _backup_Url = backup_Url;
    _bandwidth = bandwidth;
    _mimeType = mimeType;
    _mime_Type = mime_Type;
    _codecs = codecs;
    _width = width;
    _height = height;
    _frameRate = frameRate;
    _frame_Rate = frame_Rate;
    _sar = sar;
    _startWithSap = startWithSap;
    _start_With_Sap = start_With_Sap;
    _segmentBase = segmentBase;
    _segment_Base = segment_Base;
    _codecid = codecid;
}

  Audio.fromJson(dynamic json) {
    _id = json['id'];
    _baseUrl = json['baseUrl'];
    _base_Url = json['base_url'];
    _backupUrl = json['backupUrl'] != null ? json['backupUrl'].cast<String>() : [];
    _backup_Url = json['backup_url'] != null ? json['backup_url'].cast<String>() : [];
    _bandwidth = json['bandwidth'];
    _mimeType = json['mimeType'];
    _mime_Type = json['mime_type'];
    _codecs = json['codecs'];
    _width = json['width'];
    _height = json['height'];
    _frameRate = json['frameRate'];
    _frame_Rate = json['frame_rate'];
    _sar = json['sar'];
    _startWithSap = json['startWithSap'];
    _start_With_Sap = json['start_with_sap'];
    _segmentBase = json['SegmentBase'] != null ? SegmentBase.fromJson(json['SegmentBase']) : null;
    _segment_Base = json['segment_base'] != null ? SegmentBase.fromJson(json['segment_base']) : null;
    _codecid = json['codecid'];
  }
  num? _id;
  String? _baseUrl;
  String? _base_Url;
  List<String>? _backupUrl;
  List<String>? _backup_Url;
  num? _bandwidth;
  String? _mimeType;
  String? _mime_Type;
  String? _codecs;
  num? _width;
  num? _height;
  String? _frameRate;
  String? _frame_Rate;
  String? _sar;
  num? _startWithSap;
  num? _start_With_Sap;
  SegmentBase? _segmentBase;
  SegmentBase? _segment_Base;
  num? _codecid;
Audio copyWith({  num? id,
  String? baseUrl,
  String? base_Url,
  List<String>? backupUrl,
  List<String>? backup_Url,
  num? bandwidth,
  String? mimeType,
  String? mime_Type,
  String? codecs,
  num? width,
  num? height,
  String? frameRate,
  String? frame_Rate,
  String? sar,
  num? startWithSap,
  num? start_With_Sap,
  SegmentBase? segmentBase,
  SegmentBase? segment_Base,
  num? codecid,
}) => Audio(  id: id ?? _id,
  baseUrl: baseUrl ?? _baseUrl,
  base_Url: base_Url ?? _base_Url,
  backupUrl: backupUrl ?? _backupUrl,
  backup_Url: backup_Url ?? _backup_Url,
  bandwidth: bandwidth ?? _bandwidth,
  mimeType: mimeType ?? _mimeType,
  mime_Type: mime_Type ?? _mime_Type,
  codecs: codecs ?? _codecs,
  width: width ?? _width,
  height: height ?? _height,
  frameRate: frameRate ?? _frameRate,
  frame_Rate: frame_Rate ?? _frame_Rate,
  sar: sar ?? _sar,
  startWithSap: startWithSap ?? _startWithSap,
  start_With_Sap: start_With_Sap ?? _start_With_Sap,
  segmentBase: segmentBase ?? _segmentBase,
  segment_Base: segment_Base ?? _segment_Base,
  codecid: codecid ?? _codecid,
);
  num? get id => _id;
  String? get baseUrl => _baseUrl;
  String? get base_Url => _base_Url;
  List<String>? get backupUrl => _backupUrl;
  List<String>? get backup_Url => _backup_Url;
  num? get bandwidth => _bandwidth;
  String? get mimeType => _mimeType;
  String? get mime_Type => _mime_Type;
  String? get codecs => _codecs;
  num? get width => _width;
  num? get height => _height;
  String? get frameRate => _frameRate;
  String? get frame_Rate => _frame_Rate;
  String? get sar => _sar;
  num? get startWithSap => _startWithSap;
  num? get start_With_Sap => _start_With_Sap;
  SegmentBase? get segmentBase => _segmentBase;
  SegmentBase? get segment_Base => _segment_Base;
  num? get codecid => _codecid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['baseUrl'] = _baseUrl;
    map['base_url'] = _baseUrl;
    map['backupUrl'] = _backupUrl;
    map['backup_url'] = _backupUrl;
    map['bandwidth'] = _bandwidth;
    map['mimeType'] = _mimeType;
    map['mime_type'] = _mimeType;
    map['codecs'] = _codecs;
    map['width'] = _width;
    map['height'] = _height;
    map['frameRate'] = _frameRate;
    map['frame_rate'] = _frameRate;
    map['sar'] = _sar;
    map['startWithSap'] = _startWithSap;
    map['start_with_sap'] = _startWithSap;
    if (_segmentBase != null) {
      map['SegmentBase'] = _segmentBase?.toJson();
    }
    if (_segmentBase != null) {
      map['segment_base'] = _segmentBase?.toJson();
    }
    map['codecid'] = _codecid;
    return map;
  }

}

SegmentBase segmentBaseFromJson(String str) => SegmentBase.fromJson(json.decode(str));
String segmentBaseToJson(SegmentBase data) => json.encode(data.toJson());
class SegmentBase {
  SegmentBase({
      String? initialization, 
      String? indexRange,}){
    _initialization = initialization;
    _indexRange = indexRange;
}

  SegmentBase.fromJson(dynamic json) {
    _initialization = json['initialization'];
    _indexRange = json['index_range'];
  }
  String? _initialization;
  String? _indexRange;
SegmentBase copyWith({  String? initialization,
  String? indexRange,
}) => SegmentBase(  initialization: initialization ?? _initialization,
  indexRange: indexRange ?? _indexRange,
);
  String? get initialization => _initialization;
  String? get indexRange => _indexRange;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['initialization'] = _initialization;
    map['index_range'] = _indexRange;
    return map;
  }

}


Video videoFromJson(String str) => Video.fromJson(json.decode(str));
String videoToJson(Video data) => json.encode(data.toJson());
class Video {
  Video({
      num? id, 
      String? baseUrl, 
      String? base_Url,
      List<String>? backupUrl, 
      List<String>? backup_Url,
      num? bandwidth, 
      String? mimeType, 
      String? mime_Type,
      String? codecs, 
      num? width, 
      num? height, 
      String? frameRate, 
      String? frame_Rate,
      String? sar, 
      num? startWithSap, 
      num? start_With_Sap,
      SegmentBase? segmentBase, 
      SegmentBase? segment_Base,
      num? codecid,}){
    _id = id;
    _baseUrl = baseUrl;
    _base_Url = base_Url;
    _backupUrl = backupUrl;
    _backup_Url = backup_Url;
    _bandwidth = bandwidth;
    _mimeType = mimeType;
    _mime_Type = mime_Type;
    _codecs = codecs;
    _width = width;
    _height = height;
    _frameRate = frameRate;
    _frame_Rate = frame_Rate;
    _sar = sar;
    _startWithSap = startWithSap;
    _start_With_Sap = start_With_Sap;
    _segmentBase = segmentBase;
    _segment_Base = segment_Base;
    _codecid = codecid;
}

  Video.fromJson(dynamic json) {
    _id = json['id'];
    _baseUrl = json['baseUrl'];
    _base_Url = json['base_url'];
    _backupUrl = json['backupUrl'] != null ? json['backupUrl'].cast<String>() : [];
    _backup_Url = json['backup_url'] != null ? json['backup_url'].cast<String>() : [];
    _bandwidth = json['bandwidth'];
    _mimeType = json['mimeType'];
    _mime_Type = json['mime_type'];
    _codecs = json['codecs'];
    _width = json['width'];
    _height = json['height'];
    _frameRate = json['frameRate'];
    _frame_Rate = json['frame_rate'];
    _sar = json['sar'];
    _startWithSap = json['startWithSap'];
    _start_With_Sap = json['start_with_sap'];
    _segmentBase = json['SegmentBase'] != null ? SegmentBase.fromJson(json['SegmentBase']) : null;
    _segment_Base = json['segment_base'] != null ? SegmentBase.fromJson(json['segment_base']) : null;
    _codecid = json['codecid'];
  }
  num? _id;
  String? _baseUrl;
  String? _base_Url;
  List<String>? _backupUrl;
  List<String>? _backup_Url;
  num? _bandwidth;
  String? _mimeType;
  String? _mime_Type;
  String? _codecs;
  num? _width;
  num? _height;
  String? _frameRate;
  String? _frame_Rate;
  String? _sar;
  num? _startWithSap;
  num? _start_With_Sap;
  SegmentBase? _segmentBase;
  SegmentBase? _segment_Base;
  num? _codecid;
Video copyWith({  num? id,
  String? baseUrl,
  String? base_Url,
  List<String>? backupUrl,
  List<String>? backup_Url,
  num? bandwidth,
  String? mimeType,
  String? mime_Type,
  String? codecs,
  num? width,
  num? height,
  String? frameRate,
  String? frame_Rate,
  String? sar,
  num? startWithSap,
  num? start_With_Sap,
  SegmentBase? segmentBase,
  SegmentBase? segment_Base,
  num? codecid,
}) => Video(  id: id ?? _id,
  baseUrl: baseUrl ?? _baseUrl,
  base_Url: base_Url ?? _base_Url,
  backupUrl: backupUrl ?? _backupUrl,
  backup_Url: backup_Url ?? _backup_Url,
  bandwidth: bandwidth ?? _bandwidth,
  mimeType: mimeType ?? _mimeType,
  mime_Type: mime_Type ?? _mime_Type,
  codecs: codecs ?? _codecs,
  width: width ?? _width,
  height: height ?? _height,
  frameRate: frameRate ?? _frameRate,
  frame_Rate: frame_Rate ?? _frame_Rate,
  sar: sar ?? _sar,
  startWithSap: startWithSap ?? _startWithSap,
  start_With_Sap: start_With_Sap ?? _start_With_Sap,
  segmentBase: segmentBase ?? _segmentBase,
  segment_Base: segment_Base ?? _segment_Base,
  codecid: codecid ?? _codecid,
);
  num? get id => _id;
  String? get baseUrl => _baseUrl;
  String? get base_Url => _base_Url;
  List<String>? get backupUrl => _backupUrl;
  List<String>? get backup_Url => _backup_Url;
  num? get bandwidth => _bandwidth;
  String? get mimeType => _mimeType;
  String? get mime_Type => _mime_Type;
  String? get codecs => _codecs;
  num? get width => _width;
  num? get height => _height;
  String? get frameRate => _frameRate;
  String? get frame_Rate => _frame_Rate;
  String? get sar => _sar;
  num? get startWithSap => _startWithSap;
  num? get start_With_Sap => _start_With_Sap;
  SegmentBase? get segmentBase => _segmentBase;
  SegmentBase? get segment_Base => _segment_Base;
  num? get codecid => _codecid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['baseUrl'] = _baseUrl;
    map['base_url'] = _baseUrl;
    map['backupUrl'] = _backupUrl;
    map['backup_url'] = _backupUrl;
    map['bandwidth'] = _bandwidth;
    map['mimeType'] = _mimeType;
    map['mime_type'] = _mimeType;
    map['codecs'] = _codecs;
    map['width'] = _width;
    map['height'] = _height;
    map['frameRate'] = _frameRate;
    map['frame_rate'] = _frameRate;
    map['sar'] = _sar;
    map['startWithSap'] = _startWithSap;
    map['start_with_sap'] = _startWithSap;
    if (_segmentBase != null) {
      map['SegmentBase'] = _segmentBase?.toJson();
    }
    if (_segmentBase != null) {
      map['segment_base'] = _segmentBase?.toJson();
    }
    map['codecid'] = _codecid;
    return map;
  }

}

