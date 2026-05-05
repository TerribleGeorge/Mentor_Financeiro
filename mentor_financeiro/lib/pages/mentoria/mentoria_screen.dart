import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_routes.dart';
import '../../presentation/widgets/void_loading_screen.dart';
import '../../services/mentoria_service.dart';
import '../../services/subscription_provider.dart';
import '../paywall_screen.dart';

class MentoriaScreen extends StatefulWidget {
  const MentoriaScreen({super.key});

  @override
  State<MentoriaScreen> createState() => _MentoriaScreenState();
}

class _MentoriaScreenState extends State<MentoriaScreen> {
  double _progress01 = 0;
  Set<String> _done = {};

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final done = await MentoriaService.completedLessonIds();
    final p = await MentoriaService.mentorScoreProgress01();
    if (!mounted) return;
    setState(() {
      _done = done;
      _progress01 = p;
    });
  }

  Future<void> _openLesson(MentoriaModule module, MentoriaLesson lesson) async {
    final subscription = context.read<SubscriptionProvider>();
    if (!subscription.isPremium) {
      await Navigator.of(context).push<void>(
        MaterialPageRoute<void>(builder: (_) => const PaywallScreen()),
      );
      return;
    }

    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => _MentoriaFogTransition(
          title: lesson.title,
          onReady: () async {
            await Navigator.of(context).pushNamed(
              AppRoutes.mentoriaLesson,
              arguments: MentoriaLessonArgs(module: module, lesson: lesson),
            );
          },
        ),
      ),
    );
    await _loadProgress();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final modules = MentoriaService.modules();
    final subscription = context.watch<SubscriptionProvider>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Mentoria')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: scheme.primary.withValues(alpha: 0.25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.bolt, color: scheme.primary),
                    const SizedBox(width: 8),
                    const Text(
                      'Mentor Score',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    Text(
                      '${(_progress01 * 100).round()}%',
                      style: TextStyle(
                        color: scheme.onSurface.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: _progress01,
                    minHeight: 10,
                    backgroundColor: Colors.white.withValues(alpha: 0.08),
                    valueColor: AlwaysStoppedAnimation<Color>(scheme.primary),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  subscription.isPremium
                      ? 'Complete lições e checkpoints para evoluir seu score.'
                      : 'Mentoria é Premium. Toque em qualquer módulo para ver os planos.',
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.7),
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          for (final m in modules) ...[
            _ModuleCard(
              module: m,
              doneLessonIds: _done,
              onOpenLesson: (lesson) => _openLesson(m, lesson),
            ),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  const _ModuleCard({
    required this.module,
    required this.doneLessonIds,
    required this.onOpenLesson,
  });

  final MentoriaModule module;
  final Set<String> doneLessonIds;
  final void Function(MentoriaLesson lesson) onOpenLesson;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final accent = Color(module.accent);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: scheme.surface.withValues(alpha: 0.55),
        border: Border.all(color: accent.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.psychology_alt, color: accent),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        module.title,
                        style: TextStyle(
                          color: scheme.onSurface,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        module.subtitle,
                        style: TextStyle(
                          color: scheme.onSurface.withValues(alpha: 0.7),
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            for (final lesson in module.lessons) ...[
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  doneLessonIds.contains(lesson.id)
                      ? Icons.check_circle
                      : Icons.play_circle_outline,
                  color: doneLessonIds.contains(lesson.id)
                      ? const Color(0xFF26DE81)
                      : accent,
                ),
                title: Text(
                  lesson.title,
                  style: TextStyle(color: scheme.onSurface),
                ),
                subtitle: Text(
                  doneLessonIds.contains(lesson.id)
                      ? 'Concluído'
                      : 'Vídeo + leitura + checkpoint',
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.65),
                    fontSize: 12,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: scheme.onSurface.withValues(alpha: 0.6),
                ),
                onTap: () => onOpenLesson(lesson),
              ),
              if (lesson != module.lessons.last)
                const Divider(height: 1, color: Colors.white12),
            ],
          ],
        ),
      ),
    );
  }
}

class MentoriaLessonArgs {
  const MentoriaLessonArgs({required this.module, required this.lesson});
  final MentoriaModule module;
  final MentoriaLesson lesson;
}

class _MentoriaFogTransition extends StatefulWidget {
  const _MentoriaFogTransition({required this.title, required this.onReady});
  final String title;
  final Future<void> Function() onReady;

  @override
  State<_MentoriaFogTransition> createState() => _MentoriaFogTransitionState();
}

class _MentoriaFogTransitionState extends State<_MentoriaFogTransition> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 650));
      if (!mounted) return;
      await widget.onReady();
      if (!mounted) return;
      Navigator.of(context).maybePop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return VoidLoadingScreen(
      splashAsset: 'assets/images/DevVoid_logo.png',
      backgroundColor: Colors.black,
      progressColor: const Color(0xFF00E5FF),
      particlesColor: const Color(0xFF00E5FF),
    );
  }
}

