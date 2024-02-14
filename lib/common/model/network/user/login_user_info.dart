import 'dart:convert';

LoginUserInfo loginUserInfoFromJson(String str) =>
    LoginUserInfo.fromJson(json.decode(str));

String loginUserInfoToJson(LoginUserInfo data) => json.encode(data.toJson());

class LoginUserInfo {
  LoginUserInfo({
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

  LoginUserInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _ttl = json['ttl'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  num? _code;
  String? _message;
  num? _ttl;
  Data? _data;

  LoginUserInfo copyWith({
    num? code,
    String? message,
    num? ttl,
    Data? data,
  }) =>
      LoginUserInfo(
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
    bool? isLogin,
    num? emailVerified,
    String? face,
    num? faceNft,
    num? faceNftType,
    LevelInfo? levelInfo,
    num? mid,
    num? mobileVerified,
    num? money,
    num? moral,
    Official? official,
    OfficialVerify? officialVerify,
    Pendant? pendant,
    num? scores,
    String? uname,
    num? vipDueDate,
    num? vipStatus,
    num? vipType,
    num? vipPayType,
    num? vipThemeType,
    VipLabel? vipLabel,
    num? vipAvatarSubscript,
    String? vipNicknameColor,
    Vip? vip,
    Wallet? wallet,
    bool? hasShop,
    String? shopUrl,
    num? allowanceCount,
    num? answerStatus,
    num? isSeniorMember,
    WbiImg? wbiImg,
    bool? isJury,
  }) {
    _isLogin = isLogin;
    _emailVerified = emailVerified;
    _face = face;
    _faceNft = faceNft;
    _faceNftType = faceNftType;
    _levelInfo = levelInfo;
    _mid = mid;
    _mobileVerified = mobileVerified;
    _money = money;
    _moral = moral;
    _official = official;
    _officialVerify = officialVerify;
    _pendant = pendant;
    _scores = scores;
    _uname = uname;
    _vipDueDate = vipDueDate;
    _vipStatus = vipStatus;
    _vipType = vipType;
    _vipPayType = vipPayType;
    _vipThemeType = vipThemeType;
    _vipLabel = vipLabel;
    _vipAvatarSubscript = vipAvatarSubscript;
    _vipNicknameColor = vipNicknameColor;
    _vip = vip;
    _wallet = wallet;
    _hasShop = hasShop;
    _shopUrl = shopUrl;
    _allowanceCount = allowanceCount;
    _answerStatus = answerStatus;
    _isSeniorMember = isSeniorMember;
    _wbiImg = wbiImg;
    _isJury = isJury;
  }

  Data.fromJson(dynamic json) {
    _isLogin = json['isLogin'];
    _emailVerified = json['email_verified'];
    _face = json['face'];
    _faceNft = json['face_nft'];
    _faceNftType = json['face_nft_type'];
    _levelInfo = json['level_info'] != null
        ? LevelInfo.fromJson(json['level_info'])
        : null;
    _mid = json['mid'];
    _mobileVerified = json['mobile_verified'];
    _money = json['money'];
    _moral = json['moral'];
    _official =
        json['official'] != null ? Official.fromJson(json['official']) : null;
    _officialVerify = json['officialVerify'] != null
        ? OfficialVerify.fromJson(json['officialVerify'])
        : null;
    _pendant =
        json['pendant'] != null ? Pendant.fromJson(json['pendant']) : null;
    _scores = json['scores'];
    _uname = json['uname'];
    _vipDueDate = json['vipDueDate'];
    _vipStatus = json['vipStatus'];
    _vipType = json['vipType'];
    _vipPayType = json['vip_pay_type'];
    _vipThemeType = json['vip_theme_type'];
    _vipLabel =
        json['vip_label'] != null ? VipLabel.fromJson(json['vip_label']) : null;
    _vipAvatarSubscript = json['vip_avatar_subscript'];
    _vipNicknameColor = json['vip_nickname_color'];
    _vip = json['vip'] != null ? Vip.fromJson(json['vip']) : null;
    _wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    _hasShop = json['has_shop'];
    _shopUrl = json['shop_url'];
    _allowanceCount = json['allowance_count'];
    _answerStatus = json['answer_status'];
    _isSeniorMember = json['is_senior_member'];
    _wbiImg = json['wbi_img'] != null ? WbiImg.fromJson(json['wbi_img']) : null;
    _isJury = json['is_jury'];
  }

  bool? _isLogin;
  num? _emailVerified;
  String? _face;
  num? _faceNft;
  num? _faceNftType;
  LevelInfo? _levelInfo;
  num? _mid;
  num? _mobileVerified;
  num? _money;
  num? _moral;
  Official? _official;
  OfficialVerify? _officialVerify;
  Pendant? _pendant;
  num? _scores;
  String? _uname;
  num? _vipDueDate;
  num? _vipStatus;
  num? _vipType;
  num? _vipPayType;
  num? _vipThemeType;
  VipLabel? _vipLabel;
  num? _vipAvatarSubscript;
  String? _vipNicknameColor;
  Vip? _vip;
  Wallet? _wallet;
  bool? _hasShop;
  String? _shopUrl;
  num? _allowanceCount;
  num? _answerStatus;
  num? _isSeniorMember;
  WbiImg? _wbiImg;
  bool? _isJury;

  Data copyWith({
    bool? isLogin,
    num? emailVerified,
    String? face,
    num? faceNft,
    num? faceNftType,
    LevelInfo? levelInfo,
    num? mid,
    num? mobileVerified,
    num? money,
    num? moral,
    Official? official,
    OfficialVerify? officialVerify,
    Pendant? pendant,
    num? scores,
    String? uname,
    num? vipDueDate,
    num? vipStatus,
    num? vipType,
    num? vipPayType,
    num? vipThemeType,
    VipLabel? vipLabel,
    num? vipAvatarSubscript,
    String? vipNicknameColor,
    Vip? vip,
    Wallet? wallet,
    bool? hasShop,
    String? shopUrl,
    num? allowanceCount,
    num? answerStatus,
    num? isSeniorMember,
    WbiImg? wbiImg,
    bool? isJury,
  }) =>
      Data(
        isLogin: isLogin ?? _isLogin,
        emailVerified: emailVerified ?? _emailVerified,
        face: face ?? _face,
        faceNft: faceNft ?? _faceNft,
        faceNftType: faceNftType ?? _faceNftType,
        levelInfo: levelInfo ?? _levelInfo,
        mid: mid ?? _mid,
        mobileVerified: mobileVerified ?? _mobileVerified,
        money: money ?? _money,
        moral: moral ?? _moral,
        official: official ?? _official,
        officialVerify: officialVerify ?? _officialVerify,
        pendant: pendant ?? _pendant,
        scores: scores ?? _scores,
        uname: uname ?? _uname,
        vipDueDate: vipDueDate ?? _vipDueDate,
        vipStatus: vipStatus ?? _vipStatus,
        vipType: vipType ?? _vipType,
        vipPayType: vipPayType ?? _vipPayType,
        vipThemeType: vipThemeType ?? _vipThemeType,
        vipLabel: vipLabel ?? _vipLabel,
        vipAvatarSubscript: vipAvatarSubscript ?? _vipAvatarSubscript,
        vipNicknameColor: vipNicknameColor ?? _vipNicknameColor,
        vip: vip ?? _vip,
        wallet: wallet ?? _wallet,
        hasShop: hasShop ?? _hasShop,
        shopUrl: shopUrl ?? _shopUrl,
        allowanceCount: allowanceCount ?? _allowanceCount,
        answerStatus: answerStatus ?? _answerStatus,
        isSeniorMember: isSeniorMember ?? _isSeniorMember,
        wbiImg: wbiImg ?? _wbiImg,
        isJury: isJury ?? _isJury,
      );

  bool? get isLogin => _isLogin;

  num? get emailVerified => _emailVerified;

  String? get face => _face;

  num? get faceNft => _faceNft;

  num? get faceNftType => _faceNftType;

  LevelInfo? get levelInfo => _levelInfo;

  num? get mid => _mid;

  num? get mobileVerified => _mobileVerified;

  num? get money => _money;

  num? get moral => _moral;

  Official? get official => _official;

  OfficialVerify? get officialVerify => _officialVerify;

  Pendant? get pendant => _pendant;

  num? get scores => _scores;

  String? get uname => _uname;

  num? get vipDueDate => _vipDueDate;

  num? get vipStatus => _vipStatus;

  num? get vipType => _vipType;

  num? get vipPayType => _vipPayType;

  num? get vipThemeType => _vipThemeType;

  VipLabel? get vipLabel => _vipLabel;

  num? get vipAvatarSubscript => _vipAvatarSubscript;

  String? get vipNicknameColor => _vipNicknameColor;

  Vip? get vip => _vip;

  Wallet? get wallet => _wallet;

  bool? get hasShop => _hasShop;

  String? get shopUrl => _shopUrl;

  num? get allowanceCount => _allowanceCount;

  num? get answerStatus => _answerStatus;

  num? get isSeniorMember => _isSeniorMember;

  WbiImg? get wbiImg => _wbiImg;

  bool? get isJury => _isJury;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLogin'] = _isLogin;
    map['email_verified'] = _emailVerified;
    map['face'] = _face;
    map['face_nft'] = _faceNft;
    map['face_nft_type'] = _faceNftType;
    if (_levelInfo != null) {
      map['level_info'] = _levelInfo?.toJson();
    }
    map['mid'] = _mid;
    map['mobile_verified'] = _mobileVerified;
    map['money'] = _money;
    map['moral'] = _moral;
    if (_official != null) {
      map['official'] = _official?.toJson();
    }
    if (_officialVerify != null) {
      map['officialVerify'] = _officialVerify?.toJson();
    }
    if (_pendant != null) {
      map['pendant'] = _pendant?.toJson();
    }
    map['scores'] = _scores;
    map['uname'] = _uname;
    map['vipDueDate'] = _vipDueDate;
    map['vipStatus'] = _vipStatus;
    map['vipType'] = _vipType;
    map['vip_pay_type'] = _vipPayType;
    map['vip_theme_type'] = _vipThemeType;
    if (_vipLabel != null) {
      map['vip_label'] = _vipLabel?.toJson();
    }
    map['vip_avatar_subscript'] = _vipAvatarSubscript;
    map['vip_nickname_color'] = _vipNicknameColor;
    if (_vip != null) {
      map['vip'] = _vip?.toJson();
    }
    if (_wallet != null) {
      map['wallet'] = _wallet?.toJson();
    }
    map['has_shop'] = _hasShop;
    map['shop_url'] = _shopUrl;
    map['allowance_count'] = _allowanceCount;
    map['answer_status'] = _answerStatus;
    map['is_senior_member'] = _isSeniorMember;
    if (_wbiImg != null) {
      map['wbi_img'] = _wbiImg?.toJson();
    }
    map['is_jury'] = _isJury;
    return map;
  }
}

WbiImg wbiImgFromJson(String str) => WbiImg.fromJson(json.decode(str));

String wbiImgToJson(WbiImg data) => json.encode(data.toJson());

class WbiImg {
  WbiImg({
    String? imgUrl,
    String? subUrl,
  }) {
    _imgUrl = imgUrl;
    _subUrl = subUrl;
  }

