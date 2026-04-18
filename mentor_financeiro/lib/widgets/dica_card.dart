import 'package:flutter/material.dart';
import '../services/mentoria_service.dart';

class DicaCard extends StatelessWidget {
  final DicaFinanceira dica;
  final VoidCallback? onDismiss;

  const DicaCard({super.key, required this.dica, this.onDismiss});

  Color _getBackgroundColor() {
    switch (dica.colorTypeEnum) {
      case ColorTypeEnum.orange:
        return const Color(0xFFFF9F43).withValues(alpha: 0.15);
      case ColorTypeEnum.green:
        return const Color(0xFF26DE81).withValues(alpha: 0.15);
      case ColorTypeEnum.red:
        return const Color(0xFFFC5C65).withValues(alpha: 0.15);
      case ColorTypeEnum.blue:
        return const Color(0xFF00D9FF).withValues(alpha: 0.15);
    }
  }

  Color _getBorderColor() {
    switch (dica.colorTypeEnum) {
      case ColorTypeEnum.orange:
        return const Color(0xFFFF9F43);
      case ColorTypeEnum.green:
        return const Color(0xFF26DE81);
      case ColorTypeEnum.red:
        return const Color(0xFFFC5C65);
      case ColorTypeEnum.blue:
        return const Color(0xFF00D9FF);
    }
  }

  IconData _getIcon() {
    switch (dica.tipo) {
      case TipoDica.alerta:
        return Icons.warning_amber_rounded;
      case TipoDica.oportunidade:
      case TipoDica.goldenDay:
        return Icons.lightbulb_outline_rounded;
      case TipoDica.perigo:
        return Icons.error_outline_rounded;
      case TipoDica.nenhuma:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _getBorderColor().withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _getBorderColor().withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(_getIcon(), color: _getBorderColor(), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dica.titulo,
                    style: TextStyle(
                      color: _getBorderColor(),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dica.mensagem,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (onDismiss != null)
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white38, size: 18),
                onPressed: onDismiss,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
          ],
        ),
      ),
    );
  }
}

class DicaCarousel extends StatelessWidget {
  final List<DicaFinanceira> dicas;

  const DicaCarousel({super.key, required this.dicas});

  @override
  Widget build(BuildContext context) {
    if (dicas.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dicas.length,
        itemBuilder: (context, index) {
          return SizedBox(width: 280, child: DicaCard(dica: dicas[index]));
        },
      ),
    );
  }
}
