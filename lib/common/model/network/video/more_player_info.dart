import 'dart:convert';

MorePlayerInfo morePlayerInfoFromJson(String str) =>
    MorePlayerInfo.fromJson(json.decode(str));

String morePlayerInfoToJson(MorePlayerInfo data) => json.encode(data.toJson());

class MorePlayerInfo {
  MorePlayerInfo({
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

  MorePlayerInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;

  MorePlayerInfo copyWith({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) =>
      MorePlayerInfo(
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
    num? aid,
    String? bvid,
    bool? allowBp,
    bool? noShare,
    num? cid,
    num? maxLimit,
    num? pageNo,
    bool? hasNext,
    IpInfo? ipInfo,
    num? loginMid,
    String? loginMidHash,
    bool? isOwner,
    String? name,
    String? permission,
    LevelInfo? levelInfo,
    Vip? vip,
    num? answerStatus,
    num? blockTime,
    String? role,
    num? lastPlayTime,
    num? lastPlayCid,
    num? nowTime,
    num? onlineCount,
    bool? needLoginSubtitle,
    Subtitle? subtitle,
    String? previewToast,
    Options? options,
    List<GuideAttention>? guideAttention,
    OnlineSwitch? onlineSwitch,
    Fawkes? fawkes,
    ShowSwitch? showSwitch,
    BgmInfo? bgmInfo,
    bool? toastBlock,
    bool? isUpowerExclusive,
    bool? isUpowerPlay,
    bool? isUgcPayPreview,
    ElecHighLevel? elecHighLevel,
    bool? disableShowUpInfo,
  }) {
    _aid = aid;
    _bvid = bvid;
    _allowBp = allowBp;
    _noShare = noShare;
    _cid = cid;
    _maxLimit = maxLimit;
    _pageNo = pageNo;
    _hasNext = hasNext;
    _ipInfo = ipInfo;
    _loginMid = loginMid;
    _loginMidHash = loginMidHash;
    _isOwner = isOwner;
    _name = name;
    _permission = permission;
    _levelInfo = levelInfo;
    _vip = vip;
    _answerStatus = answerStatus;
    _blockTime = blockTime;
    _role = role;
    _lastPlayTime = lastPlayTime;
    _lastPlayCid = lastPlayCid;
    _nowTime = nowTime;
    _onlineCount = onlineCount;
    _needLoginSubtitle = needLoginSubtitle;
    _subtitle = subtitle;
    _previewToast = previewToast;
    _options = options;
    _guideAttention = guideAttention;
    _onlineSwitch = onlineSwitch;
    _fawkes = fawkes;
    _showSwitch = showSwitch;
    _bgmInfo = bgmInfo;
    _toastBlock = toastBlock;
    _isUpowerExclusive = isUpowerExclusive;
    _isUpowerPlay = isUpowerPlay;
    _isUgcPayPreview = isUgcPayPreview;
    _elecHighLevel = elecHighLevel;
    _disableShowUpInfo = disableShowUpInfo;
  }

  Data.fromJson(dynamic json) {
    _aid = json['aid'];
    _bvid = json['bvid'];
    _allowBp = json['allow_bp'];
    _noShare = json['no_share'];
    _cid = json['cid'];
    _maxLimit = json['max_limit'];
    _pageNo = json['page_no'];
    _hasNext = json['has_next'];
    _ipInfo = json['ip_info'] != null ? IpInfo.fromJson(json['ip_info']) : null;
    _loginMid = json['login_mid'];
    _loginMidHash = json['login_mid_hash'];
    _isOwner = json['is_owner'];
    _name = json['name'];
    _permission = json['permission'];
    _levelInfo = json['level_info'] != null
        ? LevelInfo.fromJson(json['level_info'])
        : null;
    _vip = json['vip'] != null ? Vip.fromJson(json['vip']) : null;
    _answerStatus = json['answer_status'];
    _blockTime = json['block_time'];
    _role = json['role'];
    _lastPlayTime = json['last_play_time'];
    _lastPlayCid = json['last_play_cid'];
    _nowTime = json['now_time'];
    _onlineCount = json['online_count'];
    _needLoginSubtitle = json['need_login_subtitle'];
    _subtitle =
        json['subtitle'] != null ? Subtitle.fromJson(json['subtitle']) : null;
    _previewToast = json['preview_toast'];
    _options =
        json['options'] != null ? Options.fromJson(json['options']) : null;
    if (json['guide_attention'] != null) {
      _guideAttention = [];
      json['guide_attention'].forEach((v) {
        _guideAttention?.add(GuideAttention.fromJson(v));
      });
    }
    _onlineSwitch = json['online_switch'] != null
        ? OnlineSwitch.fromJson(json['online_switch'])
        : null;
    _fawkes = json['fawkes'] != null ? Fawkes.fromJson(json['fawkes']) : null;
    _showSwitch = json['show_switch'] != null
        ? ShowSwitch.fromJson(json['show_switch'])
        : null;
    _bgmInfo =
        json['bgm_info'] != null ? BgmInfo.fromJson(json['bgm_info']) : null;
    _toastBlock = json['toast_block'];
    _isUpowerExclusive = json['is_upower_exclusive'];
    _isUpowerPlay = json['is_upower_play'];
    _isUgcPayPreview = json['is_ugc_pay_preview'];
    _elecHighLevel = json['elec_high_level'] != null
        ? ElecHighLevel.fromJson(json['elec_high_level'])
        : null;
    _disableShowUpInfo = json['disable_show_up_info'];
  }

  num? _aid;
  String? _bvid;
  bool? _allowBp;
  bool? _noShare;
  num? _cid;
  num? _maxLimit;
  num? _pageNo;
  bool? _hasNext;
  IpInfo? _ipInfo;
  num? _loginMid;
  String? _loginMidHash;
  bool? _isOwner;
  String? _name;
  String? _permission;
  LevelInfo? _levelInfo;
  Vip? _vip;
  num? _answerStatus;
  num? _blockTime;
  String? _role;
  num? _lastPlayTime;
  num? _lastPlayCid;
  num? _nowTime;
  num? _onlineCount;
  bool? _needLoginSubtitle;
  Subtitle? _subtitle;
  String? _previewToast;
  Options? _options;
  List<GuideAttention>? _guideAttention;
  OnlineSwitch? _onlineSwitch;
  Fawkes? _fawkes;
  ShowSwitch? _showSwitch;
  BgmInfo? _bgmInfo;
  bool? _toastBlock;
  bool? _isUpowerExclusive;
  bool? _isUpowerPlay;
  bool? _isUgcPayPreview;
  ElecHighLevel? _elecHighLevel;
  bool? _disableShowUpInfo;

  Data copyWith({
    num? aid,
    String? bvid,
    bool? allowBp,
    bool? noShare,
    num? cid,
    num? maxLimit,
    num? pageNo,
    bool? hasNext,
    IpInfo? ipInfo,
    num? loginMid,
    String? loginMidHash,
    bool? isOwner,
    String? name,
    String? permission,
    LevelInfo? levelInfo,
    Vip? vip,
    num? answerStatus,
    num? blockTime,
    String? role,
    num? lastPlayTime,
    num? lastPlayCid,
    num? nowTime,
    num? onlineCount,
    bool? needLoginSubtitle,
    Subtitle? subtitle,
    String? previewToast,
    Options? options,
    List<GuideAttention>? guideAttention,
    OnlineSwitch? onlineSwitch,
    Fawkes? fawkes,
    ShowSwitch? showSwitch,
    BgmInfo? bgmInfo,
    bool? toastBlock,
    bool? isUpowerExclusive,
    bool? isUpowerPlay,
    bool? isUgcPayPreview,
    ElecHighLevel? elecHighLevel,
    bool? disableShowUpInfo,
  }) =>
      Data(
        aid: aid ?? _aid,
        bvid: bvid ?? _bvid,
        allowBp: allowBp ?? _allowBp,
        noShare: noShare ?? _noShare,
        cid: cid ?? _cid,
        maxLimit: maxLimit ?? _maxLimit,
        pageNo: pageNo ?? _pageNo,
        hasNext: hasNext ?? _hasNext,
        ipInfo: ipInfo ?? _ipInfo,
        loginMid: loginMid ?? _loginMid,
        loginMidHash: loginMidHash ?? _loginMidHash,
        isOwner: isOwner ?? _isOwner,
        name: name ?? _name,
        permission: permission ?? _permission,
        levelInfo: levelInfo ?? _levelInfo,
        vip: vip ?? _vip,
        answerStatus: answerStatus ?? _answerStatus,
        blockTime: blockTime ?? _blockTime,
        role: role ?? _role,
        lastPlayTime: lastPlayTime ?? _lastPlayTime,
        lastPlayCid: lastPlayCid ?? _lastPlayCid,
        nowTime: nowTime ?? _nowTime,
        onlineCount: onlineCount ?? _onlineCount,
        needLoginSubtitle: needLoginSubtitle ?? _needLoginSubtitle,
        subtitle: subtitle ?? _subtitle,
        previewToast: previewToast ?? _previewToast,
        options: options ?? _options,
        guideAttention: guideAttention ?? _guideAttention,
        onlineSwitch: onlineSwitch ?? _onlineSwitch,
        fawkes: fawkes ?? _fawkes,
        showSwitch: showSwitch ?? _showSwitch,
        bgmInfo: bgmInfo ?? _bgmInfo,
        toastBlock: toastBlock ?? _toastBlock,
        isUpowerExclusive: isUpowerExclusive ?? _isUpowerExclusive,
        isUpowerPlay: isUpowerPlay ?? _isUpowerPlay,
        isUgcPayPreview: isUgcPayPreview ?? _isUgcPayPreview,
        elecHighLevel: elecHighLevel ?? _elecHighLevel,
        disableShowUpInfo: disableShowUpInfo ?? _disableShowUpInfo,
      );

  num? get aid => _aid;

  String? get bvid => _bvid;

  bool? get allowBp => _allowBp;

  bool? get noShare => _noShare;

  num? get cid => _cid;

  num? get maxLimit => _maxLimit;

  num? get pageNo => _pageNo;

  bool? get hasNext => _hasNext;

  IpInfo? get ipInfo => _ipInfo;

  num? get loginMid => _loginMid;

  String? get loginMidHash => _loginMidHash;

  bool? get isOwner => _isOwner;

  String? get name => _name;

  String? get permission => _permission;

  LevelInfo? get levelInfo => _levelInfo;

  Vip? get vip => _vip;

  num? get answerStatus => _answerStatus;

  num? get blockTime => _blockTime;

  String? get role => _role;

  num? get lastPlayTime => _lastPlayTime;

  num? get lastPlayCid => _lastPlayCid;

  num? get nowTime => _nowTime;

  num? get onlineCount => _onlineCount;

  bool? get needLoginSubtitle => _needLoginSubtitle;

  Subtitle? get subtitle => _subtitle;

  String? get previewToast => _previewToast;

  Options? get options => _options;

  List<GuideAttention>? get guideAttention => _guideAttention;

  OnlineSwitch? get onlineSwitch => _onlineSwitch;

  Fawkes? get fawkes => _fawkes;

  ShowSwitch? get showSwitch => _showSwitch;

  BgmInfo? get bgmInfo => _bgmInfo;

  bool? get toastBlock => _toastBlock;

  bool? get isUpowerExclusive => _isUpowerExclusive;

  bool? get isUpowerPlay => _isUpowerPlay;

  bool? get isUgcPayPreview => _isUgcPayPreview;

  ElecHighLevel? get elecHighLevel => _elecHighLevel;

  bool? get disableShowUpInfo => _disableShowUpInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aid'] = _aid;
    map['bvid'] = _bvid;
    map['allow_bp'] = _allowBp;
    map['no_share'] = _noShare;
    map['cid'] = _cid;
    map['max_limit'] = _maxLimit;
    map['page_no'] = _pageNo;
    map['has_next'] = _hasNext;
    if (_ipInfo != null) {
      map['ip_info'] = _ipInfo?.toJson();
    }
    map['login_mid'] = _loginMid;
    map['login_mid_hash'] = _loginMidHash;
    map['is_owner'] = _isOwner;
    map['name'] = _name;
    map['permission'] = _permission;
    if (_levelInfo != null) {
      map['level_info'] = _levelInfo?.toJson();
    }
    if (_vip != null) {
      map['vip'] = _vip?.toJson();
    }
    map['answer_status'] = _answerStatus;
    map['block_time'] = _blockTime;
    map['role'] = _role;
    map['last_play_time'] = _lastPlayTime;
    map['last_play_cid'] = _lastPlayCid;
    map['now_time'] = _nowTime;
    map['online_count'] = _onlineCount;
    map['need_login_subtitle'] = _needLoginSubtitle;
    if (_subtitle != null) {
      map['subtitle'] = _subtitle?.toJson();
    }
    map['preview_toast'] = _previewToast;
    if (_options != null) {
      map['options'] = _options?.toJson();
    }
    if (_guideAttention != null) {
      map['guide_attention'] = _guideAttention?.map((v) => v.toJson()).toList();
    }
    if (_onlineSwitch != null) {
      map['online_switch'] = _onlineSwitch?.toJson();
    }
    if (_fawkes != null) {
      map['fawkes'] = _fawkes?.toJson();
    }
    if (_showSwitch != null) {
      map['show_switch'] = _showSwitch?.toJson();
    }
    if (_bgmInfo != null) {
      map['bgm_info'] = _bgmInfo?.toJson();
    }
    map['toast_block'] = _toastBlock;
    map['is_upower_exclusive'] = _isUpowerExclusive;
    map['is_upower_play'] = _isUpowerPlay;
    map['is_ugc_pay_preview'] = _isUgcPayPreview;
    if (_elecHighLevel != null) {
      map['elec_high_level'] = _elecHighLevel?.toJson();
    }
    map['disable_show_up_info'] = _disableShowUpInfo;
    return map;
  }
}

ElecHighLevel elecHighLevelFromJson(String str) =>
    ElecHighLevel.fromJson(json.decode(str));

String elecHighLevelToJson(ElecHighLevel data) => json.encode(data.toJson());

class ElecHighLevel {
  ElecHighLevel({
    num? privilegeType,
    String? levelStr,
    String? title,
    String? intro,
  }) {
    _privilegeType = privilegeType;
    _levelStr = levelStr;
    _title = title;
    _intro = intro;
  }

