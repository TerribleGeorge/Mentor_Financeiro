import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../services/exchange_rate_service.dart';
import '../services/locale_ui_strings.dart';
import '../services/localization_service.dart';
import '../services/regional_context_controller.dart';

class CambioScreen extends StatefulWidget {
  const CambioScreen({super.key});

  @override
  State<CambioScreen> createState() => _CambioScreenState();
}

class _CambioScreenState extends State<CambioScreen>
    with WidgetsBindingObserver {
  final _searchCtrl = TextEditingController();
  String _query = '';
  bool _loading = true;
  ExchangeRatesSnapshot? _snapshot;
  String? _loadedBase;
  DateTime? _lastRefresh;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _load();
    _searchCtrl.addListener(() {
      setState(() => _query = _searchCtrl.text.trim().toUpperCase());
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) return;
    final last = _lastRefresh;
    if (last == null || DateTime.now().difference(last).inMinutes >= 5) {
      _load(force: true);
    }
  }

  Future<void> _load({bool force = false}) async {
    final country = context.read<RegionalContextController>().countryCode;
    final base = LocalizationService.currencyCodeForCountry(country);
    setState(() => _loading = true);
    final snap = await ExchangeRateService.getLatest(
      base: base,
      forceRefresh: force,
    );
    if (!mounted) return;
    setState(() {
      _snapshot = snap;
      _loadedBase = base;
      _lastRefresh = DateTime.now();
      _loading = false;
    });
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
    final snap = _snapshot;
    final country = context.watch<RegionalContextController>().countryCode;
    final base = LocalizationService.currencyCodeForCountry(country);
    if (_loadedBase != null && _loadedBase != base && !_loading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _load(force: true);
      });
    }
    final rates = snap?.rates ?? const <String, double>{};
    final entries = rates.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final filtered = _query.isEmpty
        ? entries
        : entries.where((e) => e.key.contains(_query)).toList();
    final strings = LocaleUiStrings.of(context);

    final lastUpdated = snap == null
        ? ''
        : DateFormat('dd/MM/yyyy HH:mm').format(snap.fetchedAt.toLocal());

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          strings.text('Moedas', en: 'Currencies', es: 'Monedas'),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white70),
            onPressed: () => _load(force: true),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : snap == null
          ? Center(
              child: Text(
                strings.text(
                  'Sem dados de câmbio (offline).',
                  en: 'No exchange data (offline).',
                  es: 'Sin datos de cambio (sin conexión).',
                ),
                style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
              ),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        strings.text(
                          'Base local: ${snap.base} • Atualizado: $lastUpdated',
                          en: 'Local base: ${snap.base} • Updated: $lastUpdated',
                          es: 'Base local: ${snap.base} • Actualizado: $lastUpdated',
                        ),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _searchCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: strings.text(
                            'Buscar por código (ex: USD, EUR, JPY)',
                            en: 'Search by code (ex: USD, EUR, JPY)',
                            es: 'Buscar por código (ej.: USD, EUR, JPY)',
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white.withValues(alpha: 0.45),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white54,
                          ),
                          filled: true,
                          fillColor: const Color(0xFF1E293B),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.08),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.white.withValues(alpha: 0.08),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: filtered.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.06),
                    ),
                    itemBuilder: (context, idx) {
                      final e = filtered[idx];
                      return ListTile(
                        title: Text(
                          e.key,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          e.value <= 0
                              ? strings.text(
                                  'Cotação indisponível',
                                  en: 'Rate unavailable',
                                  es: 'Cotización no disponible',
                                )
                              : '1 ${e.key} = ${_formatLocal(1 / e.value, snap.base)}',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.65),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