  WbiImg.fromJson(dynamic json) {
    _imgUrl = json['img_url'];
    _subUrl = json['sub_url'];
  }

  String? _imgUrl;
  String? _subUrl;

  WbiImg copyWith({
    String? imgUrl,
    String? subUrl,
  }) =>
      WbiImg(
        imgUrl: imgUrl ?? _imgUrl,
        subUrl: subUrl ?? _subUrl,
      );

  String? get imgUrl => _imgUrl;

  String? get subUrl => _subUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img_url'] = _imgUrl;
    map['sub_url'] = _subUrl;
    return map;
  }
}

Wallet walletFromJson(String str) => Wallet.fromJson(json.decode(str));

String walletToJson(Wallet data) => json.encode(data.toJson());

class Wallet {
  Wallet({
    num? mid,
    num? bcoinBalance,
    num? couponBalance,
    num? couponDueTime,
  }) {
    _mid = mid;
    _bcoinBalance = bcoinBalance;
    _couponBalance = couponBalance;
    _couponDueTime = couponDueTime;
  }

  Wallet.fromJson(dynamic json) {
    _mid = json['mid'];
    _bcoinBalance = json['bcoin_balance'];
    _couponBalance = json['coupon_balance'];
    _couponDueTime = json['coupon_due_time'];
  }

