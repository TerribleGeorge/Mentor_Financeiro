import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/mentor_app_router.dart';
import '../../core/constants/app_routes.dart';
import '../../models/suitability_engine.dart';
import '../../presentation/splash/splash_asset_resolver.dart';
import '../../presentation/widgets/void_loading_screen.dart';
import '../../services/mentoria_service.dart';
import '../../services/regional_context_controller.dart';
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
  Profile? _profile;
  String _treatment = 'neutro';
  bool _profileLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final profile = await MentoriaService.currentInvestorProfile();
    final treatment = await MentoriaService.currentTreatment();
    final done = await MentoriaService.completedLessonIds();
    final p = await MentoriaService.mentorScoreProgress01();
    if (!mounted) return;
    setState(() {
      _profile = profile;
      _treatment = treatment;
      _profileLoaded = true;
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
            await Navigator.of(context).push(
              MentorAppRouter.onGenerateRoute(
                RouteSettings(
                  name: AppRoutes.mentoriaLesson,
                  arguments: MentoriaLessonArgs(module: module, lesson: lesson),
                ),
              ),
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
    final profile = _profile;
    final subscription = context.watch<SubscriptionProvider>();
    final languageCode = Localizations.localeOf(context).languageCode;
    final isBrazil = context.watch<RegionalContextController>().isBrazil;
    final visibleProgress = _visibleProgress01(
      profile,
      languageCode: languageCode,
      isBrazil: isBrazil,
      treatment: _treatment,
    );
    final strings = _MentoriaUiStrings(languageCode);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(strings.title)),
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
                      '${(visibleProgress * 100).round()}%',
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
                    value: visibleProgress,
                    minHeight: 10,
                    backgroundColor: Colors.white.withValues(alpha: 0.08),
                    valueColor: AlwaysStoppedAnimation<Color>(scheme.primary),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  !_profileLoaded
                      ? strings.loadingTrack
                      : profile == null
                      ? strings.profileRequiredBody
                      : subscription.isPremium
                      ? '${MentoriaService.profileMentoriaTitleFor(profile, languageCode)}: ${strings.premiumReady}'
                      : strings.premiumLocked,
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.7),
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (_profileLoaded && profile == null) ...[
            _ProfileRequiredCard(onDone: _loadProgress),
            const SizedBox(height: 16),
          ],
          if (profile != null) ...[
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(
                  profile == Profile.conservador
                      ? 0xFF4CAF50
                      : profile == Profile.moderado
                      ? 0xFFFFC107
                      : 0xFFF44336,
                ).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: scheme.primary.withValues(alpha: 0.22),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.route, color: scheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MentoriaService.profileMentoriaTitleFor(
                            profile,
                            languageCode,
                          ),
                          style: TextStyle(
                            color: scheme.onSurface,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          MentoriaService.adaptTextForTreatment(
                            MentoriaService.profileMentoriaDescriptionFor(
                              profile,
                              languageCode: languageCode,
                              isBrazil: isBrazil,
                            ),
                            treatment: _treatment,
                            languageCode: languageCode,
                          ),
                          style: TextStyle(
                            color: scheme.onSurface.withValues(alpha: 0.72),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          if (profile != null)
            for (final sectionProfile in MentoriaService.unlockedProfiles(
              profile,
            )) ...[
              _TrackSectionHeader(
                profile: sectionProfile,
                languageCode: languageCode,
                isBrazil: isBrazil,
                treatment: _treatment,
              ),
              const SizedBox(height: 10),
              for (final m in MentoriaService.profileModulesForContext(
                sectionProfile,
                languageCode: languageCode,
                isBrazil: isBrazil,
                treatment: _treatment,
              )) ...[
                _ModuleCard(
                  module: m,
                  doneLessonIds: _done,
                  languageCode: languageCode,
                  onOpenLesson: (lesson) => _openLesson(m, lesson),
                ),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 8),
            ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  double _visibleProgress01(
    Profile? profile, {
    required String languageCode,
    required bool isBrazil,
    required String treatment,
  }) {
    if (profile == null) return _progress01;
    final visibleLessonIds = MentoriaService.unlockedProfiles(profile)
        .expand(
          (p) => MentoriaService.profileModulesForContext(
            p,
            languageCode: languageCode,
            isBrazil: isBrazil,
            treatment: treatment,
          ),
        )
        .expand((module) => module.lessons)
        .map((lesson) => lesson.id)
        .toSet();
    if (visibleLessonIds.isEmpty) return 0;
    final completedVisible = _done.intersection(visibleLessonIds).length;
    return (completedVisible / visibleLessonIds.length).clamp(0, 1);
  }
}

class _ProfileRequiredCard extends StatelessWidget {
  const _ProfileRequiredCard({required this.onDone});

  final Future<void> Function() onDone;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final strings = _MentoriaUiStrings(
      Localizations.localeOf(context).languageCode,
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface.withValues(alpha: 0.68),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.primary.withValues(alpha: 0.34)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.psychology_alt, color: scheme.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  strings.profileRequiredTitle,
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            strings.profileRequiredCardBody,
            style: TextStyle(
              color: scheme.onSurface.withValues(alpha: 0.74),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () async {
                await Navigator.of(context).pushNamed(AppRoutes.simulado);
                await onDone();
              },
              icon: const Icon(Icons.assignment_turned_in_outlined),
              label: Text(strings.profileRequiredCta),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackSectionHeader extends StatelessWidget {
  const _TrackSectionHeader({
    required this.profile,
    required this.languageCode,
    required this.isBrazil,
    required this.treatment,
  });

  final Profile profile;
  final String languageCode;
  final bool isBrazil;
  final String treatment;

  Color _colorFor(Profile profile) {
    switch (profile) {
      case Profile.conservador:
        return const Color(0xFF26DE81);
      case Profile.moderado:
        return const Color(0xFFFFC107);
      case Profile.arrojado:
        return const Color(0xFFFF2D2D);
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final accent = _colorFor(profile);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: accent.withValues(alpha: 0.38)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.layers_outlined, color: accent, size: 21),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MentoriaService.adaptTextForTreatment(
                    MentoriaService.profileMentoriaTitleFor(
                      profile,
                      languageCode,
                    ),
                    treatment: treatment,
                    languageCode: languageCode,
                  ),
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  MentoriaService.adaptTextForTreatment(
                    MentoriaService.sectionIntroFor(
                      profile,
                      languageCode: languageCode,
                      isBrazil: isBrazil,
                    ),
                    treatment: treatment,
                    languageCode: languageCode,
                  ),
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.72),
                    height: 1.3,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  const _ModuleCard({
    required this.module,
    required this.doneLessonIds,
    required this.languageCode,
    required this.onOpenLesson,
  });

  final MentoriaModule module;
  final Set<String> doneLessonIds;
  final String languageCode;
  final void Function(MentoriaLesson lesson) onOpenLesson;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final accent = Color(module.accent);
    final completed = module.lessons
        .where((lesson) => doneLessonIds.contains(lesson.id))
        .length;
    final strings = _MentoriaUiStrings(languageCode);

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
                          fontSize: 15,
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
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _PriorityChip(
                      priority: module.priority,
                      color: accent,
                      languageCode: languageCode,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$completed/${module.lessons.length}',
                      style: TextStyle(
                        color: scheme.onSurface.withValues(alpha: 0.58),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
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
                      ? strings.completed
                      : strings.lessonSubtitle,
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

class _PriorityChip extends StatelessWidget {
  const _PriorityChip({
    required this.priority,
    required this.color,
    required this.languageCode,
  });

  final MentoriaPriority priority;
  final Color color;
  final String languageCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.45)),
      ),
      child: Text(
        _MentoriaUiStrings(languageCode).priorityLabel(priority),
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _MentoriaUiStrings {
  const _MentoriaUiStrings(this.languageCode);

  final String languageCode;

  bool get _en => languageCode.toLowerCase().startsWith('en');
  bool get _es => languageCode.toLowerCase().startsWith('es');

  String get title {
    if (_en) return 'Mentorship';
    if (_es) return 'Mentoría';
    return 'Mentoria';
  }

  String get loadingTrack {
    if (_en) return 'Loading your track.';
    if (_es) return 'Cargando tu ruta.';
    return 'Carregando sua trilha.';
  }

  String get profileRequiredBody {
    if (_en) {
      return 'Take the Investor Profile Test to unlock the right track for your current moment.';
    }
    if (_es) {
      return 'Haz el Test de Perfil para liberar la ruta correcta para tu momento actual.';
    }
    return 'Faça o Simulado de Perfil para liberar a trilha certa para seu momento.';
  }

  String get premiumReady {
    if (_en) return 'complete lessons and checkpoints to evolve your score.';
    if (_es) {
      return 'completa lecciones y checkpoints para evolucionar tu score.';
    }
    return 'complete lições e checkpoints para evoluir seu score.';
  }

  String get premiumLocked {
    if (_en) {
      return 'Mentorship is Premium. Tap any module to view the plans.';
    }
    if (_es) {
      return 'La mentoría es Premium. Toca cualquier módulo para ver los planes.';
    }
    return 'Mentoria é Premium. Toque em qualquer módulo para ver os planos.';
  }

  String get profileRequiredTitle {
    if (_en) return 'Your mentorship starts with your profile';
    if (_es) return 'Tu mentoría empieza por tu perfil';
    return 'Sua mentoria começa pelo seu perfil';
  }

  String get profileRequiredCardBody {
    if (_en) {
      return 'A conservative, moderate and growth investor should not receive the same guidance. Take the test so Mentor can build the right track for your current moment.';
    }
    if (_es) {
      return 'Un conservador, un moderado y un audaz no deben recibir la misma orientación. Haz el test para que Mentor monte la ruta correcta para tu momento actual.';
    }
    return 'Um conservador, um moderado e um arrojado não devem receber a mesma orientação. Faça o teste para o Mentor montar a trilha correta para seu momento atual.';
  }

  String get profileRequiredCta {
    if (_en) return 'Take Investor Profile Test';
    if (_es) return 'Hacer Test de Perfil';
    return 'Fazer Simulado de Perfil';
  }

  String get completed {
    if (_en) return 'Completed';
    if (_es) return 'Concluido';
    return 'Concluído';
  }

  String get lessonSubtitle {
    if (_en) return 'Video + reading + checkpoint';
    if (_es) return 'Video + lectura + checkpoint';
    return 'Vídeo + leitura + checkpoint';
  }

  String priorityLabel(MentoriaPriority priority) {
    switch (priority) {
      case MentoriaPriority.essencial:
        if (_en) return 'Essential';
        if (_es) return 'Esencial';
        return 'Essencial';
      case MentoriaPriority.importante:
        if (_en) return 'Important';
        if (_es) return 'Importante';
        return 'Importante';
    }
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
      logoAsset: SplashAssetResolver.logoSplash,
      backgroundAsset: SplashAssetResolver.cyberBg,
      backgroundColor: Colors.black,
    );
  }
}
