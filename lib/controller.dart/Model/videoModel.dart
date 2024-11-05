class VideoModel {
  List<Contents> contents;
  String estimatedResults;
  String next;

  VideoModel({this.contents = const [], this.estimatedResults = '', this.next = ''});

  VideoModel.fromJson(Map<String, dynamic> json)
      : contents = (json['contents'] as List<dynamic>?)
                ?.map((item) => Contents.fromJson(item))
                .toList() ?? [],
        estimatedResults = json['estimatedResults'] ?? '',
        next = json['next'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['contents'] = contents.map((v) => v.toJson()).toList();
    data['estimatedResults'] = estimatedResults;
    data['next'] = next;
    return data;
  }
}

class Contents {
  Video? video; // Use nullable type

  Contents({this.video});

  Contents.fromJson(Map<String, dynamic> json)
      : video = json['video'] != null ? Video.fromJson(json['video']) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (video != null) {
      data['video'] = video!.toJson(); // Safe access
    }
    return data;
  }
}

class Video {
  String channelId;
  String channelName;
  String description;
  String lengthText;
  String publishedTimeText;
  List<Thumbnails> thumbnails;
  String title;
  String videoId;
  String viewCountText;

  Video({
    this.channelId = '',
    this.channelName = '',
    this.description = '',
    this.lengthText = '',
    this.publishedTimeText = '',
    this.thumbnails = const [],
    this.title = '',
    this.videoId = '',
    this.viewCountText = '',
  });

  Video.fromJson(Map<String, dynamic> json)
      : channelId = json['channelId'] ?? '',
        channelName = json['channelName'] ?? '',
        description = json['description'] ?? '',
        lengthText = json['lengthText'] ?? '',
        publishedTimeText = json['publishedTimeText'] ?? '',
        thumbnails = (json['thumbnails'] as List<dynamic>?)
                ?.map((item) => Thumbnails.fromJson(item))
                .toList() ?? [],
        title = json['title'] ?? '',
        videoId = json['videoId'] ?? '',
        viewCountText = json['viewCountText'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['channelId'] = channelId;
    data['channelName'] = channelName;
    data['description'] = description;
    data['lengthText'] = lengthText;
    data['publishedTimeText'] = publishedTimeText;
    data['thumbnails'] = thumbnails.map((v) => v.toJson()).toList();
    data['title'] = title;
    data['videoId'] = videoId;
    data['viewCountText'] = viewCountText;
    return data;
  }
}

class Thumbnails {
  int height;
  String url;
  int width;

  Thumbnails({this.height = 0, this.url = '', this.width = 0});

  Thumbnails.fromJson(Map<String, dynamic> json)
      : height = json['height'] ?? 0,
        url = json['url'] ?? '',
        width = json['width'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['height'] = height;
    data['url'] = url;
    data['width'] = width;
    return data;
  }
}