  ElecHighLevel.fromJson(dynamic json) {
    _privilegeType = json['privilege_type'];
    _levelStr = json['level_str'];
    _title = json['title'];
    _intro = json['intro'];
  }

  num? _privilegeType;
  String? _levelStr;
  String? _title;
  String? _intro;

  ElecHighLevel copyWith({
    num? privilegeType,
    String? levelStr,
    String? title,
    String? intro,
  }) =>
      ElecHighLevel(
        privilegeType: privilegeType ?? _privilegeType,
        levelStr: levelStr ?? _levelStr,
        title: title ?? _title,
        intro: intro ?? _intro,
      );

  num? get privilegeType => _privilegeType;

  String? get levelStr => _levelStr;

  String? get title => _title;

  String? get intro => _intro;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['privilege_type'] = _privilegeType;
    map['level_str'] = _levelStr;
    map['title'] = _title;
    map['intro'] = _intro;
    return map;
  }
}

BgmInfo bgmInfoFromJson(String str) => BgmInfo.fromJson(json.decode(str));

String bgmInfoToJson(BgmInfo data) => json.encode(data.toJson());

class BgmInfo {
  BgmInfo({
    String? musicId,
    String? musicTitle,
    String? jumpUrl,
  }) {
    _musicId = musicId;
    _musicTitle = musicTitle;
    _jumpUrl = jumpUrl;
  }

