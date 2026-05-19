import 'package:flutter/material.dart';

import '../../services/locale_ui_strings.dart';

class GolpesPage extends StatelessWidget {
  const GolpesPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (LocaleUiStrings.of(context).text('pt', en: 'en', es: 'es') != 'pt') {
      return _fallbackPage(context);
    }
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text('Golpes'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _hero(context),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scheme.onSurface.withValues(alpha: 0.08),
              ),
            ),
            child: Text(
              'Os golpes mudam de país para país, mas quase sempre seguem o mesmo padrão: '
              'urgência + link/telefone + pedido de ação imediata. '
              'A regra é universal: não clique, não ligue para o número da mensagem e não faça “PIX de teste”. '
              'Confirme sempre pelo app oficial do seu banco.',
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.78),
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _comparisonCard(context),
          const SizedBox(height: 16),
          _tile(
            context,
            icon: Icons.sms_outlined,
            title: 'Links suspeitos (SMS/WhatsApp/e-mail)',
            body:
                'Desconfie de mensagens com urgência (“última chance”). Nunca clique em links para “regularizar” ou “desbloquear” conta. Prefira abrir o app oficial do banco.',
          ),
          _scamPattern(
            context,
            index: 1,
            title:
                '“Compra suspensa” ou “PIX em análise” (link de cancelamento)',
            example:
                'BB: Compra de R\$ 2.499,90 em MAGAZINE LUIZA aguardando aprovação. '
                'Caso NÃO tenha realizado, cancele agora em: ://link-falso.com',
            why:
                'Bancos quase nunca enviam link para “cancelar compra” por mensagem. '
                'O objetivo é te levar a um site falso para capturar senha/código.',
            whatToDo:
                'Se você não reconhece a compra/PIX, abra o app oficial do banco por conta própria '
                '(não pelo link) e confira a transação. Se preciso, bloqueie o cartão pelo app.',
          ),
          _tile(
            context,
            icon: Icons.pix_outlined,
            title: 'PIX errado / pedido de PIX',
            body:
                'Sempre confira nome e instituição antes de confirmar. Se alguém pedir PIX “para liberar entrega” ou “taxa”, pare e valide por outro canal.',
          ),
          _scamPattern(
            context,
            index: 2,
            title: '“Central de segurança” falsa (telefone na mensagem)',
            example:
                'BANCO INTER: Tentativa de acesso suspeita em seu dispositivo em SP. '
                'Se não foi você, ligue para a nossa central: 0800-XXX-XXXX.',
            why:
                'O número pode parecer oficial, mas pertence aos golpistas. '
                'Golpistas trocam números com frequência (como telemarketing) — por isso não '
                'indicamos aqui um “0800 certo”: o seguro é sempre o contacto no verso do cartão '
                'ou no app/site oficial do seu banco. '
                'Ao ligar para o número da mensagem, o “atendente” pode pedir PIX ou “conta segura”.',
            whatToDo:
                'Desligue e procure o contato oficial no verso do cartão ou no site/app oficial. '
                'Nunca faça transferências “para validar”, “testar” ou “proteger”.',
          ),
          _tile(
            context,
            icon: Icons.receipt_long_outlined,
            title: 'Boleto falso',
            body:
                'Verifique beneficiário, CNPJ/CPF, banco emissor e valor. Se possível, pague pelo app do banco lendo o código pelo próprio app (evita copiar/colar adulterado).',
          ),
          _tile(
            context,
            icon: Icons.call_outlined,
            title: 'Falsa central / falso atendente',
            body:
                'Banco não pede senha, token ou código. Se ligarem, desligue e ligue você mesmo para o número oficial do cartão/banco.',
          ),
          _scamPattern(
            context,
            index: 3,
            title: 'PIX agendado falso (link para “cancelar”)',
            example:
                'NOTIFICAÇÃO: PIX agendado no valor de R\$ 850,00 para [Nome Estranho]. '
                'Para cancelar este agendamento, acesse sua conta: ://banco-atualiza-token.com',
            why:
                'O link abre uma página falsa para você digitar sua senha/código. '
                'Golpistas usam urgência e medo para você agir rápido.',
            whatToDo:
                'Não clique. Abra o app do banco e procure “Agendamentos”/“Extrato”. '
                'Se existir algo suspeito, cancele por lá e altere senhas/biometria.',
          ),
          _tile(
            context,
            icon: Icons.lock_outline,
            title: 'Código/OTP é pessoal',
            body:
                'Nunca compartilhe códigos de verificação. Eles permitem acesso à sua conta. Se alguém pediu, é golpe.',
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scheme.onSurface.withValues(alpha: 0.08),
              ),
            ),
            child: Text(
              'Dica: em caso de dúvida, pare a transação e confirme no app oficial do banco. '
              'Pressa é o principal gatilho de golpes.',
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.78),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fallbackPage(BuildContext context) {
    final strings = LocaleUiStrings.of(context);
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(strings.text('Golpes', en: 'Scams', es: 'Estafas')),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            strings.text(
              'Os golpes mudam de país para país, mas quase sempre seguem o mesmo padrão: urgência, link/telefone e pedido de ação imediata.',
              en: 'Scams vary by country, but they usually follow the same pattern: urgency, a link or phone number, and a request for immediate action.',
              es: 'Las estafas cambian según el país, pero casi siempre siguen el mismo patrón: urgencia, enlace o teléfono y pedido de acción inmediata.',
            ),
            style: TextStyle(
              color: scheme.onSurface.withValues(alpha: 0.78),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 16),
          _tile(
            context,
            icon: Icons.sms_outlined,
            title: strings.text(
              'Links suspeitos (SMS/WhatsApp/e-mail)',
              en: 'Suspicious links (SMS/WhatsApp/email)',
              es: 'Enlaces sospechosos (SMS/WhatsApp/correo)',
            ),
            body: strings.text(
              'Nunca clique em links para regularizar ou desbloquear conta. Abra sempre o app oficial do banco.',
              en: 'Never tap links to regularize or unlock an account. Always open your bank’s official app yourself.',
              es: 'Nunca pulses enlaces para regularizar o desbloquear una cuenta. Abre siempre la app oficial del banco.',
            ),
          ),
          _tile(
            context,
            icon: Icons.pix_outlined,
            title: strings.text(
              'PIX errado / pedido de PIX',
              en: 'Wrong transfer or payment request',
              es: 'Transferencia equivocada o pedido de pago',
            ),
            body: strings.text(
              'Confira nome, instituição e valor antes de confirmar qualquer transferência.',
              en: 'Check the name, institution, and amount before confirming any transfer.',
              es: 'Revisa nombre, institución y valor antes de confirmar cualquier transferencia.',
            ),
          ),
        ],
      ),
    );
  }

  Widget _hero(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1118),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFF4D4D).withValues(alpha: 0.78),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF4D4D).withValues(alpha: 0.14),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4D4D).withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFFF4D4D).withValues(alpha: 0.42),
              ),
            ),
            child: const Icon(
              Icons.shield_outlined,
              color: Color(0xFFFF4D4D),
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Proteja seu dinheiro',
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Checklist rápido para evitar golpes comuns.',
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.7),
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

  Widget _tile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String body,
  }) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.onSurface.withValues(alpha: 0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              icon,
              color: scheme.primary.withValues(alpha: 0.9),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                Text(
                  body,
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.75),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _scamPattern(
    BuildContext context, {
    required int index,
    required String title,
    required String example,
    required String why,
    required String whatToDo,
  }) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1118),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFF4D4D).withValues(alpha: 0.55),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF4D4D).withValues(alpha: 0.12),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4D4D).withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFFF4D4D).withValues(alpha: 0.42),
                  ),
                ),
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    color: Color(0xFFFF4D4D),
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Exemplo de mensagem falsa',
            style: TextStyle(
              color: scheme.onSurface.withValues(alpha: 0.7),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: scheme.onSurface.withValues(alpha: 0.08),
              ),
            ),
            child: Text(
              example,
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.86),
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _labelBlock(context, label: 'Por que é golpe?', text: why),
          const SizedBox(height: 10),
          _labelBlock(context, label: 'O que fazer', text: whatToDo),
        ],
      ),
    );
  }

  Widget _labelBlock(
    BuildContext context, {
    required String label,
    required String text,
  }) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: scheme.onSurface.withValues(alpha: 0.78),
            fontWeight: FontWeight.w900,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: TextStyle(
            color: scheme.onSurface.withValues(alpha: 0.75),
            height: 1.35,
          ),
        ),
      ],
    );
  }

  Widget _comparisonCard(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1118),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF00D9FF).withValues(alpha: 0.55),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D9FF).withValues(alpha: 0.12),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D9FF).withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF00D9FF).withValues(alpha: 0.42),
                  ),
                ),
                child: const Icon(
                  Icons.verified_user_outlined,
                  color: Color(0xFF00D9FF),
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Como diferenciar uma mensagem REAL de uma FALSA',
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _compareHeader(context),
          const SizedBox(height: 10),
          _compareRow(
            context,
            label: 'Link',
            real: 'Raramente possui. Se tiver, é informativo.',
            fake: 'Quase sempre tem link curto ou estranho.',
          ),
          _compareRow(
            context,
            label: 'Ação solicitada',
            real: 'Apenas informa que o dinheiro saiu.',
            fake: 'Pede para “cancelar”, “atualizar” ou “ligar”.',
          ),
          _compareRow(
            context,
            label: 'Tom de voz',
            real: 'Neutro e direto.',
            fake: 'Alarmista (“Urgente”, “Bloqueio”, “Imediato”).',
          ),
          _compareRow(
            context,
            label: 'Destinatário',
            real: 'Sabe seu nome ou parte do cartão.',
            fake: 'Genérica (“Prezado cliente”).',
          ),
          _compareRow(
            context,
            label: 'Remetente',
            real: 'Pode vir de números curtos (varia por país).',
            fake: 'Números comuns/celular ou 0800 “inventado”.',
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: scheme.onSurface.withValues(alpha: 0.08),
              ),
            ),
            child: Text(
              'Dica de ouro: se receber um SMS ou notificação estranha, feche tudo e abra o app do banco. '
              'Se não houver nada no extrato ou na fatura do cartão, a mensagem é falsa.',
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.82),
                height: 1.35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _compareHeader(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 92),
        Expanded(
          child: Text(
            'REAL',
            style: TextStyle(
              color: const Color(0xFF26DE81).withValues(alpha: 0.95),
              fontWeight: FontWeight.w900,
              fontSize: 12,
              letterSpacing: 0.6,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Text(
            'FALSA',
            style: TextStyle(
              color: const Color(0xFFFF4D4D).withValues(alpha: 0.95),
              fontWeight: FontWeight.w900,
              fontSize: 12,
              letterSpacing: 0.6,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _compareRow(
    BuildContext context, {
    required String label,
    required String real,
    required String fake,
  }) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 92,
            child: Text(
              label,
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.75),
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              real,
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.78),
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              fake,
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.78),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
