import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/app_theme_controller.dart';
import '../services/subscription_provider.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<AppThemeController>(context);
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);
    final isPremium = subscriptionProvider.isPremium;

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
            _buildSectionTitle('Tema do App', themeController),
            const SizedBox(height: 16),
            _buildThemeSelector(context, themeController, isPremium),
            const SizedBox(height: 32),
            _buildSectionTitle('Fundo Personalizado', themeController),
            const SizedBox(height: 16),
            _buildBackgroundSection(context, themeController, isPremium),
            const SizedBox(height: 32),
            _buildSectionTitle('Visualização', themeController),
            const SizedBox(height: 16),
            _buildPreviewCard(themeController),
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
    bool isPremium,
  ) {
    final themes = [
      _ThemeOption(
        mode: AppThemeMode.light,
        name: 'Claro',
        icon: Icons.wb_sunny,
        color: const Color(0xFFF5F5F5),
        previewColor: Colors.white,
      ),
      _ThemeOption(
        mode: AppThemeMode.dark,
        name: 'Escuro',
        icon: Icons.dark_mode,
        color: const Color(0xFF0F172A),
        previewColor: const Color(0xFF1E293B),
      ),
      _ThemeOption(
        mode: AppThemeMode.medium,
        name: 'Médio',
        icon: Icons.settings_brightness,
        color: const Color(0xFF263238),
        previewColor: const Color(0xFF37474F),
      ),
    ];

    return Row(
      children: themes.map((theme) {
        final isSelected = controller.themeMode == theme.mode;
        final isLocked =
            !isPremium &&
            (theme.mode == AppThemeMode.medium ||
                theme.mode == AppThemeMode.dark);
        return Expanded(
          child: GestureDetector(
            onTap: () => isLocked
                ? _showPremiumBottomSheet(context)
                : controller.setThemeMode(theme.mode),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.previewColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF00D9FF)
                      : Colors.grey.withValues(alpha: 0.2),
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Icon(
                        theme.icon,
                        color: theme.color == const Color(0xFFF5F5F5)
                            ? Colors.black54
                            : Colors.white70,
                        size: 32,
                      ),
                      if (isLocked)
                        Positioned(
                          right: -8,
                          top: -8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF00D9FF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.lock,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    theme.name,
                    style: TextStyle(
                      color: theme.color == const Color(0xFFF5F5F5)
                          ? Colors.black87
                          : Colors.white,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBackgroundSection(
    BuildContext context,
    AppThemeController controller,
    bool isPremium,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => isPremium
              ? controller.pickBackgroundImage()
              : _showPremiumBottomSheet(context),
          child: GlassCard(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00D9FF).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.image,
                    color: Color(0xFF00D9FF),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Escolher foto da galeria',
                            style: TextStyle(
                              color:
                                  controller.currentTheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          if (!isPremium) ...[
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.lock,
                              size: 14,
                              color: Color(0xFF00D9FF),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isPremium
                            ? 'Toque para selecionar uma imagem'
                            : 'Disponível no plano Premium',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white38),
              ],
            ),
          ),
        ),
        if (controller.hasBackgroundImage) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(controller.backgroundImagePath!),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Fundo ativo',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: () => controller.removeBackgroundImage(),
              ),
            ],
          ),
        ],
      ],
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

  void _showPremiumBottomSheet(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(
      context,
      listen: false,
    );
    final benefits = subscriptionProvider.getLocalizedBenefits();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) => Container(
        height: MediaQuery.of(ctx).size.height * 0.75,
        decoration: BoxDecoration(
          color: Color(0xFF1E293B),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.diamond,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Desbloqueie o Premium',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Acesse todos os recursos exclusivos',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: benefits.length,
                itemBuilder: (_, i) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF00D9FF),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          benefits[i],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PaywallPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Ver Planos e Preços',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
  const _ThemeOption({
    required this.mode,
    required this.name,
    required this.icon,
    required this.color,
    required this.previewColor,
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