  BgmInfo.fromJson(dynamic json) {
    _musicId = json['music_id'];
    _musicTitle = json['music_title'];
    _jumpUrl = json['jump_url'];
  }

  String? _musicId;
  String? _musicTitle;
  String? _jumpUrl;

  BgmInfo copyWith({
    String? musicId,
    String? musicTitle,
    String? jumpUrl,
  }) =>
      BgmInfo(
        musicId: musicId ?? _musicId,
        musicTitle: musicTitle ?? _musicTitle,
        jumpUrl: jumpUrl ?? _jumpUrl,
      );

  String? get musicId => _musicId;

  String? get musicTitle => _musicTitle;

  String? get jumpUrl => _jumpUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['music_id'] = _musicId;
    map['music_title'] = _musicTitle;
    map['jump_url'] = _jumpUrl;
    return map;
  }
}

ShowSwitch showSwitchFromJson(String str) =>
    ShowSwitch.fromJson(json.decode(str));

String showSwitchToJson(ShowSwitch data) => json.encode(data.toJson());

class ShowSwitch {
  ShowSwitch({
    bool? longProgress,
  }) {
    _longProgress = longProgress;
  }

  ShowSwitch.fromJson(dynamic json) {
    _longProgress = json['long_progress'];
  }

  bool? _longProgress;

