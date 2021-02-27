import 'dart:convert';

class LiveVideo {
  final int id;
  final String thumbnailUrl;
  final String videoUrl;
  final String duration;
  final String title;
  final String description;

  LiveVideo({
    this.id,
    this.thumbnailUrl,
    this.videoUrl,
    this.duration,
    this.title,
    this.description,
  });

  LiveVideo copyWith({
    int id,
    String thumbnailUrl,
    String videoUrl,
    String duration,
    String title,
    String description,
  }) {
    return LiveVideo(
      id: id ?? this.id,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      duration: duration ?? this.duration,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'duration': duration,
      'title': title,
      'description': description,
    };
  }

  factory LiveVideo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return LiveVideo(
      id: map['id'],
      thumbnailUrl: map['thumbnailUrl'],
      videoUrl: map['videoUrl'],
      duration: map['duration'],
      title: map['title'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LiveVideo.fromJson(String source) => LiveVideo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LiveVideo(id: $id, thumbnailUrl: $thumbnailUrl, videoUrl: $videoUrl, duration: $duration, title: $title, description: $description)';
  }
}
