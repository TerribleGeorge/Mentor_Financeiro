import 'package:flutter/material.dart';
import '../models/quiz_engine.dart';

class QuizConhecimentoPage extends StatefulWidget {
  const QuizConhecimentoPage({super.key});

  @override
  State<QuizConhecimentoPage> createState() => _QuizConhecimentoPageState();
}

class _QuizConhecimentoPageState extends State<QuizConhecimentoPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<int?> _answers = List.filled(12, null);
  int? _selectedOption;

  void _selectOption(int index, int questionIndex) {
    setState(() {
      _selectedOption = index;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _answers[questionIndex] = index;
        _selectedOption = null;
        _currentPage++;
      });

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
    final answers = _answers.map((a) => a ?? -1).toList();
    final score = QuizEngine.calculateScore(answers);
    final wrongAnswers = QuizEngine.getWrongAnswers(answers);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            _QuizResultPage(score: score, wrongAnswers: wrongAnswers),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Simulado de Conhecimento',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
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
    final progress = (_currentPage + 1) / 12;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pergunta ${_currentPage + 1} de 12',
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
    final question = QuizEngine.questions[index];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00D9FF).withAlpha(25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'SIMULADO TÉCNICO',
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
              fontSize: 22,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 32),
          ...question.options.asMap().entries.map((entry) {
            final option = entry.value;
            final isSelected = _selectedOption == option.isCorrect;
            return _buildOptionButton(
              option.text,
              entry.key,
              option.isCorrect,
              () => _selectOption(entry.key, index),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildOptionButton(
    String text,
    int index,
    bool isCorrect,
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
              color: _selectedOption != null
                  ? (isCorrect
                        ? Colors.green.withAlpha(40)
                        : Colors.red.withAlpha(40))
                  : const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _selectedOption != null
                    ? (isCorrect ? Colors.green : Colors.red)
                    : Colors.white12,
                width: _selectedOption != null ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                if (_selectedOption != null && isCorrect)
                  const Icon(Icons.check_circle, color: Colors.green, size: 24),
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

class _QuizResultPage extends StatelessWidget {
  final int score;
  final List<QuizQuestion> wrongAnswers;

  const _QuizResultPage({required this.score, required this.wrongAnswers});

  @override
  Widget build(BuildContext context) {
    final isPerfect = score == 12;

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
              if (isPerfect) ...[
                const SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD700).withAlpha(40),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFFD700),
                      width: 4,
                    ),
                  ),
                  child: const Icon(
                    Icons.emoji_events,
                    color: Color(0xFFFFD700),
                    size: 60,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'MESTRE DOS INVESTIMENTOS!',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Parabéns! Você acertou todas as 12 perguntas!',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ] else ...[
                const SizedBox(height: 20),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF00D9FF).withAlpha(60),
                        const Color(0xFF00D9FF).withAlpha(20),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF00D9FF),
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$score',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'de 12',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'QUASE LÁ!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Você acertou $score de 12 perguntas.\nRevise os tópicos com erros:',
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ...wrongAnswers.map((q) => _buildReviewButton(context, q)),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: const Color(0xFF0F172A),
                    padding: const EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'VOLTAR AO INÍCIO',
                    style: TextStyle(
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

  Widget _buildReviewButton(BuildContext context, QuizQuestion question) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            _navigateToReference(context, question.referencePage);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF00D9FF),
            side: const BorderSide(color: Color(0xFF00D9FF)),
            padding: const EdgeInsets.all(18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.refresh, size: 20),
              const SizedBox(width: 8),
              Text(
                'Revisar ${question.topicName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToReference(BuildContext context, String referencePage) {
    Navigator.pushNamed(context, referencePage);
  }
}