  ShowSwitch copyWith({
    bool? longProgress,
  }) =>
      ShowSwitch(
        longProgress: longProgress ?? _longProgress,
      );

  bool? get longProgress => _longProgress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long_progress'] = _longProgress;
    return map;
  }
}

Fawkes fawkesFromJson(String str) => Fawkes.fromJson(json.decode(str));

String fawkesToJson(Fawkes data) => json.encode(data.toJson());

class Fawkes {
  Fawkes({
    num? configVersion,
    num? ffVersion,
  }) {
    _configVersion = configVersion;
    _ffVersion = ffVersion;
  }

  Fawkes.fromJson(dynamic json) {
    _configVersion = json['config_version'];
    _ffVersion = json['ff_version'];
  }

  num? _configVersion;
  num? _ffVersion;

  Fawkes copyWith({
    num? configVersion,
    num? ffVersion,
  }) =>
      Fawkes(
        configVersion: configVersion ?? _configVersion,
        ffVersion: ffVersion ?? _ffVersion,
      );

  num? get configVersion => _configVersion;

  num? get ffVersion => _ffVersion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['config_version'] = _configVersion;
    map['ff_version'] = _ffVersion;
    return map;
  }
}

OnlineSwitch onlineSwitchFromJson(String str) =>
    OnlineSwitch.fromJson(json.decode(str));

String onlineSwitchToJson(OnlineSwitch data) => json.encode(data.toJson());

class OnlineSwitch {
  OnlineSwitch({
    String? enableGrayDashPlayback,
    String? newBroadcast,
    String? realtimeDm,
    String? subtitleSubmitSwitch,
  }) {
    _enableGrayDashPlayback = enableGrayDashPlayback;
    _newBroadcast = newBroadcast;
    _realtimeDm = realtimeDm;
    _subtitleSubmitSwitch = subtitleSubmitSwitch;
  }

  OnlineSwitch.fromJson(dynamic json) {
    _enableGrayDashPlayback = json['enable_gray_dash_playback'];
    _newBroadcast = json['new_broadcast'];
    _realtimeDm = json['realtime_dm'];
    _subtitleSubmitSwitch = json['subtitle_submit_switch'];
  }

  String? _enableGrayDashPlayback;
  String? _newBroadcast;
  String? _realtimeDm;
  String? _subtitleSubmitSwitch;

  OnlineSwitch copyWith({
    String? enableGrayDashPlayback,
    String? newBroadcast,
    String? realtimeDm,
    String? subtitleSubmitSwitch,
  }) =>
      OnlineSwitch(
        enableGrayDashPlayback:
            enableGrayDashPlayback ?? _enableGrayDashPlayback,
        newBroadcast: newBroadcast ?? _newBroadcast,
        realtimeDm: realtimeDm ?? _realtimeDm,
        subtitleSubmitSwitch: subtitleSubmitSwitch ?? _subtitleSubmitSwitch,
      );

  String? get enableGrayDashPlayback => _enableGrayDashPlayback;

  String? get newBroadcast => _newBroadcast;