  num? _mid;
  num? _bcoinBalance;
  num? _couponBalance;
  num? _couponDueTime;

  Wallet copyWith({
    num? mid,
    num? bcoinBalance,
    num? couponBalance,
    num? couponDueTime,
  }) =>
      Wallet(
        mid: mid ?? _mid,
        bcoinBalance: bcoinBalance ?? _bcoinBalance,
        couponBalance: couponBalance ?? _couponBalance,
        couponDueTime: couponDueTime ?? _couponDueTime,
      );

  num? get mid => _mid;

  num? get bcoinBalance => _bcoinBalance;

  num? get couponBalance => _couponBalance;

  num? get couponDueTime => _couponDueTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mid'] = _mid;
    map['bcoin_balance'] = _bcoinBalance;
    map['coupon_balance'] = _couponBalance;
    map['coupon_due_time'] = _couponDueTime;
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

VipLabel vipLabelFromJson(String str) => VipLabel.fromJson(json.decode(str));

String vipLabelToJson(VipLabel data) => json.encode(data.toJson());

class VipLabel {
  VipLabel({
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

  VipLabel.fromJson(dynamic json) {
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

  VipLabel copyWith({
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
      VipLabel(
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

Pendant pendantFromJson(String str) => Pendant.fromJson(json.decode(str));

String pendantToJson(Pendant data) => json.encode(data.toJson());

class Pendant {
  Pendant({
    num? pid,
    String? name,
    String? image,
    num? expire,
    String? imageEnhance,
    String? imageEnhanceFrame,
    num? nPid,
  }) {
    _pid = pid;
    _name = name;
    _image = image;
    _expire = expire;
    _imageEnhance = imageEnhance;
    _imageEnhanceFrame = imageEnhanceFrame;
    _nPid = nPid;
  }

  Pendant.fromJson(dynamic json) {
    _pid = json['pid'];
    _name = json['name'];
    _image = json['image'];
    _expire = json['expire'];
    _imageEnhance = json['image_enhance'];
    _imageEnhanceFrame = json['image_enhance_frame'];
    _nPid = json['n_pid'];
  }

  num? _pid;
  String? _name;
  String? _image;
  num? _expire;
  String? _imageEnhance;
  String? _imageEnhanceFrame;
  num? _nPid;

  Pendant copyWith({
    num? pid,
    String? name,
    String? image,
    num? expire,
    String? imageEnhance,
    String? imageEnhanceFrame,
    num? nPid,
  }) =>
      Pendant(
        pid: pid ?? _pid,
        name: name ?? _name,
        image: image ?? _image,
        expire: expire ?? _expire,
        imageEnhance: imageEnhance ?? _imageEnhance,
        imageEnhanceFrame: imageEnhanceFrame ?? _imageEnhanceFrame,
        nPid: nPid ?? _nPid,
      );

  num? get pid => _pid;

  String? get name => _name;

  String? get image => _image;

  num? get expire => _expire;

  String? get imageEnhance => _imageEnhance;

  String? get imageEnhanceFrame => _imageEnhanceFrame;

  num? get nPid => _nPid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pid'] = _pid;
    map['name'] = _name;
    map['image'] = _image;
    map['expire'] = _expire;
    map['image_enhance'] = _imageEnhance;
    map['image_enhance_frame'] = _imageEnhanceFrame;
    map['n_pid'] = _nPid;
    return map;
  }
}

OfficialVerify officialVerifyFromJson(String str) =>
    OfficialVerify.fromJson(json.decode(str));

String officialVerifyToJson(OfficialVerify data) => json.encode(data.toJson());

class OfficialVerify {
  OfficialVerify({
    num? type,
    String? desc,
  }) {
    _type = type;
    _desc = desc;
  }

  OfficialVerify.fromJson(dynamic json) {
    _type = json['type'];
    _desc = json['desc'];
  }

  num? _type;
  String? _desc;

  OfficialVerify copyWith({
    num? type,
    String? desc,
  }) =>
      OfficialVerify(
        type: type ?? _type,
        desc: desc ?? _desc,
      );

  num? get type => _type;

  String? get desc => _desc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['desc'] = _desc;
    return map;
  }
}

Official officialFromJson(String str) => Official.fromJson(json.decode(str));

String officialToJson(Official data) => json.encode(data.toJson());

class Official {
  Official({
    num? role,
    String? title,
    String? desc,
    num? type,
  }) {
    _role = role;
    _title = title;
    _desc = desc;
    _type = type;
  }

  Official.fromJson(dynamic json) {
    _role = json['role'];
    _title = json['title'];
    _desc = json['desc'];
    _type = json['type'];
  }

  num? _role;
  String? _title;
  String? _desc;
  num? _type;

  Official copyWith({
    num? role,
    String? title,
    String? desc,
    num? type,
  }) =>
      Official(
        role: role ?? _role,
        title: title ?? _title,
        desc: desc ?? _desc,
        type: type ?? _type,
      );

  num? get role => _role;

  String? get title => _title;

  String? get desc => _desc;

  num? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = _role;
    map['title'] = _title;
    map['desc'] = _desc;
    map['type'] = _type;
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
    String? nextExp,
  }) {
    _currentLevel = currentLevel;
    _currentMin = currentMin;
    _currentExp = currentExp;
    _nextExp = nextExp;
  }

  LevelInfo.fromJson(dynamic json) {
    _currentLevel = json['current_level'];
    _currentMin = json['current_min'];
    _currentExp = json['current_exp'];
    _nextExp = json['next_exp'];
  }

  num? _currentLevel;
  num? _currentMin;
  num? _currentExp;
  String? _nextExp;

  LevelInfo copyWith({
    num? currentLevel,
    num? currentMin,
    num? currentExp,
    String? nextExp,
  }) =>
      LevelInfo(
        currentLevel: currentLevel ?? _currentLevel,
        currentMin: currentMin ?? _currentMin,
        currentExp: currentExp ?? _currentExp,
        nextExp: nextExp ?? _nextExp,
      );

  num? get currentLevel => _currentLevel;

  num? get currentMin => _currentMin;

  num? get currentExp => _currentExp;

  String? get nextExp => _nextExp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_level'] = _currentLevel;
    map['current_min'] = _currentMin;
    map['current_exp'] = _currentExp;
    map['next_exp'] = _nextExp;
    return map;
  }
}
