import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

import '../models/investment_news_item.dart';

class InvestmentNewsService {
  static const _cacheDateKey = 'investment_news_cache_date';
  static const _cacheItemsKey = 'investment_news_cache_items';

  static final InvestmentNewsService instance = InvestmentNewsService._();

  InvestmentNewsService._();

  Future<List<InvestmentNewsItem>> loadTodayNews({
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T').first;
    final cachedItems = InvestmentNewsItem.listFromCache(
      prefs.getString(_cacheItemsKey),
    );

    if (!forceRefresh &&
        prefs.getString(_cacheDateKey) == today &&
        cachedItems.isNotEmpty) {
      return cachedItems;
    }

    try {
      final uri = Uri.https('news.google.com', '/rss/search', {
        'q': 'investimentos finanças mercado financeiro when:1d',
        'hl': 'pt-BR',
        'gl': 'BR',
        'ceid': 'BR:pt-419',
      });

      final response = await http
          .get(uri, headers: const {'Accept': 'application/rss+xml'})
          .timeout(const Duration(seconds: 10));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return cachedItems;
      }

      final document = XmlDocument.parse(response.body);
      final items = document.findAllElements('item').map(_parseItem).nonNulls;
      final news = items.take(5).toList(growable: false);

      if (news.isNotEmpty) {
        await prefs.setString(_cacheDateKey, today);
        await prefs.setString(
          _cacheItemsKey,
          InvestmentNewsItem.listToCache(news),
        );
        return news;
      }
    } catch (_) {
      return cachedItems;
    }

    return cachedItems;
  }

  InvestmentNewsItem? _parseItem(XmlElement item) {
    final title = _textOf(item, 'title');
    final url = _textOf(item, 'link');
    final source = _textOf(item, 'source');

    if (title.isEmpty || url.isEmpty) return null;

    var cleanTitle = title.replaceAll(RegExp(r'\s+'), ' ').trim();
    final cleanSource = source.isNotEmpty ? source : 'Notícias';

    final sourceSuffix = ' - $cleanSource';
    if (cleanTitle.endsWith(sourceSuffix)) {
      cleanTitle = cleanTitle.substring(
        0,
        cleanTitle.length - sourceSuffix.length,
      );
    }

    return InvestmentNewsItem(title: cleanTitle, url: url, source: cleanSource);
  }

  String _textOf(XmlElement item, String tagName) {
    return item.getElement(tagName)?.innerText.trim() ?? '';
  }
}