  String? get realtimeDm => _realtimeDm;

  String? get subtitleSubmitSwitch => _subtitleSubmitSwitch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enable_gray_dash_playback'] = _enableGrayDashPlayback;
    map['new_broadcast'] = _newBroadcast;
    map['realtime_dm'] = _realtimeDm;
    map['subtitle_submit_switch'] = _subtitleSubmitSwitch;
    return map;
  }
}

GuideAttention guideAttentionFromJson(String str) =>
    GuideAttention.fromJson(json.decode(str));

String guideAttentionToJson(GuideAttention data) => json.encode(data.toJson());

class GuideAttention {
  GuideAttention({
    num? type,
    num? from,
    num? to,
    num? posX,
    num? posY,
  }) {
    _type = type;
    _from = from;
    _to = to;
    _posX = posX;
    _posY = posY;
  }

  GuideAttention.fromJson(dynamic json) {
    _type = json['type'];
    _from = json['from'];
    _to = json['to'];
    _posX = json['pos_x'];
    _posY = json['pos_y'];
  }

  num? _type;
  num? _from;
  num? _to;
  num? _posX;
  num? _posY;

  GuideAttention copyWith({
    num? type,
    num? from,
    num? to,
    num? posX,
    num? posY,
  }) =>
      GuideAttention(
        type: type ?? _type,
        from: from ?? _from,
        to: to ?? _to,
        posX: posX ?? _posX,
        posY: posY ?? _posY,
      );

  num? get type => _type;

  num? get from => _from;

  num? get to => _to;

  num? get posX => _posX;

  num? get posY => _posY;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['from'] = _from;
    map['to'] = _to;
    map['pos_x'] = _posX;
    map['pos_y'] = _posY;
    return map;
  }
}

Options optionsFromJson(String str) => Options.fromJson(json.decode(str));

String optionsToJson(Options data) => json.encode(data.toJson());

class Options {
  Options({
    bool? is360,
    bool? withoutVip,
  }) {
    _is360 = is360;
    _withoutVip = withoutVip;
  }

  Options.fromJson(dynamic json) {
    _is360 = json['is_360'];
    _withoutVip = json['without_vip'];
  }

  bool? _is360;
  bool? _withoutVip;

  Options copyWith({
    bool? is360,
    bool? withoutVip,
  }) =>
      Options(
        is360: is360 ?? _is360,
        withoutVip: withoutVip ?? _withoutVip,
      );

  bool? get is360 => _is360;

  bool? get withoutVip => _withoutVip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_360'] = _is360;
    map['without_vip'] = _withoutVip;
    return map;
  }
}

Subtitle subtitleFromJson(String str) => Subtitle.fromJson(json.decode(str));

String subtitleToJson(Subtitle data) => json.encode(data.toJson());

class Subtitle {
  Subtitle({
    bool? allowSubmit,
    String? lan,
    String? lanDoc,
    List<Subtitles>? subtitles,
  }) {
    _allowSubmit = allowSubmit;
    _lan = lan;
    _lanDoc = lanDoc;
    _subtitles = subtitles;
  }

  Subtitle.fromJson(dynamic json) {
    _allowSubmit = json['allow_submit'];
    _lan = json['lan'];
    _lanDoc = json['lan_doc'];
    if (json['subtitles'] != null) {
      _subtitles = [];
      json['subtitles'].forEach((v) {
        _subtitles?.add(Subtitles.fromJson(v));
      });
    }
  }

  bool? _allowSubmit;
  String? _lan;
  String? _lanDoc;
  List<Subtitles>? _subtitles;

  Subtitle copyWith({
    bool? allowSubmit,
    String? lan,
    String? lanDoc,
    List<Subtitles>? subtitles,
  }) =>
      Subtitle(
        allowSubmit: allowSubmit ?? _allowSubmit,
        lan: lan ?? _lan,
        lanDoc: lanDoc ?? _lanDoc,
        subtitles: subtitles ?? _subtitles,
      );

  bool? get allowSubmit => _allowSubmit;

  String? get lan => _lan;

  String? get lanDoc => _lanDoc;

