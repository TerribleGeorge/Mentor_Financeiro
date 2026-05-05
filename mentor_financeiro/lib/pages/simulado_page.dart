import 'package:flutter/material.dart';
import '../models/suitability_engine.dart';
import '../l10n/app_localizations.dart';
import '../content/content_repository.dart';

class SimuladoPage extends StatefulWidget {
  const SimuladoPage({super.key});

  @override
  State<SimuladoPage> createState() => _SimuladoPageState();
}

class _SimuladoPageState extends State<SimuladoPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<int> _answers = [];
  int? _selectedOption;

  void _selectOption(int value, int questionIndex) {
    setState(() {
      _answers.add(value);
      _selectedOption = null;
      _currentPage++;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      if (_currentPage < 12) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _showResult();
      }
    });
  }

  void _showResult() {
    final totalScore = _answers.fold<int>(0, (sum, value) => sum + value);
    final profile = SuitabilityEngine.calculateProfile(totalScore);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => _ResultPage(profile: profile)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: Text(
          l10n.quizProfile_title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          _buildProgressBar(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (context, index) {
                return _buildQuestion(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    final l10n = AppLocalizations.of(context)!;
    final progress = (_currentPage + 1) / 12;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.quizProfile_progress(_currentPage + 1, 12),
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  color: Color(0xFF00D9FF),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF00D9FF),
              ),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(int index) {
    final l10n = AppLocalizations.of(context)!;
    final question = SuitabilityEngine.questions[index];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00D9FF).withAlpha(25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              l10n.quizProfile_badge,
              style: TextStyle(
                color: Color(0xFF00D9FF),
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            question.question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 32),
          ...question.options.asMap().entries.map((entry) {
            final option = entry.value;
            final isSelected = _selectedOption == option.value;
            return _buildOptionButton(
              option.text,
              option.value,
              isSelected,
              () => _selectOption(option.value, index),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildOptionButton(
    String text,
    int value,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF00D9FF).withAlpha(40)
                  : const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? const Color(0xFF00D9FF) : Colors.white12,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? const Color(0xFF00D9FF)
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF00D9FF)
                          : Colors.white38,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          color: Color(0xFF0F172A),
                          size: 16,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class _ResultPage extends StatelessWidget {
  final Profile profile;

  const _ResultPage({required this.profile});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final color = _getColor();
    final suggestions = _getSuggestions(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white70),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withAlpha(40), color.withAlpha(15)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: color.withAlpha(128), width: 2),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(_getIcon(), color: Colors.white, size: 45),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      l10n.quizProfile_resultTitle,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      profile.name.toUpperCase(),
                      style: TextStyle(
                        color: color,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      profile.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.lightbulb,
                          color: Color(0xFF00D9FF),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n.quizProfile_idealInvestmentsTitle,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 11,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: suggestions.map((s) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: color.withAlpha(25),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: color.withAlpha(75)),
                          ),
                          child: Text(
                            s,
                            style: TextStyle(
                              color: color,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/conhecimento'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: const Color(0xFF0F172A),
                    padding: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                child: Text(
                  l10n.quizProfile_exploreInvestmentsCta,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white70,
                    side: const BorderSide(color: Colors.white38),
                    padding: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                child: Text(
                  l10n.quizProfile_exit,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (profile) {
      case Profile.conservador:
        return const Color(0xFF4CAF50);
      case Profile.moderado:
        return const Color(0xFFFFC107);
      case Profile.arrojado:
        return const Color(0xFFF44336);
    }
  }

  IconData _getIcon() {
    switch (profile) {
      case Profile.conservador:
        return Icons.shield;
      case Profile.moderado:
        return Icons.balance;
      case Profile.arrojado:
        return Icons.trending_up;
    }
  }

  List<String> _getSuggestions(BuildContext context) {
    final isBrazil = ContentRepository.isPtBrLocale(Localizations.localeOf(context));
    switch (profile) {
      case Profile.conservador:
        return isBrazil
            ? ['Tesouro Selic', 'CDB 100% CDI', 'Fundos DI']
            : ['Treasury bonds', 'Money market', 'High-yield cash'];
      case Profile.moderado:
        return isBrazil
            ? ['FIIs', 'LCIs', 'Multimercado']
            : ['S&P 500 ETF', 'Dividend growth', 'REITs'];
      case Profile.arrojado:
        return isBrazil ? ['Ações', 'ETFs', 'Cripto'] : ['Stocks', 'ETFs', 'Crypto'];
    }
  }
}
