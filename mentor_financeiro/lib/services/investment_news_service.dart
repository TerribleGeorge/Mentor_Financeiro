import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

import '../models/investment_news_item.dart';
import 'locale_controller.dart';

class InvestmentNewsService {
  static const _cacheDateKey = 'investment_news_cache_date';
  static String _cacheItemsKey(String languageCode) =>
      'investment_news_cache_items_$languageCode';

  static final InvestmentNewsService instance = InvestmentNewsService._();

  InvestmentNewsService._();

  Future<List<InvestmentNewsItem>> loadTodayNews({
    bool forceRefresh = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T').first;
    final languageCode = LocaleController.instance.locale.languageCode;
    final feed = _feedConfig(languageCode);
    final cacheKey = _cacheItemsKey(feed.cacheCode);
    final cacheDateKey = '${_cacheDateKey}_${feed.cacheCode}';
    final cachedItems = InvestmentNewsItem.listFromCache(
      prefs.getString(cacheKey),
    );

    if (!forceRefresh &&
        prefs.getString(cacheDateKey) == today &&
        cachedItems.isNotEmpty) {
      return cachedItems;
    }

    try {
      final uri = Uri.https('news.google.com', '/rss/search', {
        'q': feed.query,
        'hl': feed.hl,
        'gl': feed.gl,
        'ceid': feed.ceid,
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
        await prefs.setString(cacheDateKey, today);
        await prefs.setString(cacheKey, InvestmentNewsItem.listToCache(news));
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
    final cleanSource = source.isNotEmpty ? source : 'News';

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

  _NewsFeedConfig _feedConfig(String languageCode) {
    return switch (languageCode.toLowerCase()) {
      'pt' => const _NewsFeedConfig(
        cacheCode: 'pt',
        query: 'investimentos finanças mercado financeiro when:1d',
        hl: 'pt-BR',
        gl: 'BR',
        ceid: 'BR:pt-419',
      ),
      'es' => const _NewsFeedConfig(
        cacheCode: 'es',
        query: 'inversiones finanzas mercados financieros when:1d',
        hl: 'es-ES',
        gl: 'ES',
        ceid: 'ES:es',
      ),
      _ => const _NewsFeedConfig(
        cacheCode: 'en',
        query: 'investing personal finance financial markets when:1d',
        hl: 'en-US',
        gl: 'US',
        ceid: 'US:en',
      ),
    };
  }
}

class _NewsFeedConfig {
  const _NewsFeedConfig({
    required this.cacheCode,
    required this.query,
    required this.hl,
    required this.gl,
    required this.ceid,
  });

  final String cacheCode;
  final String query;
  final String hl;
  final String gl;
  final String ceid;
}
