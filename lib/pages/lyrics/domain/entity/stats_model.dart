import 'dart:convert';

class Stats {
  bool isHot;
  int concurrents;
  int pageViews;
  Stats({
    required this.isHot,
    required this.concurrents,
    required this.pageViews,
  });

  Stats copyWith({
    bool? isHot,
    int? concurrents,
    int? pageViews,
  }) {
    return Stats(
      isHot: isHot ?? this.isHot,
      concurrents: concurrents ?? this.concurrents,
      pageViews: pageViews ?? this.pageViews,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isHot': isHot,
      'concurrents': concurrents,
      'pageViews': pageViews,
    };
  }

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      isHot: map['hot'] ?? false,
      concurrents: map['concurrents'] ?? 0,
      pageViews: map['pageviews'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stats.fromJson(String source) => Stats.fromMap(json.decode(source));

  @override
  String toString() =>
      'Stats(isHot: $isHot, concurrents: $concurrents, pageViews: $pageViews)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stats &&
        other.isHot == isHot &&
        other.concurrents == concurrents &&
        other.pageViews == pageViews;
  }

  @override
  int get hashCode =>
      isHot.hashCode ^ concurrents.hashCode ^ pageViews.hashCode;
}
