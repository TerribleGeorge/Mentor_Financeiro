import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/exchange_rate_service.dart';
import '../services/localization_service.dart';

/// Soma investimentos (BRL) e mostra conversão Frankfurter (BRL → USD, EUR, moeda da UI).
class PatrimonioConvertidoCard extends StatelessWidget {
  const PatrimonioConvertidoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final scheme = Theme.of(context).colorScheme;
    final target = LocalizationService.currencyCode;

    if (user == null) {
      return const SizedBox.shrink();
    }

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .collection('investimentos')
          .snapshots(),
      builder: (context, snapshot) {
        double totalBrl = 0;
        if (snapshot.hasData) {
          for (final doc in snapshot.data!.docs) {
            final v = doc.data()['valor'];
            if (v is num) {
              totalBrl += v.toDouble();
            }
          }
        }

        return Card(
          color: scheme.surfaceContainerHighest.withValues(alpha: 0.35),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Património investido (registado)',
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  totalBrl <= 0
                      ? 'Ainda sem posições. Use “Registrar investimento” para somar aqui.'
                      : 'R\$ ${totalBrl.toStringAsFixed(2)} (base BRL)',
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.88),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (totalBrl > 0) ...[
                  const SizedBox(height: 12),
                  FutureBuilder<Map<String, double?>>(
                    future: _loadConversions(totalBrl, target),
                    builder: (context, fx) {
                      if (fx.connectionState != ConnectionState.done) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: scheme.primary,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'A carregar câmbio (Frankfurter / ECB)…',
                              style: TextStyle(
                                color: scheme.onSurface.withValues(alpha: 0.65),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        );
                      }
                      final m = fx.data ?? {};
                      final usd = m['USD'];
                      final eur = m['EUR'];
                      final pref = m['PREF'];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (usd != null)
                            Text(
                              '≈ US\$ ${usd.toStringAsFixed(2)} (USD)',
                              style: TextStyle(
                                color: scheme.onSurface.withValues(alpha: 0.72),
                                fontSize: 13,
                              ),
                            ),
                          if (eur != null)
                            Text(
                              '≈ € ${eur.toStringAsFixed(2)} (EUR)',
                              style: TextStyle(
                                color: scheme.onSurface.withValues(alpha: 0.72),
                                fontSize: 13,
                              ),
                            ),
                          if (pref != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                '≈ ${LocalizationService.currencySymbol} '
                                '${pref.toStringAsFixed(2)} ($target — moeda da interface)',
                                style: TextStyle(
                                  color: scheme.onSurface.withValues(alpha: 0.82),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          const SizedBox(height: 4),
                          Text(
                            'Taxas ECB via api.frankfurter.app',
                            style: TextStyle(
                              color: scheme.onSurface.withValues(alpha: 0.5),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<Map<String, double?>> _loadConversions(
    double totalBrl,
    String preferredIso,
  ) async {
    final usd = await ExchangeRateService.convertFromBrl(totalBrl, 'USD');
    final eur = await ExchangeRateService.convertFromBrl(totalBrl, 'EUR');

    double? pref;
    final p = preferredIso.toUpperCase();
    if (p != 'BRL' && p != 'USD' && p != 'EUR') {
      pref = await ExchangeRateService.convertFromBrl(totalBrl, p);
    }

    return {'USD': usd, 'EUR': eur, 'PREF': pref};
  }
}
