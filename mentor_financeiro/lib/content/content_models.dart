import 'package:flutter/material.dart';

/// Onde um bloco de conteúdo faz sentido (Brasil vs Global).
enum ContentAudience {
  brazilOnly,
  internationalOnly,
  universal,
}

enum PremiumThemeAura { cyber, grimm, hive }

class ContentBlock {
  const ContentBlock({
    required this.id,
    required this.title,
    required this.body,
    required this.icon,
    this.audience = ContentAudience.universal,
    this.premiumOnly = false,
    this.premiumAura,
  });

  final String id;
  final String title;
  final String body;
  final IconData icon;
  final ContentAudience audience;
  final bool premiumOnly;
  final PremiumThemeAura? premiumAura;
}

class ContentSection {
  const ContentSection({
    required this.id,
    required this.title,
    required this.blocks,
  });

  final String id;
  final String title;
  final List<ContentBlock> blocks;
}

class ContentMenuItem {
  const ContentMenuItem({
    required this.id,
    required this.title,
    required this.icon,
    this.audience = ContentAudience.universal,
    this.premiumOnly = false,
  });

  final String id;
  final String title;
  final IconData icon;
  final ContentAudience audience;
  final bool premiumOnly;
}

