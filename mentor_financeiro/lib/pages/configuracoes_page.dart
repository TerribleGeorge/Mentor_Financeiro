import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/app_theme_controller.dart';
import '../services/subscription_provider.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<AppThemeController>();
    final subscription = context.watch<SubscriptionProvider>();

    return Scaffold(
      backgroundColor: themeController.currentTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Personalização',
          style: TextStyle(
            color: themeController.currentTheme.colorScheme.onSurface,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeController.currentTheme.colorScheme.onSurface,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Temas devvoid', themeController),
            const SizedBox(height: 16),
            _buildThemeSelector(context, themeController, subscription),
            const SizedBox(height: 32),
            _buildSectionTitle('Visualização', themeController),
            const SizedBox(height: 16),
            _buildPreviewCard(themeController),
            const SizedBox(height: 24),
            _buildSectionTitle('Assinatura', themeController),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: subscription.isLoading
                  ? null
                  : () async {
                      try {
                        final ok = await context
                            .read<SubscriptionProvider>()
                            .purchaseMonthly();
                        if (!context.mounted) return;
                        if (ok &&
                            context
                                .read<SubscriptionProvider>()
                                .hasPremiumEntitlementFromRevenueCat) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Assinatura activa — temas Cyber, Grimm e Hive desbloqueados.',
                              ),
                            ),
                          );
                        } else {
                          final err =
                              context.read<SubscriptionProvider>().errorMessage;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                err ??
                                    'Compra cancelada ou não concluída.',
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Erro: $e')),
                          );
                        }
                      }
                    },
              icon: subscription.isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.workspace_premium_outlined, size: 20),
              label: Text(
                subscription.isLoading
                    ? 'A processar…'
                    : 'Fazer teste de assinatura (offering)',
              ),
            ),
            if (kDebugMode) ...[
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () async {
                  await context
                      .read<SubscriptionProvider>()
                      .debugSimulatePremiumPurchase();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Premium simulado (debug).'),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.science_outlined, size: 20),
                label: const Text('Simular premium (só debug)'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, AppThemeController controller) {
    final isDark = controller.currentTheme.brightness == Brightness.dark;
    return Text(
      title,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildThemeSelector(
    BuildContext context,
    AppThemeController controller,
    SubscriptionProvider subscription,
  ) {
    final themes = [
      _ThemeOption(
        mode: AppThemeMode.voidTheme,
        name: 'Void',
        icon: Icons.blur_on,
        color: const Color(0xFF00E5FF),
        previewColor: const Color(0xFF0A0A0A),
        thumbnailAsset: null,
      ),
      _ThemeOption(
        mode: AppThemeMode.cyber,
        name: 'Cyber',
        icon: Icons.hub_outlined,
        color: const Color(0xFFE879F9),
        previewColor: const Color(0xFF252936),
        thumbnailAsset: 'assets/images/devvoid_cyber.png',
      ),
      _ThemeOption(
        mode: AppThemeMode.obsidian,
        name: 'Grimm',
        icon: Icons.diamond_outlined,
        color: const Color(0xFFC0C5CE),
        previewColor: const Color(0xFF3D444D),
        thumbnailAsset: 'assets/images/devvoid_grimm.png',
      ),
      _ThemeOption(
        mode: AppThemeMode.glacier,
        name: 'Hive',
        icon: Icons.hexagon_outlined,
        color: const Color(0xFF0EA5E9),
        previewColor: const Color(0xFFEFF6FF),
        thumbnailAsset: 'assets/images/devvoid_hive.png',
      ),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: themes.map((theme) {
        final isSelected = controller.themeMode == theme.mode;
        final onLightPreview =
            theme.previewColor.computeLuminance() > 0.55;
        final locked = theme.mode.requiresPremiumEntitlement &&
            !subscription.hasPremiumEntitlementFromRevenueCat;
        return SizedBox(
          width: (MediaQuery.sizeOf(context).width - 40 - 12) / 2,
          child: GestureDetector(
            onTap: subscription.isLoading
                ? null
                : () async {
                    if (!locked) {
                      await controller.setThemeMode(theme.mode);
                      return;
                    }
                    try {
                      final ok =
                          await subscription.purchaseMonthly();
                      if (!context.mounted) return;
                      if (ok &&
                          subscription.hasPremiumEntitlementFromRevenueCat) {
                        await controller.setThemeMode(theme.mode);
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${theme.name} desbloqueado.'),
                          ),
                        );
                      } else {
                        final err = subscription.errorMessage;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              err ?? 'Compra cancelada ou não concluída.',
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Erro: $e')),
                        );
                      }
                    }
                  },
            child: AnimatedOpacity(
              opacity: locked ? 0.42 : 1,
              duration: const Duration(milliseconds: 200),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: theme.previewColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFF00D9FF)
                        : Colors.grey.withValues(alpha: 0.25),
                    width: isSelected ? 2 : 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: const Color(0xFF00D9FF).withValues(alpha: 0.28),
                            blurRadius: 12,
                            spreadRadius: 1,
                          ),
                        ]
                      : null,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        if (theme.thumbnailAsset != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              theme.thumbnailAsset!,
                              width: 52,
                              height: 52,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(
                                theme.icon,
                                color: theme.color,
                                size: 28,
                              ),
                            ),
                          )
                        else
                          Icon(theme.icon, color: theme.color, size: 28),
                        const SizedBox(height: 8),
                        Text(
                          theme.name,
                          style: TextStyle(
                            color: onLightPreview ? Colors.black87 : Colors.white,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    if (locked)
                      Positioned(
                        right: -4,
                        top: -6,
                        child: Icon(
                          Icons.lock_rounded,
                          size: 18,
                          color: theme.color.withValues(alpha: 0.95),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPreviewCard(AppThemeController controller) {
    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.preview, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Visualização',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Tema: ${controller.themeName}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Este é um exemplo de como seus cards e gráficos aparecerão com o tema selecionado.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemeOption {
  final AppThemeMode mode;
  final String name;
  final IconData icon;
  final Color color;
  final Color previewColor;
  final String? thumbnailAsset;

  const _ThemeOption({
    required this.mode,
    required this.name,
    required this.icon,
    required this.color,
    required this.previewColor,
    this.thumbnailAsset,
  });
}

class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);
    final benefits = subscriptionProvider.getLocalizedBenefits();
    final monthlyPrice = subscriptionProvider.getFormattedPrice('monthly');
    final yearlyPrice = subscriptionProvider.getFormattedPrice('yearly');

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildHeader(),
                const SizedBox(height: 32),
                _buildBenefits(benefits),
                const SizedBox(height: 32),
                _buildPricingSection(
                  monthlyPrice,
                  yearlyPrice,
                  subscriptionProvider,
                ),
                const SizedBox(height: 24),
                _buildSubscribeButton(subscriptionProvider),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => subscriptionProvider.restorePurchases(),
                  child: Text(
                    'Restaurar compras',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF00D9FF).withValues(alpha: 0.4),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Icon(Icons.diamond, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 24),
        const Text(
          'MENTOR PRO',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Desbloqueie todo o potencial',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildBenefits(List<String> benefits) {
    final icons = [
      Icons.account_balance,
      Icons.palette,
      Icons.candlestick_chart,
      Icons.analytics,
      Icons.psychology,
      Icons.block,
    ];
    return Column(
      children: benefits.asMap().entries.map((e) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icons[e.key % icons.length],
                  color: const Color(0xFF00D9FF),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  e.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPricingSection(
    String monthlyPrice,
    String yearlyPrice,
    SubscriptionProvider provider,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildPriceCard(monthlyPrice, 'monthly', false, provider),
        ),
        const SizedBox(width: 16),
        Expanded(child: _buildPriceCard(yearlyPrice, 'yearly', true, provider)),
      ],
    );
  }

  Widget _buildPriceCard(
    String price,
    String type,
    bool isRecommended,
    SubscriptionProvider provider,
  ) {
    final isSelected = type == 'yearly';
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF00D9FF).withValues(alpha: 0.2)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF00D9FF)
                : Colors.white.withValues(alpha: 0.1),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            if (isRecommended)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Melhor Valor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              type == 'monthly' ? '/mês' : '/ano',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscribeButton(SubscriptionProvider provider) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D9FF).withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: provider.isLoading ? null : () => provider.purchaseYearly(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: provider.isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'Assinar Agora',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
