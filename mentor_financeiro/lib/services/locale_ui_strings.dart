import 'package:flutter/widgets.dart';

import 'generated_locale_text_translations.dart';
import 'locale_controller.dart';

class LocaleUiStrings {
  const LocaleUiStrings({
    this.localeCode = 'en',
    required this.apply,
    required this.languagePageTitle,
    required this.languageInfoTitle,
    required this.languageInfoText,
    required this.nativeTranslation,
    required this.fallbackTranslation,
    required this.languageAppliedPrefix,
    required this.settingsTitle,
    required this.settingsProfile,
    required this.settingsNoSession,
    required this.settingsLanguageAndCurrency,
    required this.settingsAppLanguage,
    required this.settingsDisplayCurrency,
    required this.navHome,
    required this.navCharts,
    required this.navHistory,
    required this.navProfile,
  });

  final String localeCode;
  final String apply;
  final String languagePageTitle;
  final String languageInfoTitle;
  final String languageInfoText;
  final String nativeTranslation;
  final String fallbackTranslation;
  final String languageAppliedPrefix;
  final String settingsTitle;
  final String settingsProfile;
  final String settingsNoSession;
  final String settingsLanguageAndCurrency;
  final String settingsAppLanguage;
  final String settingsDisplayCurrency;
  final String navHome;
  final String navCharts;
  final String navHistory;
  final String navProfile;

  String languageApplied(String label) => '$languageAppliedPrefix: $label';

  String text(String pt, {required String en, required String es}) {
    if (identical(this, _strings['pt'])) return pt;
    if (identical(this, _strings['es'])) return es;
    final code = _codeForInstance(this) ?? localeCode;
    if (code != 'en') return _translated(code, en);
    return en;
  }

  static String _translated(String code, String en) {
    final translated = generatedLocaleTextTranslations[code]?[en]?.trim();
    return translated == null || translated.isEmpty ? en : translated;
  }

  static String? _codeForInstance(LocaleUiStrings strings) {
    for (final entry in _strings.entries) {
      if (identical(strings, entry.value)) return entry.key;
    }
    return null;
  }

  static LocaleUiStrings of(BuildContext context) {
    return forCode(Localizations.localeOf(context).languageCode);
  }

  static LocaleUiStrings forCode(String code) {
    final normalized = code.trim().toLowerCase();
    return _strings[normalized] ?? _englishFallbackFor(normalized);
  }

  static LocaleUiStrings _englishFallbackFor(String code) {
    final label = LocaleController.languageLabel(code);
    String t(String en) => _translated(code, en);
    return LocaleUiStrings(
      localeCode: code,
      apply: t('Apply'),
      languagePageTitle: '${t('App language')}: $label',
      languageInfoTitle: '${t('Selected language')}: $label',
      languageInfoText: t(
        'This interface language is available in this version.',
      ),
      nativeTranslation: t('Native translation available'),
      fallbackTranslation: t(
        'This interface language is available in this version.',
      ),
      languageAppliedPrefix: t('Language applied'),
      settingsTitle: t('Settings'),
      settingsProfile: t('Profile'),
      settingsNoSession: t('No active session'),
      settingsLanguageAndCurrency: t('Language and currency'),
      settingsAppLanguage: '${t('App language')} ($label)',
      settingsDisplayCurrency: t('Display currency'),
      navHome: t('Home'),
      navCharts: t('Charts'),
      navHistory: t('History'),
      navProfile: t('Profile'),
    );
  }

