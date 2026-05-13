import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/investment_news_item.dart';
import '../services/investment_news_service.dart';
import '../theme/classic_mode_style.dart';

class InvestmentNewsTodayCard extends StatefulWidget {
  const InvestmentNewsTodayCard({super.key});

  @override
  State<InvestmentNewsTodayCard> createState() =>
      _InvestmentNewsTodayCardState();
}

class _InvestmentNewsTodayCardState extends State<InvestmentNewsTodayCard> {
  late Future<List<InvestmentNewsItem>> _future;

  @override
  void initState() {
    super.initState();
    _future = InvestmentNewsService.instance.loadTodayNews();
  }

  void _refresh() {
    setState(() {
      _future = InvestmentNewsService.instance.loadTodayNews(
        forceRefresh: true,
      );
    });
  }

  Future<void> _openNews(InvestmentNewsItem item) async {
    final uri = Uri.tryParse(item.url);
    if (uri == null) return;

    final opened = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    ).catchError((_) => false);
    if (!opened && mounted) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          const SnackBar(
            content: Text('Não foi possível abrir a notícia agora.'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1118),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: scheme.primary.withValues(alpha: 0.62),
          width: 1.1,
        ),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.12),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.newspaper_outlined, color: scheme.primary, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Notícias de hoje',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    shadows: ClassicModeStyle.primaryTextShadows(context),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF26DE81).withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: const Color(0xFF26DE81).withValues(alpha: 0.62),
                  ),
                ),
                child: const Text(
                  'Gratuito',
                  style: TextStyle(
                    color: Color(0xFF26DE81),
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                tooltip: 'Atualizar notícias',
                onPressed: _refresh,
                icon: Icon(Icons.refresh, color: scheme.primary, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 8),
          FutureBuilder<List<InvestmentNewsItem>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Center(
                    child: SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: scheme.primary,
                      ),
                    ),
                  ),
                );
              }

              final items = snapshot.data ?? const <InvestmentNewsItem>[];
              if (items.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 4),
                  child: Text(
                    'Não consegui atualizar agora. Tente novamente em alguns minutos.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.78),
                      height: 1.35,
                      shadows: ClassicModeStyle.secondaryTextShadows(context),
                    ),
                  ),
                );
              }

              return Column(
                children: [
                  for (final item in items.take(3))
                    _NewsRow(item: item, onTap: _openNews),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _NewsRow extends StatelessWidget {
  const _NewsRow({required this.item, required this.onTap});

  final InvestmentNewsItem item;
  final Future<void> Function(InvestmentNewsItem item) onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => onTap(item),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 7,
              height: 7,
              margin: const EdgeInsets.only(top: 7),
              decoration: BoxDecoration(
                color: scheme.primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.92),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      shadows: ClassicModeStyle.secondaryTextShadows(context),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.source,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.open_in_new,
              size: 15,
              color: Colors.white.withValues(alpha: 0.45),
            ),
          ],
        ),
      ),
    );
  }
}
