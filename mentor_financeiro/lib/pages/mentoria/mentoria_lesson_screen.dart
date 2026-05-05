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
    setState(() => _completed = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Lição concluída. Mentor Score atualizado.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final lesson = widget.args.lesson;
    final module = widget.args.module;

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
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Vídeo: ${lesson.videoUrl}',
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          for (final b in lesson.blocks) ...[
            if (b.type == MentoriaBlockType.paragraph)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  b.text ?? '',
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.85),
                    height: 1.35,
                    fontSize: 14,
                  ),
                ),
              ),
            if (b.type == MentoriaBlockType.bullets)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
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
                                    color: scheme.onSurface
                                        .withValues(alpha: 0.8),
                                    height: 1.3,
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
              color: const Color(0xFF0B0B0B).withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: scheme.primary.withValues(alpha: 0.25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.checkpoint.title,
                  style: TextStyle(
                    color: scheme.onSurface,
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Escreva aqui…',
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _completed
                      ? null
                      : () async {
                          if (_checkpointController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Preencha o checkpoint para concluir.'),
                              ),
                            );
                            return;
                          }
                          await _completeLesson();
                        },
                  child: Text(_completed ? 'Concluído' : 'Concluir lição'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