  List<Subtitles>? get subtitles => _subtitles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['allow_submit'] = _allowSubmit;
    map['lan'] = _lan;
    map['lan_doc'] = _lanDoc;
    if (_subtitles != null) {
      map['subtitles'] = _subtitles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Subtitles subtitlesFromJson(String str) => Subtitles.fromJson(json.decode(str));

String subtitlesToJson(Subtitles data) => json.encode(data.toJson());

class Subtitles {
  Subtitles({
    num? id,
    String? lan,
    String? lanDoc,
    bool? isLock,
    String? subtitleUrl,
    num? type,
    String? idStr,
    num? aiType,
    num? aiStatus,
  }) {
    _id = id;
    _lan = lan;
    _lanDoc = lanDoc;
    _isLock = isLock;
    _subtitleUrl = subtitleUrl;
    _type = type;
    _idStr = idStr;
    _aiType = aiType;
    _aiStatus = aiStatus;
  }

  Subtitles.fromJson(dynamic json) {
    _id = json['id'];
    _lan = json['lan'];
    _lanDoc = json['lan_doc'];
    _isLock = json['is_lock'];
    _subtitleUrl = json['subtitle_url'];
    _type = json['type'];
    _idStr = json['id_str'];
    _aiType = json['ai_type'];
    _aiStatus = json['ai_status'];
  }

  num? _id;
  String? _lan;
  String? _lanDoc;
  bool? _isLock;
  String? _subtitleUrl;
  num? _type;
  String? _idStr;
  num? _aiType;
  num? _aiStatus;

  Subtitles copyWith({
    num? id,
    String? lan,
    String? lanDoc,
    bool? isLock,
    String? subtitleUrl,
    num? type,
    String? idStr,
    num? aiType,
    num? aiStatus,
  }) =>
      Subtitles(
        id: id ?? _id,
        lan: lan ?? _lan,
        lanDoc: lanDoc ?? _lanDoc,
        isLock: isLock ?? _isLock,
        subtitleUrl: subtitleUrl ?? _subtitleUrl,
        type: type ?? _type,
        idStr: idStr ?? _idStr,
        aiType: aiType ?? _aiType,
        aiStatus: aiStatus ?? _aiStatus,
      );

  num? get id => _id;

  String? get lan => _lan;

  String? get lanDoc => _lanDoc;

  bool? get isLock => _isLock;

  String? get subtitleUrl => _subtitleUrl;

  num? get type => _type;

  String? get idStr => _idStr;

  num? get aiType => _aiType;

  num? get aiStatus => _aiStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['lan'] = _lan;
    map['lan_doc'] = _lanDoc;
    map['is_lock'] = _isLock;
    map['subtitle_url'] = _subtitleUrl;
    map['type'] = _type;
    map['id_str'] = _idStr;
    map['ai_type'] = _aiType;
    map['ai_status'] = _aiStatus;
    return map;
  }
}

Vip vipFromJson(String str) => Vip.fromJson(json.decode(str));

String vipToJson(Vip data) => json.encode(data.toJson());

class Vip {
  Vip({
    num? type,
    num? status,
    num? dueDate,
    num? vipPayType,
    num? themeType,
    Label? label,
    num? avatarSubscript,
    String? nicknameColor,
    num? role,
    String? avatarSubscriptUrl,
    num? tvVipStatus,
    num? tvVipPayType,
    num? tvDueDate,
    AvatarIcon? avatarIcon,
  }) {
    _type = type;
    _status = status;
    _dueDate = dueDate;
    _vipPayType = vipPayType;
    _themeType = themeType;
    _label = label;
    _avatarSubscript = avatarSubscript;
    _nicknameColor = nicknameColor;
    _role = role;
    _avatarSubscriptUrl = avatarSubscriptUrl;
    _tvVipStatus = tvVipStatus;
    _tvVipPayType = tvVipPayType;
    _tvDueDate = tvDueDate;
    _avatarIcon = avatarIcon;
  }

  Vip.fromJson(dynamic json) {
    _type = json['type'];
    _status = json['status'];
    _dueDate = json['due_date'];
    _vipPayType = json['vip_pay_type'];
    _themeType = json['theme_type'];
    _label = json['label'] != null ? Label.fromJson(json['label']) : null;
    _avatarSubscript = json['avatar_subscript'];
    _nicknameColor = json['nickname_color'];
    _role = json['role'];
    _avatarSubscriptUrl = json['avatar_subscript_url'];
    _tvVipStatus = json['tv_vip_status'];
    _tvVipPayType = json['tv_vip_pay_type'];
    _tvDueDate = json['tv_due_date'];
    _avatarIcon = json['avatar_icon'] != null
        ? AvatarIcon.fromJson(json['avatar_icon'])
        : null;
  }

  num? _type;
  num? _status;
  num? _dueDate;
  num? _vipPayType;
  num? _themeType;
  Label? _label;
  num? _avatarSubscript;
  String? _nicknameColor;
  num? _role;
  String? _avatarSubscriptUrl;
  num? _tvVipStatus;
  num? _tvVipPayType;
  num? _tvDueDate;
  AvatarIcon? _avatarIcon;

  Vip copyWith({
    num? type,
    num? status,
    num? dueDate,
    num? vipPayType,
    num? themeType,
    Label? label,
    num? avatarSubscript,
    String? nicknameColor,
    num? role,
    String? avatarSubscriptUrl,
    num? tvVipStatus,
    num? tvVipPayType,
    num? tvDueDate,
    AvatarIcon? avatarIcon,
  }) =>
      Vip(
        type: type ?? _type,
        status: status ?? _status,
        dueDate: dueDate ?? _dueDate,
        vipPayType: vipPayType ?? _vipPayType,
        themeType: themeType ?? _themeType,
        label: label ?? _label,
        avatarSubscript: avatarSubscript ?? _avatarSubscript,
        nicknameColor: nicknameColor ?? _nicknameColor,
        role: role ?? _role,
        avatarSubscriptUrl: avatarSubscriptUrl ?? _avatarSubscriptUrl,
        tvVipStatus: tvVipStatus ?? _tvVipStatus,
        tvVipPayType: tvVipPayType ?? _tvVipPayType,
        tvDueDate: tvDueDate ?? _tvDueDate,
        avatarIcon: avatarIcon ?? _avatarIcon,
      );

