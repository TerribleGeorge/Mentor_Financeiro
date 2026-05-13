import 'dart:convert';

class InvestmentNewsItem {
  const InvestmentNewsItem({
    required this.title,
    required this.url,
    required this.source,
  });

  final String title;
  final String url;
  final String source;

  Map<String, dynamic> toJson() => {
    'title': title,
    'url': url,
    'source': source,
  };

  static InvestmentNewsItem? fromJson(Map<String, dynamic> json) {
    final title = (json['title'] as String?)?.trim();
    final url = (json['url'] as String?)?.trim();
    final source = (json['source'] as String?)?.trim();

    if (title == null || title.isEmpty || url == null || url.isEmpty) {
      return null;
    }

    return InvestmentNewsItem(
      title: title,
      url: url,
      source: source?.isNotEmpty == true ? source! : 'Notícias',
    );
  }

  static List<InvestmentNewsItem> listFromCache(String? cached) {
    if (cached == null || cached.isEmpty) return const [];
    try {
      final decoded = jsonDecode(cached);
      if (decoded is! List) return const [];
      return decoded
          .whereType<Map<String, dynamic>>()
          .map(InvestmentNewsItem.fromJson)
          .nonNulls
          .toList(growable: false);
    } catch (_) {
      return const [];
    }
  }

  static String listToCache(List<InvestmentNewsItem> items) {
    return jsonEncode(items.map((item) => item.toJson()).toList());
  }
}
