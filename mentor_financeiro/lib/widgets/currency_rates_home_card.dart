import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_routes.dart';
import '../core/navigation/mentor_navigation.dart';
import '../services/exchange_rate_service.dart';
import '../services/locale_ui_strings.dart';
import '../services/localization_service.dart';
import '../services/regional_context_controller.dart';
import '../theme/classic_mode_style.dart';

class CurrencyRatesHomeCard extends StatefulWidget {
  const CurrencyRatesHomeCard({super.key});

  @override
  State<CurrencyRatesHomeCard> createState() => _CurrencyRatesHomeCardState();
}

class _CurrencyRatesHomeCardState extends State<CurrencyRatesHomeCard>
    with WidgetsBindingObserver {
  Future<ExchangeRatesSnapshot?>? _future;
  String? _base;
  DateTime? _lastRefresh;

  static const _priority = <String, List<String>>{
    'BRL': ['USD', 'EUR', 'GBP', 'ARS', 'MXN'],
    'USD': ['EUR', 'GBP', 'BRL', 'CAD', 'JPY'],
    'EUR': ['USD', 'GBP', 'BRL', 'CHF', 'JPY'],
    'GBP': ['USD', 'EUR', 'BRL', 'CAD', 'AUD'],
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed || _base == null) return;
    final last = _lastRefresh;
    if (last == null || DateTime.now().difference(last).inMinutes >= 5) {
      setState(() {
        _future = ExchangeRateService.getLatest(
          base: _base!,
          forceRefresh: true,
        );
        _lastRefresh = DateTime.now();
      });
    }
  }

  List<String> _targetsFor(String base) {
    final list =
        _priority[base] ?? const ['USD', 'EUR', 'BRL', 'GBP', 'JPY', 'CHF'];
    return list.where((code) => code != base).toList(growable: false);
  }

  String _formatLocal(double value, String base) {
    final symbol = LocalizationService.currencySymbolForCode(base);
    final format = NumberFormat.currency(
      locale: LocalizationService.currentLocale.toString(),
      symbol: '$symbol ',
      decimalDigits: value >= 100 ? 2 : 4,
    );
    return format.format(value).trim();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final strings = LocaleUiStrings.of(context);
    final country = context.watch<RegionalContextController>().countryCode;
    final base = LocalizationService.currencyCodeForCountry(country);
    if (_base != base || _future == null) {
      _base = base;
      _lastRefresh = DateTime.now();
      _future = ExchangeRateService.getLatest(base: base);
    }
    final targets = _targetsFor(base);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1118),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.45)),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.12),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: FutureBuilder<ExchangeRatesSnapshot?>(
        future: _future,
        builder: (context, snapshot) {
          final data = snapshot.data;
          final rows = <({String code, double localPerUnit})>[];
          if (data != null) {
            for (final code in targets) {
              final rate = data.rateTo(code);
              if (rate != null && rate > 0) {
                rows.add((code: code, localPerUnit: 1 / rate));
              }
            }
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.currency_exchange, color: scheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          strings.text(
                            'Moedas',
                            en: 'Currencies',
                            es: 'Monedas',
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            shadows: ClassicModeStyle.primaryTextShadows(
                              context,
                            ),
                          ),
                        ),
                        Text(
                          strings.text(
                            'Cotações em ${LocalizationService.currencyNameForCode(base)}',
                            en: 'Rates in ${LocalizationService.currencyNameForCode(base)}',
                            es: 'Cotizaciones en ${LocalizationService.currencyNameForCode(base)}',
                          ),
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.65),
                            fontSize: 12,
                            shadows: ClassicModeStyle.secondaryTextShadows(
                              context,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _future = ExchangeRateService.getLatest(
                          base: base,
                          forceRefresh: true,
                        );
                        _lastRefresh = DateTime.now();
                      });
                    },
                    child: const Icon(Icons.refresh, size: 18),
                  ),
                  TextButton(
                    onPressed: () => mentorPushNamed(context, AppRoutes.cambio),
                    child: Text(strings.text('Todas', en: 'All', es: 'Todas')),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (snapshot.connectionState == ConnectionState.waiting)
                const LinearProgressIndicator(minHeight: 3)
              else if (data == null || rows.isEmpty)
                Text(
                  strings.text(
                    'Sem cotações no momento. Tente novamente com internet.',
                    en: 'No rates right now. Try again with internet.',
                    es: 'Sin cotizaciones por ahora. Inténtalo con internet.',
                  ),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 13,
                    height: 1.3,
                  ),
                )
              else
                Column(
                  children: [
                    for (final row in rows.take(4))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '1 ${row.code}',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.86),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              _formatLocal(row.localPerUnit, base),
                              style: TextStyle(
                                color: scheme.primary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    Text(
                      strings.text(
                        'Atualiza ao abrir, voltar para o app ou tocar em atualizar.',
                        en: 'Updates when opening, returning to the app, or tapping refresh.',
                        es: 'Se actualiza al abrir, volver a la app o tocar actualizar.',
                      ),
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