  num? get type => _type;

  num? get status => _status;

  num? get dueDate => _dueDate;

  num? get vipPayType => _vipPayType;

  num? get themeType => _themeType;

  Label? get label => _label;

  num? get avatarSubscript => _avatarSubscript;

  String? get nicknameColor => _nicknameColor;

  num? get role => _role;

  String? get avatarSubscriptUrl => _avatarSubscriptUrl;

  num? get tvVipStatus => _tvVipStatus;

  num? get tvVipPayType => _tvVipPayType;

  num? get tvDueDate => _tvDueDate;

  AvatarIcon? get avatarIcon => _avatarIcon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['status'] = _status;
    map['due_date'] = _dueDate;
    map['vip_pay_type'] = _vipPayType;
    map['theme_type'] = _themeType;
    if (_label != null) {
      map['label'] = _label?.toJson();
    }
    map['avatar_subscript'] = _avatarSubscript;
    map['nickname_color'] = _nicknameColor;
    map['role'] = _role;
    map['avatar_subscript_url'] = _avatarSubscriptUrl;
    map['tv_vip_status'] = _tvVipStatus;
    map['tv_vip_pay_type'] = _tvVipPayType;
    map['tv_due_date'] = _tvDueDate;
    if (_avatarIcon != null) {
      map['avatar_icon'] = _avatarIcon?.toJson();
    }
    return map;
  }
}

AvatarIcon avatarIconFromJson(String str) =>
    AvatarIcon.fromJson(json.decode(str));

String avatarIconToJson(AvatarIcon data) => json.encode(data.toJson());

class AvatarIcon {
  AvatarIcon({
    dynamic iconResource,
  }) {
    _iconResource = iconResource;
  }

  AvatarIcon.fromJson(dynamic json) {
    _iconResource = json['icon_resource'];
  }

  dynamic _iconResource;

  AvatarIcon copyWith({
    dynamic iconResource,
  }) =>
      AvatarIcon(
        iconResource: iconResource ?? _iconResource,
      );

  dynamic get iconResource => _iconResource;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon_resource'] = _iconResource;
    return map;
  }
}

Label labelFromJson(String str) => Label.fromJson(json.decode(str));

String labelToJson(Label data) => json.encode(data.toJson());

class Label {
  Label({
    String? path,
    String? text,
    String? labelTheme,
    String? textColor,
    num? bgStyle,
    String? bgColor,
    String? borderColor,
    bool? useImgLabel,
    String? imgLabelUriHans,
    String? imgLabelUriHant,
    String? imgLabelUriHansStatic,
    String? imgLabelUriHantStatic,
  }) {
    _path = path;
    _text = text;
    _labelTheme = labelTheme;
    _textColor = textColor;
    _bgStyle = bgStyle;
    _bgColor = bgColor;
    _borderColor = borderColor;
    _useImgLabel = useImgLabel;
    _imgLabelUriHans = imgLabelUriHans;
    _imgLabelUriHant = imgLabelUriHant;
    _imgLabelUriHansStatic = imgLabelUriHansStatic;
    _imgLabelUriHantStatic = imgLabelUriHantStatic;
  }

  Label.fromJson(dynamic json) {
    _path = json['path'];
    _text = json['text'];
    _labelTheme = json['label_theme'];
    _textColor = json['text_color'];
    _bgStyle = json['bg_style'];
    _bgColor = json['bg_color'];
    _borderColor = json['border_color'];
    _useImgLabel = json['use_img_label'];
    _imgLabelUriHans = json['img_label_uri_hans'];
    _imgLabelUriHant = json['img_label_uri_hant'];
    _imgLabelUriHansStatic = json['img_label_uri_hans_static'];
    _imgLabelUriHantStatic = json['img_label_uri_hant_static'];
  }

  String? _path;
  String? _text;
  String? _labelTheme;
  String? _textColor;
  num? _bgStyle;
  String? _bgColor;
  String? _borderColor;
  bool? _useImgLabel;
  String? _imgLabelUriHans;
  String? _imgLabelUriHant;
  String? _imgLabelUriHansStatic;
  String? _imgLabelUriHantStatic;

  Label copyWith({
    String? path,
    String? text,
    String? labelTheme,
    String? textColor,
    num? bgStyle,
    String? bgColor,
    String? borderColor,
    bool? useImgLabel,
    String? imgLabelUriHans,
    String? imgLabelUriHant,
    String? imgLabelUriHansStatic,
    String? imgLabelUriHantStatic,
  }) =>
      Label(
        path: path ?? _path,
        text: text ?? _text,
        labelTheme: labelTheme ?? _labelTheme,
        textColor: textColor ?? _textColor,
        bgStyle: bgStyle ?? _bgStyle,
        bgColor: bgColor ?? _bgColor,
        borderColor: borderColor ?? _borderColor,
        useImgLabel: useImgLabel ?? _useImgLabel,
        imgLabelUriHans: imgLabelUriHans ?? _imgLabelUriHans,
        imgLabelUriHant: imgLabelUriHant ?? _imgLabelUriHant,
        imgLabelUriHansStatic: imgLabelUriHansStatic ?? _imgLabelUriHansStatic,
        imgLabelUriHantStatic: imgLabelUriHantStatic ?? _imgLabelUriHantStatic,
      );

