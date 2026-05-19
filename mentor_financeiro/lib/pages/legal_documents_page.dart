import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/locale_controller.dart';
import '../services/locale_ui_strings.dart';

enum LegalDocumentType {
  privacy('privacy'),
  security('security'),
  terms('terms');

  const LegalDocumentType(this.assetName);

  final String assetName;

  String title(LocaleUiStrings strings) {
    switch (this) {
      case LegalDocumentType.privacy:
        return strings.text(
          'Política de Privacidade',
          en: 'Privacy Policy',
          es: 'Política de privacidad',
        );
      case LegalDocumentType.security:
        return strings.text('Segurança', en: 'Security', es: 'Seguridad');
      case LegalDocumentType.terms:
        return strings.text(
          'Termos de Uso',
          en: 'Terms of Use',
          es: 'Términos de uso',
        );
    }
  }
}

class LegalDocumentsPage extends StatefulWidget {
  const LegalDocumentsPage({super.key, this.initialDocument});

  final LegalDocumentType? initialDocument;

  @override
  State<LegalDocumentsPage> createState() => _LegalDocumentsPageState();
}

class _LegalDocumentsPageState extends State<LegalDocumentsPage> {
  late final int _initialIndex =
      widget.initialDocument == null
          ? 0
          : LegalDocumentType.values.indexOf(widget.initialDocument!);

  @override
  Widget build(BuildContext context) {
    final strings = LocaleUiStrings.of(context);
    final scheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: LegalDocumentType.values.length,
      initialIndex: _initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            strings.text(
              'Textos legais',
              en: 'Legal texts',
              es: 'Textos legales',
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              for (final type in LegalDocumentType.values)
                Tab(text: type.title(strings)),
            ],
          ),
        ),
        body: Container(
          color: scheme.surface,
          child: TabBarView(
            children: [
              for (final type in LegalDocumentType.values)
                _LegalDocumentView(type: type),
            ],
          ),
        ),
      ),
    );
  }
}

class _LegalDocumentView extends StatelessWidget {
  const _LegalDocumentView({required this.type});

  final LegalDocumentType type;

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return FutureBuilder<String>(
      future: _loadDocument(languageCode, type),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return _MarkdownLikeDocument(text: snapshot.data!);
      },
    );
  }

  static Future<String> _loadDocument(
    String languageCode,
    LegalDocumentType type,
  ) async {
    final normalized = languageCode.trim().toLowerCase();
    final candidates = <String>[
      if (LocaleController.supportedLanguageCodes.contains(normalized))
        normalized,
      'en',
      'pt',
    ];

    for (final code in candidates.toSet()) {
      try {
        return await rootBundle.loadString(
          'assets/legal/$code/${type.assetName}.md',
        );
      } catch (_) {
        continue;
      }
    }

    return '';
  }
}

class _MarkdownLikeDocument extends StatelessWidget {
  const _MarkdownLikeDocument({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final widgets = <Widget>[];
    final lines = text.split('\n');

    for (final rawLine in lines) {
      final line = rawLine.trimRight();
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed == '---') {
        widgets.add(const SizedBox(height: 10));
        continue;
      }
      if (trimmed.startsWith('# ')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12),
            child: Text(
              _clean(trimmed.substring(2)),
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: scheme.onSurface,
              ),
            ),
          ),
        );
        continue;
      }
      if (trimmed.startsWith('## ')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 8),
            child: Text(
              _clean(trimmed.substring(3)),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: scheme.onSurface,
              ),
            ),
          ),
        );
        continue;
      }
      if (trimmed.startsWith('### ')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 6),
            child: Text(
              _clean(trimmed.substring(4)),
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: scheme.onSurface,
              ),
            ),
          ),
        );
        continue;
      }
      if (trimmed.startsWith('- ')) {
        widgets.add(_BulletText(text: _clean(trimmed.substring(2))));
        continue;
      }
      if (RegExp(r'^\d+\.\s+').hasMatch(trimmed)) {
        widgets.add(_Paragraph(text: _clean(trimmed)));
        continue;
      }
      if (trimmed.startsWith('|')) {
        widgets.add(_Paragraph(text: _clean(trimmed.replaceAll('|', '  '))));
        continue;
      }
      widgets.add(_Paragraph(text: _clean(trimmed)));
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
      children: widgets,
    );
  }

  static String _clean(String value) {
    return value
        .replaceAll('**', '')
        .replaceAll('`', '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}

class _Paragraph extends StatelessWidget {
  const _Paragraph({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          height: 1.45,
          color: scheme.onSurface.withValues(alpha: 0.84),
        ),
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  const _BulletText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 5, color: scheme.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.45,
                color: scheme.onSurface.withValues(alpha: 0.84),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
