import 'package:flutter/material.dart';

import '../../services/mentoria_service.dart';
import 'mentoria_screen.dart';

class MentoriaLessonScreen extends StatefulWidget {
  const MentoriaLessonScreen({super.key, required this.args});
  final MentoriaLessonArgs args;

  @override
  State<MentoriaLessonScreen> createState() => _MentoriaLessonScreenState();
}

class _MentoriaLessonScreenState extends State<MentoriaLessonScreen> {
  final _checkpointController = TextEditingController();
  bool _completed = false;

  @override
  void dispose() {
    _checkpointController.dispose();
    super.dispose();
  }

  Future<void> _completeLesson() async {
    await MentoriaService.markLessonCompleted(widget.args.lesson.id);
    if (!mounted) return;
    final strings = _LessonUiStrings(
      Localizations.localeOf(context).languageCode,
    );
    setState(() => _completed = true);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(strings.completedMessage)));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final lesson = widget.args.lesson;
    final module = widget.args.module;
    final strings = _LessonUiStrings(
      Localizations.localeOf(context).languageCode,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text(module.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: scheme.primary.withValues(alpha: 0.25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.title,
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontSize: 21,
                    height: 1.12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color(module.accent).withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(
                      color: Color(module.accent).withValues(alpha: 0.38),
                    ),
                  ),
                  child: Text(
                    '${module.priority.label} • ${module.title}',
                    style: TextStyle(
                      color: Color(module.accent),
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                if (lesson.videoUrl.trim().isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    '${strings.videoLabel}: ${lesson.videoUrl}',
                    style: TextStyle(
                      color: scheme.onSurface.withValues(alpha: 0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 14),
          for (final b in lesson.blocks) ...[
            if (b.type == MentoriaBlockType.paragraph)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: scheme.surface.withValues(alpha: 0.48),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: scheme.primary.withValues(alpha: 0.16),
                  ),
                ),
                child: Text(
                  b.text ?? '',
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.88),
                    height: 1.42,
                    fontSize: 15,
                  ),
                ),
              ),
            if (b.type == MentoriaBlockType.bullets)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0B0B0B).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Color(module.accent).withValues(alpha: 0.22),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (b.items ?? const <String>[])
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• ',
                                style: TextStyle(
                                  color: scheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: scheme.onSurface.withValues(
                                      alpha: 0.84,
                                    ),
                                    height: 1.38,
                                    fontSize: 14.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(module.accent).withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Color(module.accent).withValues(alpha: 0.34),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.checkpoint.title,
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  lesson.checkpoint.prompt,
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.75),
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _checkpointController,
                  minLines: 2,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: strings.writeHere,
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _completed
                      ? null
                      : () async {
                          if (_checkpointController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(strings.fillCheckpoint)),
                            );
                            return;
                          }
                          await _completeLesson();
                        },
                  child: Text(
                    _completed ? strings.completed : strings.completeLesson,
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

class _LessonUiStrings {
  const _LessonUiStrings(this.languageCode);

  final String languageCode;

  bool get _en => languageCode.toLowerCase().startsWith('en');
  bool get _es => languageCode.toLowerCase().startsWith('es');

  String get completedMessage {
    if (_en) return 'Lesson completed. Mentor Score updated.';
    if (_es) return 'Lección concluida. Mentor Score actualizado.';
    return 'Lição concluída. Mentor Score atualizado.';
  }

  String get videoLabel {
    if (_en) return 'Video';
    if (_es) return 'Video';
    return 'Vídeo';
  }

  String get writeHere {
    if (_en) return 'Write here...';
    if (_es) return 'Escribe aquí...';
    return 'Escreva aqui...';
  }

  String get fillCheckpoint {
    if (_en) return 'Fill the checkpoint to complete.';
    if (_es) return 'Completa el checkpoint para concluir.';
    return 'Preencha o checkpoint para concluir.';
  }

  String get completed {
    if (_en) return 'Completed';
    if (_es) return 'Concluido';
    return 'Concluído';
  }

  String get completeLesson {
    if (_en) return 'Complete lesson';
    if (_es) return 'Concluir lección';
    return 'Concluir lição';
  }
}