  String? get path => _path;

  String? get text => _text;

  String? get labelTheme => _labelTheme;

  String? get textColor => _textColor;

  num? get bgStyle => _bgStyle;

  String? get bgColor => _bgColor;

  String? get borderColor => _borderColor;

  bool? get useImgLabel => _useImgLabel;

  String? get imgLabelUriHans => _imgLabelUriHans;

  String? get imgLabelUriHant => _imgLabelUriHant;

  String? get imgLabelUriHansStatic => _imgLabelUriHansStatic;

  String? get imgLabelUriHantStatic => _imgLabelUriHantStatic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['path'] = _path;
    map['text'] = _text;
    map['label_theme'] = _labelTheme;
    map['text_color'] = _textColor;
    map['bg_style'] = _bgStyle;
    map['bg_color'] = _bgColor;
    map['border_color'] = _borderColor;
    map['use_img_label'] = _useImgLabel;
    map['img_label_uri_hans'] = _imgLabelUriHans;
    map['img_label_uri_hant'] = _imgLabelUriHant;
    map['img_label_uri_hans_static'] = _imgLabelUriHansStatic;
    map['img_label_uri_hant_static'] = _imgLabelUriHantStatic;
    return map;
  }
}

LevelInfo levelInfoFromJson(String str) => LevelInfo.fromJson(json.decode(str));

String levelInfoToJson(LevelInfo data) => json.encode(data.toJson());

class LevelInfo {
  LevelInfo({
    num? currentLevel,
    num? currentMin,
    num? currentExp,
    num? nextExp,
    num? levelUp,
  }) {
    _currentLevel = currentLevel;
    _currentMin = currentMin;
    _currentExp = currentExp;
    _nextExp = nextExp;
    _levelUp = levelUp;
  }

  LevelInfo.fromJson(dynamic json) {
    _currentLevel = json['current_level'];
    _currentMin = json['current_min'];
    _currentExp = json['current_exp'];
    _nextExp = json['next_exp'];
    _levelUp = json['level_up'];
  }

  num? _currentLevel;
  num? _currentMin;
  num? _currentExp;
  num? _nextExp;
  num? _levelUp;

  LevelInfo copyWith({
    num? currentLevel,
    num? currentMin,
    num? currentExp,
    num? nextExp,
    num? levelUp,
  }) =>
      LevelInfo(
        currentLevel: currentLevel ?? _currentLevel,
        currentMin: currentMin ?? _currentMin,
        currentExp: currentExp ?? _currentExp,
        nextExp: nextExp ?? _nextExp,
        levelUp: levelUp ?? _levelUp,
      );

  num? get currentLevel => _currentLevel;

  num? get currentMin => _currentMin;

  num? get currentExp => _currentExp;

  num? get nextExp => _nextExp;

  num? get levelUp => _levelUp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_level'] = _currentLevel;
    map['current_min'] = _currentMin;
    map['current_exp'] = _currentExp;
    map['next_exp'] = _nextExp;
    map['level_up'] = _levelUp;
    return map;
  }
}

IpInfo ipInfoFromJson(String str) => IpInfo.fromJson(json.decode(str));

String ipInfoToJson(IpInfo data) => json.encode(data.toJson());

class IpInfo {
  IpInfo({
    String? ip,
    String? zoneIp,
    num? zoneId,
    String? country,
    String? province,
    String? city,
  }) {
    _ip = ip;
    _zoneIp = zoneIp;
    _zoneId = zoneId;
    _country = country;
    _province = province;
    _city = city;
  }

  IpInfo.fromJson(dynamic json) {
    _ip = json['ip'];
    _zoneIp = json['zone_ip'];
    _zoneId = json['zone_id'];
    _country = json['country'];
    _province = json['province'];
    _city = json['city'];
  }

  String? _ip;
  String? _zoneIp;
  num? _zoneId;
  String? _country;
  String? _province;
  String? _city;

  IpInfo copyWith({
    String? ip,
    String? zoneIp,
    num? zoneId,
    String? country,
    String? province,
    String? city,
  }) =>
      IpInfo(
        ip: ip ?? _ip,
        zoneIp: zoneIp ?? _zoneIp,
        zoneId: zoneId ?? _zoneId,
        country: country ?? _country,
        province: province ?? _province,
        city: city ?? _city,
      );

  String? get ip => _ip;

  String? get zoneIp => _zoneIp;

  num? get zoneId => _zoneId;

  String? get country => _country;

  String? get province => _province;

  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ip'] = _ip;
    map['zone_ip'] = _zoneIp;
    map['zone_id'] = _zoneId;
    map['country'] = _country;
    map['province'] = _province;
    map['city'] = _city;
    return map;
  }
}
