import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../models/transacao_model.dart';
import '../services/localization_service.dart';
import '../theme/classic_mode_style.dart';
import '../widgets/ads/adaptive_banner_ad.dart';

class HistoricoScreen extends StatefulWidget {
  const HistoricoScreen({super.key});

  @override
  State<HistoricoScreen> createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const AdaptiveBannerAd(),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Histórico',
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: ClassicModeStyle.primaryTextShadows(context),
                  ),
                ),
              ),
              Expanded(
                child: user == null
                    ? const Center(
                        child: Text(
                          'Faça login para ver o histórico',
                          style: TextStyle(color: Colors.white54),
                        ),
                      )
                    : StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('usuarios')
                            .doc(user!.uid)
                            .collection('transacoes')
                            .orderBy('data', descending: true)
                            .limit(50)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF00D9FF),
                              ),
                            );
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text(
                                'Nenhuma transação encontrada',
                                style: TextStyle(color: Colors.white54),
                              ),
                            );
                          }

                          final transacoes = snapshot.data!.docs.map((doc) {
                            return TransacaoModel.fromMap(
                              doc.data() as Map<String, dynamic>,
                            );
                          }).toList();

                          return ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: transacoes.length,
                            itemBuilder: (context, index) {
                              final t = transacoes[index];
                              return _buildTransacaoItem(context, t);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildTransacaoItem(BuildContext context, TransacaoModel t) {
    final isCredito = t.tipoPagamento == TipoPagamento.credito;
    final surface = Theme.of(context).colorScheme.surface.withValues(alpha: 0.62);
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  (isCredito
                          ? const Color(0xFF26DE81)
                          : const Color(0xFF00D9FF))
                      .withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCredito ? Icons.credit_card : Icons.account_balance_wallet,
              color: isCredito
                  ? const Color(0xFF26DE81)
                  : const Color(0xFF00D9FF),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.descricao,
                  style: TextStyle(
                    color: onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('dd/MM/yyyy', 'pt_BR').format(t.data),
                  style: TextStyle(
                    color: onSurface.withValues(alpha: 0.55),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isCredito ? '+' : '-'} ${LocalizationService.formatCurrency(t.valor)}',
            style: TextStyle(
              color: isCredito
                  ? const Color(0xFF26DE81)
                  : const Color(0xFFFC5C65),
              fontWeight: FontWeight.bold,
            ).withFinancialShadows(context),
          ),
        ],
      ),
    );
  }
}
