
class RecommendModel {

  bool success;
  int code;
  RecommendModelData data;
  String msg;

  RecommendModel({
    this.success,
    this.code,
    this.data,
    this.msg,
  });

  factory RecommendModel.fromJson(json)=>json == null? null:RecommendModel(
    success : json['success'],
    code : json['code'],
    data : RecommendModelData.fromJson(json['data']),
    msg : json['msg'],
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'code': code,
    'data': data,
    'msg': msg,
  };
}

class RecommendModelData {

  int total;
  String next;
  String version;
  List<RecommendModelDataResults> results;

  RecommendModelData({
    this.total,
    this.next,
    this.version,
    this.results,
  });

  factory RecommendModelData.fromJson(json){ if(json == null) return null;


  List<RecommendModelDataResults> results = json['results'] is List ? []: null; 
  if(results!=null) {
    for (var item in json['results']) { 
      if (item != null) { 
        results.add(RecommendModelDataResults.fromJson(item));  
      }
    }
  }
  return RecommendModelData(
      total : json['total'],
      next : json['next'],
      version : json['version'],
      results:results,
    );
  }

  Map<String, dynamic> toJson() => {
    'total': total,
    'next': next,
    'version': version,
    'results': results,
  };
}

class RecommendModelDataResults {

  int id;
  int type;
  String avatar;
  String nickname;
  List<int> userIdentities;
  int releaseTime;
  List<Object> imageUrls;
  List<Object> images;
  String title;
  String description;
  String content;
  int favourSum;
  bool isFavour;
  bool isAttention;
  bool isCollect;
  int browseSum;
  Object comment;
  int commentSum;
  int shareSum;
  int collectSum;
  int accountId;
  String surfacePlot;
  String location;
  String longitude;
  String latitude;
  String videoId;
  String videoUrl;
  String address;
  String videoUrlStandard;
  String videoUrlHigh;
  String videoUrlSuper;
  String videoUrlSource;
  String videoPixel;
  String playTime;
  int status;
  int questionProductId;
  int answerSum;
  Object quizzer;
  int auditCode;
  String auditDescription;
  bool isEditorial;
  bool commentLimit;
  Object topic;
  List<Object> operations;

  RecommendModelDataResults({
    this.id,
    this.type,
    this.avatar,
    this.nickname,
    this.userIdentities,
    this.releaseTime,
    this.imageUrls,
    this.images,
    this.title,
    this.description,
    this.content,
    this.favourSum,
    this.isFavour,
    this.isAttention,
    this.isCollect,
    this.browseSum,
    this.comment,
    this.commentSum,
    this.shareSum,
    this.collectSum,
    this.accountId,
    this.surfacePlot,
    this.location,
    this.longitude,
    this.latitude,
    this.videoId,
    this.videoUrl,
    this.address,
    this.videoUrlStandard,
    this.videoUrlHigh,
    this.videoUrlSuper,
    this.videoUrlSource,
    this.videoPixel,
    this.playTime,
    this.status,
    this.questionProductId,
    this.answerSum,
    this.quizzer,
    this.auditCode,
    this.auditDescription,
    this.isEditorial,
    this.commentLimit,
    this.topic,
    this.operations,
  });

  factory RecommendModelDataResults.fromJson(json){ if(json == null) return null;

    List<int> userIdentities = json['userIdentities'] is List ? []: null; 
    if(userIdentities!=null) {
      for (var item in json['userIdentities']) { 
        if (item != null) { 
          userIdentities.add(item); 
        }
      }
    }


    List<Object> imageUrls = json['imageUrls'] is List ? []: null; 
    if(imageUrls!=null) {
      for (var item in json['imageUrls']) { 
        if (item != null) { 
          imageUrls.add(item); 
        }
      }
    }


    List<Object> images = json['images'] is List ? []: null; 
    if(images!=null) {
      for (var item in json['images']) { 
        if (item != null) { 
          images.add(item);  
        }
      }
    }


    List<Object> operations = json['operations'] is List ? []: null; 
    if(operations!=null) {
      for (var item in json['operations']) { 
        if (item != null) { 
          operations.add(item);  
        }
      }
    }
  return RecommendModelDataResults(
      id : json['id'],
      type : json['type'],
      avatar : json['avatar'],
      nickname : json['nickname'],
      userIdentities:userIdentities,
      releaseTime : json['releaseTime'],
      imageUrls:imageUrls,
      images:images,
      title : json['title'],
      description : json['description'],
      content : json['content'],
      favourSum : json['favourSum'],
      isFavour : json['isFavour'],
      isAttention : json['isAttention'],
      isCollect : json['isCollect'],
      browseSum : json['browseSum'],
      comment : json['comment'],
      commentSum : json['commentSum'],
      shareSum : json['shareSum'],
      collectSum : json['collectSum'],
      accountId : json['accountId'],
      surfacePlot : json['surfacePlot'],
      location : json['location'],
      longitude : json['longitude'],
      latitude : json['latitude'],
      videoId : json['videoId'],
      videoUrl : json['videoUrl'],
      address : json['address'],
      videoUrlStandard : json['videoUrlStandard'],
      videoUrlHigh : json['videoUrlHigh'],
      videoUrlSuper : json['videoUrlSuper'],
      videoUrlSource : json['videoUrlSource'],
      videoPixel : json['videoPixel'],
      playTime : json['playTime'],
      status : json['status'],
      questionProductId : json['questionProductId'],
      answerSum : json['answerSum'],
      quizzer : json['quizzer'],
      auditCode : json['auditCode'],
      auditDescription : json['auditDescription'],
      isEditorial : json['isEditorial'],
      commentLimit : json['commentLimit'],
      topic : json['topic'],
      operations:operations,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'avatar': avatar,
        'nickname': nickname,
        'userIdentities': userIdentities,
        'releaseTime': releaseTime,
        'imageUrls': imageUrls,
        'images': images,
        'title': title,
        'description': description,
        'content': content,
        'favourSum': favourSum,
        'isFavour': isFavour,
        'isAttention': isAttention,
        'isCollect': isCollect,
        'browseSum': browseSum,
        'comment': comment,
        'commentSum': commentSum,
        'shareSum': shareSum,
        'collectSum': collectSum,
        'accountId': accountId,
        'surfacePlot': surfacePlot,
        'location': location,
        'longitude': longitude,
        'latitude': latitude,
        'videoId': videoId,
        'videoUrl': videoUrl,
        'address': address,
        'videoUrlStandard': videoUrlStandard,
        'videoUrlHigh': videoUrlHigh,
        'videoUrlSuper': videoUrlSuper,
        'videoUrlSource': videoUrlSource,
        'videoPixel': videoPixel,
        'playTime': playTime,
        'status': status,
        'questionProductId': questionProductId,
        'answerSum': answerSum,
        'quizzer': quizzer,
        'auditCode': auditCode,
        'auditDescription': auditDescription,
        'isEditorial': isEditorial,
        'commentLimit': commentLimit,
        'topic': topic,
        'operations': operations,
  };
}