  static const _strings = <String, LocaleUiStrings>{
    'pt': LocaleUiStrings(
      apply: 'Aplicar',
      languagePageTitle: 'Idioma do app',
      languageInfoTitle: 'Escolha o idioma da interface',
      languageInfoText:
          'Português, inglês e espanhol têm tradução própria. Os demais idiomas usam textos em inglês até receberem tradução completa.',
      nativeTranslation: 'Tradução nativa disponível',
      fallbackTranslation: 'Usa textos em inglês por enquanto',
      languageAppliedPrefix: 'Idioma aplicado',
      settingsTitle: 'Definições',
      settingsProfile: 'Perfil',
      settingsNoSession: 'Sem sessão iniciada',
      settingsLanguageAndCurrency: 'Idioma e moeda',
      settingsAppLanguage: 'Idioma da app',
      settingsDisplayCurrency: 'Moeda de exibição',
      navHome: 'Início',
      navCharts: 'Gráficos',
      navHistory: 'Histórico',
      navProfile: 'Perfil',
    ),
    'en': LocaleUiStrings(
      apply: 'Apply',
      languagePageTitle: 'App language',
      languageInfoTitle: 'Choose the interface language',
      languageInfoText:
          'Portuguese, English, and Spanish have native translations. Other languages use English text until complete translations are available.',
      nativeTranslation: 'Native translation available',
      fallbackTranslation: 'Uses English text for now',
      languageAppliedPrefix: 'Language applied',
      settingsTitle: 'Settings',
      settingsProfile: 'Profile',
      settingsNoSession: 'No active session',
      settingsLanguageAndCurrency: 'Language and currency',
      settingsAppLanguage: 'App language',
      settingsDisplayCurrency: 'Display currency',
      navHome: 'Home',
      navCharts: 'Charts',
      navHistory: 'History',
      navProfile: 'Profile',
    ),
    'es': LocaleUiStrings(
      apply: 'Aplicar',
      languagePageTitle: 'Idioma de la app',
      languageInfoTitle: 'Elige el idioma de la interfaz',
      languageInfoText:
          'Portugués, inglés y español tienen traducción propia. Los demás idiomas usan textos en inglés hasta recibir traducción completa.',
      nativeTranslation: 'Traducción nativa disponible',
      fallbackTranslation: 'Usa textos en inglés por ahora',
      languageAppliedPrefix: 'Idioma aplicado',
      settingsTitle: 'Configuración',
      settingsProfile: 'Perfil',
      settingsNoSession: 'Sin sesión iniciada',
      settingsLanguageAndCurrency: 'Idioma y moneda',
      settingsAppLanguage: 'Idioma de la app',
      settingsDisplayCurrency: 'Moneda de visualización',
      navHome: 'Inicio',
      navCharts: 'Gráficos',
      navHistory: 'Historial',
      navProfile: 'Perfil',
    ),
    'fr': LocaleUiStrings(
      apply: 'Appliquer',
      languagePageTitle: "Langue de l'app",
      languageInfoTitle: "Choisissez la langue de l'interface",
      languageInfoText:
          'Le portugais, l’anglais et l’espagnol ont une traduction native. Les autres langues utilisent le texte anglais jusqu’à traduction complète.',
      nativeTranslation: 'Traduction native disponible',
      fallbackTranslation: 'Utilise le texte anglais pour le moment',
      languageAppliedPrefix: 'Langue appliquée',
      settingsTitle: 'Paramètres',
      settingsProfile: 'Profil',
      settingsNoSession: 'Aucune session active',
      settingsLanguageAndCurrency: 'Langue et devise',
      settingsAppLanguage: "Langue de l'app",
      settingsDisplayCurrency: "Devise d'affichage",
      navHome: 'Accueil',
      navCharts: 'Graphiques',
      navHistory: 'Historique',
      navProfile: 'Profil',
    ),
    'de': LocaleUiStrings(
      apply: 'Anwenden',
      languagePageTitle: 'App-Sprache',
      languageInfoTitle: 'Sprache der Oberfläche wählen',
      languageInfoText:
          'Portugiesisch, Englisch und Spanisch haben eigene Übersetzungen. Andere Sprachen nutzen vorerst englische Texte.',
      nativeTranslation: 'Native Übersetzung verfügbar',
      fallbackTranslation: 'Verwendet derzeit englischen Text',
      languageAppliedPrefix: 'Sprache angewendet',
      settingsTitle: 'Einstellungen',
      settingsProfile: 'Profil',
      settingsNoSession: 'Keine aktive Sitzung',
      settingsLanguageAndCurrency: 'Sprache und Währung',
      settingsAppLanguage: 'App-Sprache',
      settingsDisplayCurrency: 'Anzeigewährung',
      navHome: 'Start',
      navCharts: 'Diagramme',
      navHistory: 'Verlauf',
      navProfile: 'Profil',
    ),
    'it': LocaleUiStrings(
      apply: 'Applica',
      languagePageTitle: "Lingua dell'app",
      languageInfoTitle: "Scegli la lingua dell'interfaccia",
      languageInfoText:
          'Portoghese, inglese e spagnolo hanno traduzioni native. Le altre lingue usano il testo inglese finché la traduzione non sarà completa.',
      nativeTranslation: 'Traduzione nativa disponibile',
      fallbackTranslation: 'Usa testo inglese per ora',
      languageAppliedPrefix: 'Lingua applicata',
      settingsTitle: 'Impostazioni',
      settingsProfile: 'Profilo',
      settingsNoSession: 'Nessuna sessione attiva',
      settingsLanguageAndCurrency: 'Lingua e valuta',
      settingsAppLanguage: "Lingua dell'app",
      settingsDisplayCurrency: 'Valuta visualizzata',
      navHome: 'Home',
      navCharts: 'Grafici',
      navHistory: 'Cronologia',
      navProfile: 'Profilo',
    ),
    'nl': LocaleUiStrings(
      apply: 'Toepassen',
      languagePageTitle: 'App-taal',
      languageInfoTitle: 'Kies de interfacetaal',
      languageInfoText:
          'Portugees, Engels en Spaans hebben eigen vertalingen. Andere talen gebruiken voorlopig Engelse tekst.',
      nativeTranslation: 'Eigen vertaling beschikbaar',
      fallbackTranslation: 'Gebruikt voorlopig Engelse tekst',
      languageAppliedPrefix: 'Taal toegepast',
      settingsTitle: 'Instellingen',
      settingsProfile: 'Profiel',
      settingsNoSession: 'Geen actieve sessie',
      settingsLanguageAndCurrency: 'Taal en valuta',
      settingsAppLanguage: 'App-taal',
      settingsDisplayCurrency: 'Weergavevaluta',
      navHome: 'Start',
      navCharts: 'Grafieken',
      navHistory: 'Geschiedenis',
      navProfile: 'Profiel',
    ),
    'pl': LocaleUiStrings(
      apply: 'Zastosuj',
      languagePageTitle: 'Język aplikacji',
      languageInfoTitle: 'Wybierz język interfejsu',
      languageInfoText:
          'Portugalski, angielski i hiszpański mają własne tłumaczenia. Inne języki używają tekstu angielskiego do czasu pełnego tłumaczenia.',
      nativeTranslation: 'Dostępne tłumaczenie natywne',
      fallbackTranslation: 'Na razie używa tekstu angielskiego',
      languageAppliedPrefix: 'Język zastosowany',
      settingsTitle: 'Ustawienia',
      settingsProfile: 'Profil',
      settingsNoSession: 'Brak aktywnej sesji',
      settingsLanguageAndCurrency: 'Język i waluta',
      settingsAppLanguage: 'Język aplikacji',
      settingsDisplayCurrency: 'Waluta wyświetlania',
      navHome: 'Start',
      navCharts: 'Wykresy',
      navHistory: 'Historia',
      navProfile: 'Profil',
    ),
    'ru': LocaleUiStrings(
      apply: 'Применить',
      languagePageTitle: 'Язык приложения',
      languageInfoTitle: 'Выберите язык интерфейса',
      languageInfoText:
          'Португальский, английский и испанский имеют собственный перевод. Остальные языки пока используют английский текст.',
      nativeTranslation: 'Доступен собственный перевод',
      fallbackTranslation: 'Пока используется английский текст',
      languageAppliedPrefix: 'Язык применён',
      settingsTitle: 'Настройки',
      settingsProfile: 'Профиль',
      settingsNoSession: 'Нет активного сеанса',
      settingsLanguageAndCurrency: 'Язык и валюта',
      settingsAppLanguage: 'Язык приложения',
      settingsDisplayCurrency: 'Валюта отображения',
      navHome: 'Главная',
      navCharts: 'Графики',
      navHistory: 'История',
      navProfile: 'Профиль',
    ),
    'zh': LocaleUiStrings(
      apply: '应用',
      languagePageTitle: '应用语言',
      languageInfoTitle: '选择界面语言',
      languageInfoText: '葡萄牙语、英语和西班牙语有原生翻译。其他语言在完整翻译前使用英文文本。',
      nativeTranslation: '有原生翻译',
      fallbackTranslation: '目前使用英文文本',
      languageAppliedPrefix: '语言已应用',
      settingsTitle: '设置',
      settingsProfile: '个人资料',
      settingsNoSession: '没有活动会话',
      settingsLanguageAndCurrency: '语言和货币',
      settingsAppLanguage: '应用语言',
      settingsDisplayCurrency: '显示货币',
      navHome: '首页',
      navCharts: '图表',
      navHistory: '历史',
      navProfile: '个人资料',
    ),
    'ja': LocaleUiStrings(
      apply: '適用',
      languagePageTitle: 'アプリの言語',
      languageInfoTitle: '表示言語を選択',
      languageInfoText: 'ポルトガル語、英語、スペイン語には専用翻訳があります。その他の言語は完全翻訳まで英語テキストを使用します。',
      nativeTranslation: '専用翻訳があります',
      fallbackTranslation: '現在は英語テキストを使用します',
      languageAppliedPrefix: '言語を適用しました',
      settingsTitle: '設定',
      settingsProfile: 'プロフィール',
      settingsNoSession: '有効なセッションがありません',
      settingsLanguageAndCurrency: '言語と通貨',
      settingsAppLanguage: 'アプリの言語',
      settingsDisplayCurrency: '表示通貨',
      navHome: 'ホーム',
      navCharts: 'グラフ',
      navHistory: '履歴',
      navProfile: 'プロフィール',
    ),
    'ko': LocaleUiStrings(
      apply: '적용',
      languagePageTitle: '앱 언어',
      languageInfoTitle: '인터페이스 언어 선택',
      languageInfoText:
          '포르투갈어, 영어, 스페인어는 기본 번역이 있습니다. 다른 언어는 전체 번역 전까지 영어 텍스트를 사용합니다.',
      nativeTranslation: '기본 번역 사용 가능',
      fallbackTranslation: '현재 영어 텍스트 사용',
      languageAppliedPrefix: '언어 적용됨',
      settingsTitle: '설정',
      settingsProfile: '프로필',
      settingsNoSession: '활성 세션 없음',
      settingsLanguageAndCurrency: '언어 및 통화',
      settingsAppLanguage: '앱 언어',
      settingsDisplayCurrency: '표시 통화',
      navHome: '홈',
      navCharts: '차트',
      navHistory: '기록',
      navProfile: '프로필',
    ),
  };
}
