import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/exchange_rate_service.dart';

class CambioScreen extends StatefulWidget {
  const CambioScreen({super.key});

  @override
  State<CambioScreen> createState() => _CambioScreenState();
}

class _CambioScreenState extends State<CambioScreen> {
  final _searchCtrl = TextEditingController();
  String _query = '';
  bool _loading = true;
  ExchangeRatesSnapshot? _snapshot;

  @override
  void initState() {
    super.initState();
    _load();
    _searchCtrl.addListener(() {
      setState(() => _query = _searchCtrl.text.trim().toUpperCase());
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _load({bool force = false}) async {
    setState(() => _loading = true);
    final snap = await ExchangeRateService.getLatest(base: 'USD', forceRefresh: force);
    if (!mounted) return;
    setState(() {
      _snapshot = snap;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final snap = _snapshot;
    final rates = snap?.rates ?? const <String, double>{};
    final entries = rates.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final filtered = _query.isEmpty
        ? entries
        : entries.where((e) => e.key.contains(_query)).toList();

    final lastUpdated = snap == null
        ? ''
        : DateFormat('dd/MM/yyyy HH:mm').format(snap.fetchedAt.toLocal());

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          'Câmbio (todas as moedas)',
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
                    'Sem dados de câmbio (offline).',
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
                            'Base: ${snap.base} • Atualizado: $lastUpdated',
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
                              hintText: 'Buscar por código (ex: BRL, EUR, JPY)',
                              hintStyle: TextStyle(
                                color: Colors.white.withValues(alpha: 0.45),
                              ),
                              prefixIcon: const Icon(Icons.search, color: Colors.white54),
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
                              '1 ${snap.base} = ${e.value}',
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

