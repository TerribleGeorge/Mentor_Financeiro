// FIREBASE SERVICE - SERVIÇOS DO FIREBASE
// Este arquivo contém todas as integrações com o Firebase:
// - Firebase Auth (autenticação)
// - Firebase Firestore (banco de dados)
// - Firebase Messaging (notificações push)
// - Google Sign In (login com Google)
//

// Pacotes Firebase para autenticação
import 'package:firebase_auth/firebase_auth.dart';

// Login com Google (OAuth)
import 'package:google_sign_in/google_sign_in.dart';

// Firestore (banco de dados NoSQL em tempo real)
import 'package:cloud_firestore/cloud_firestore.dart';

// Firebase Messaging (notificações push)
import 'package:firebase_messaging/firebase_messaging.dart';

// Utilities de debug
import 'package:flutter/foundation.dart';

// CLASSE FIREBASE SERVICE
// Singleton: Uma única instância para todo o app
class FirebaseService {
  // ==============================================================================
  // INSTÂNCIAS DOS SERVIÇOS FIREBASE
  // ==============================================================================

  // Firebase Auth: Gerencia autenticação de usuários
  // Importância: Login, logout, verificação de usuário logado
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign In: Permite login com conta Google
  // Importância: SSO - usuário não precisa criar senha
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email', 'profile'],
  );

  // Firestore: Banco de dados principal
  // Importância: Persistência de dados do usuário
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firebase Messaging: Para notificações push
  // Importância: Enviar notificações mesmo quando app fechado
  static FirebaseMessaging? _messaging;

  // ==============================================================================
  // INICIALIZAÇÃO DO MESSAGING
  // ==============================================================================
  // Configura as notificações push do app
  // Por quê? Precisa de permissão do usuário
  // ==============================================================================
  static Future<void> inicializarFirebase() async {
    _messaging = FirebaseMessaging.instance;
  }

  // Inicializa messaging se não estiver inicializado
  static Future<void> inicializarMessaging() async {
    // Verifica se já foi inicializado
    if (_messaging == null) {
      await inicializarFirebase();
    }

    // Solicita permissão para enviar notificações
    // Importância: Sem permissão, não consegue enviar push
    // Impacto: Usuários não recebem alertas
    final NotificationSettings settings = await _messaging!.requestPermission();

    // Se permitido, obtém o token do dispositivo
    // Por quê? Token identifica o dispositivo para push
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await _messaging!.getToken();
      if (kDebugMode) debugPrint("FCM Token: $token");
    }

    // Configura handler para mensagens em background
    // Por quê? Quando app está fechado, precisa desta configuração
    FirebaseMessaging.onBackgroundMessage(_mensagemBackground);

    // Configura handler para mensagens em foreground
    // Por quê? Quando app está aberto, precisa de tratamento adicional
    FirebaseMessaging.onMessage.listen(_mensagemForeground);
  }

  // Handler para mensagens recebidas quando app está em background
  // Importance: Processed mesmo quando app fechado
  static Future<void> _mensagemBackground(RemoteMessage message) async {
    if (kDebugMode) {
      debugPrint("Mensagem em background: ${message.notification?.title}");
    }
  }

  // Handler para mensagens recebidas quando app está em foreground
  // Importance: Processed em tempo real enquanto app aberto
  static void _mensagemForeground(RemoteMessage message) {
    if (kDebugMode) {
      debugPrint("Mensagem em foreground: ${message.notification?.title}");
    }
  }

  // ==============================================================================
  // CÁLCULO DE RENDIMENTO
  // ==============================================================================
  static String calcularRendimento(
    double percentualCdi, {
    double capital = 1000.0,
  }) {
    final rendimento = capital * (percentualCdi / 100);
    final valorFinal = capital + rendimento;
    return 'R\$ ${valorFinal.toStringAsFixed(2)}';
  }

  // ==============================================================================
  // PERFIL DE INVESTIDOR E TÓPICOS
  // ==============================================================================
  static const List<String> perfisInvestidor = [
    'conservador',
    'moderado',
    'arrojado',
  ];

  static Future<void> inscricaoTopico(String perfil) async {
    if (_messaging == null) return;
    if (!perfisInvestidor.contains(perfil)) return;
    await _messaging!.subscribeToTopic('perfil_$perfil');
  }

  static Future<void> cancelarInscricaoTopico(String perfil) async {
    if (_messaging == null) return;
    if (!perfisInvestidor.contains(perfil)) return;
    await _messaging!.unsubscribeFromTopic('perfil_$perfil');
  }

  // ==============================================================================
  // TRADUTORA DE TAXAS
  // ==============================================================================
  static String traduzTaxa({
    required double taxa,
    required String tipoTaxa,
    required String perfilInvestidor,
  }) {
    final isRendaFixa =
        tipoTaxa.toLowerCase() == 'renda fixa' ||
        tipoTaxa.toLowerCase() == 'cdi' ||
        tipoTaxa.toLowerCase() == 'selic' ||
        tipoTaxa.toLowerCase() == 'ipca';

    if (isRendaFixa) {
      return 'Nova taxa de $tipoTaxa em ${taxa}%! '
          'Essa é uma opção mais segura para construir patrimônio.';
    }

    if (perfilInvestidor == 'moderado' || perfilInvestidor == 'arrojado') {
      return 'Atenção: $tipoTaxa em ${taxa}%! '
          'Esse tipo de investimento requer conhecimento e tolerância ao risco.';
    }

    return 'Taxa informada: ${taxa}%';
  }

  // ==============================================================================
  // MENSAGEM DE IMPACTO
  // ==============================================================================
  static String gerarMensagemImpacto({
    required double taxa,
    double capital = 1000.0,
  }) {
    final rendimentoMensal = capital * (taxa / 100) / 12;
    return 'Com a nova taxa de ${taxa}%, seus R\$ ${capital.toStringAsFixed(0)} '
        'rendem aproximadamente R\$ ${rendimentoMensal.toStringAsFixed(2)} por mês '
        'com mais segurança que a poupança.';
  }

  // ==============================================================================
  // GERENCIAMENTO DE TOKEN FCM
  // ==============================================================================
  // Salva o token de notifications no banco para envio posterior
  // Por quê? Firestore precisa do token para enviar mensagens
  // ==============================================================================
  static Future<void> salvarTokenMessaging(String uid) async {
    if (_messaging == null) return;
    String? token = await _messaging!.getToken();
    if (token != null) {
      await _firestore.collection('usuarios').doc(uid).update({
        'fcmToken': token,
      });
    }
  }

  // ==============================================================================
  // AUTENTICAÇÃO
  // ==============================================================================

  // Getter para obter o usuário atual logado
  // Return: User? (pode ser null se não logado)
  static User? get usuarioAtual => _auth.currentUser;

  // Login com Google
  // Importance: SSO - login rápido sem senha
  // Impacto: Aumenta taxa de conversão de login
  static Future<User?> loginGoogle() async {
    try {
      // Abre popup de seleção de conta Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      // Obtém credentials do Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Cria credential do Firebase Auth
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Realiza login no Firebase
      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      if (kDebugMode) debugPrint("Erro no login Google: $e");
      return null;
    }
  }

  // Login anônimo (para usuários que não querem conta)
  // Importance: Permite testar app sem compromisso
  // Impacto: Baixa barreira de entrada
  static Future<User?> loginAnonimo() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      if (kDebugMode) debugPrint("Erro no login anônim: $e");
      return null;
    }
  }

  // Logout (sair da conta)
  // Importance: Seguraança - usuário pode sair
  static Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  // ==============================================================================
  // DADOS DO USUÁRIO (FIRESTORE)
  // ==============================================================================

  // Email do administrador (substitua pelo seu email)
  static const String emailAdmin = "george.guimares@gmail.com";

  // Verifica se é admin pelo email
  static bool verificarAdmin(String? email) {
    if (email == null) return false;
    return email.toLowerCase() == emailAdmin.toLowerCase();
  }

  // Salva dados do usuário no Firestore
  // Importância: Persiste dados do perfil
  // Impacto: Dados disponíveis em múltiplos dispositivos
  static Future<void> salvarDadosUsuario({
    required String uid,
    required String nome,
    String? email,
    required String metodoLogin,
    Map<String, dynamic>? configuracoes,
    bool isPrimeiroLogin = false,
  }) async {
    if (!isPrimeiroLogin) {
      await _firestore.collection('usuarios').doc(uid).set({
        'nome': nome,
        'email': email,
        'metodoLogin': metodoLogin,
        'configuracoes': configuracoes ?? {},
        'criadoEm': DateTime.now(),
      }, SetOptions(merge: true));
      return;
    }

    final isAdmin = verificarAdmin(email);
    final isPremium = isAdmin;

    await _firestore.collection('usuarios').doc(uid).set({
      'uid': uid,
      'nome': nome,
      'email': email,
      'displayName': nome,
      'metodoLogin': metodoLogin,
      'isPremium': isPremium,
      'isAdmin': isAdmin,
      'configuracoes': configuracoes ?? {},
      'criadoEm': DateTime.now(),
    }, SetOptions(merge: true));
  }

  // Verifica se usuário já existe no Firestore
  static Future<bool> usuarioExiste(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    return doc.exists;
  }

  // Cria usuário no primeiro login
  static Future<void> criarUsuarioPrimeiroLogin({
    required String uid,
    required String nome,
    String? email,
    required String metodoLogin,
    String? photoUrl,
  }) async {
    final isAdmin = verificarAdmin(email);
    final isPremium = isAdmin;

    await _firestore.collection('usuarios').doc(uid).set({
      'uid': uid,
      'nome': nome,
      'email': email,
      'displayName': nome,
      'photoURL': photoUrl,
      'metodoLogin': metodoLogin,
      'isPremium': isPremium,
      'isAdmin': isAdmin,
      'perfilInvestidor': '',
      'onboardingCompleto': false,
      'configuracoes': {},
      'criadoEm': DateTime.now(),
    });
  }

  // Atualiza status premium do usuário
  static Future<void> atualizarPremium(String uid, bool isPremium) async {
    await _firestore.collection('usuarios').doc(uid).update({
      'isPremium': isPremium,
    });
  }

  // Salva perfil de investidor no Firestore
  static Future<void> salvarPerfilInvestidor(String uid, String perfil) async {
    final email = (await buscarDadosUsuario(uid))?['email'];
    final isAdmin = verificarAdmin(email);
    await _firestore.collection('usuarios').doc(uid).update({
      'perfilInvestidor': perfil.toLowerCase(),
      'isPremium': isAdmin ? true : FieldValue.delete(),
    });
  }

  // Completa onboarding no Firestore
  static Future<void> completarOnboarding(String uid) async {
    final email = (await buscarDadosUsuario(uid))?['email'];
    final isAdmin = verificarAdmin(email);
    await _firestore.collection('usuarios').doc(uid).update({
      'onboardingCompleto': true,
      'isPremium': isAdmin ? true : FieldValue.delete(),
    });
  }

  // Atualiza dados do usuário (sync)
  static Future<void> atualizarDadosUsuario({
    required String uid,
    String? nome,
    String? photoUrl,
  }) async {
    final updates = <String, dynamic>{};
    if (nome != null) updates['nome'] = nome;
    if (photoUrl != null) updates['photoURL'] = photoUrl;
    if (nome != null) updates['displayName'] = nome;
    await _firestore.collection('usuarios').doc(uid).update(updates);
  }

  // Salva perfil completo do usuário
  static Future<void> salvarPerfilCompleto({
    required String uid,
    String? profissao,
    String? perfilInvestidor,
    String? objetivos,
  }) async {
    final email = (await buscarDadosUsuario(uid))?['email'];
    final isAdmin = verificarAdmin(email);
    final updates = <String, dynamic>{};
    if (profissao != null) updates['profissao'] = profissao;
    if (perfilInvestidor != null)
      updates['perfilInvestidor'] = perfilInvestidor.toLowerCase();
    if (objetivos != null) updates['objetivos'] = objetivos;
    if (isAdmin) updates['isPremium'] = true;
    updates['perfilCompleto'] = true;
    await _firestore.collection('usuarios').doc(uid).update(updates);
  }

  // Getter público para Firestore
  static FirebaseFirestore get firestore => _firestore;

  // Busca dados do usuário no Firestore
  // Importance: Carrega perfil do usuário
  static Future<Map<String, dynamic>?> buscarDadosUsuario(String uid) async {
    try {
      final doc = await _firestore.collection('usuarios').doc(uid).get();
      return doc.data();
    } catch (e) {
      return null;
    }
  }

  // Busca stream de dados do usuário (tempo real)
  static Stream<Map<String, dynamic>?> buscarDadosUsuarioStream(String uid) {
    return _firestore
        .collection('usuarios')
        .doc(uid)
        .snapshots()
        .map((doc) => doc.data());
  }

  // Obtém status isPremium em tempo real
  static Future<bool> verificarPremium(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    return doc.get('isPremium') ?? false;
  }

  // Obtém status isAdmin em tempo real
  static Future<bool> verificarAdminUid(String uid) async {
    final doc = await _firestore.collection('usuarios').doc(uid).get();
    return doc.get('isAdmin') ?? false;
  }

  // Atualiza configurações do usuário
  // Importance: Salva alterações de configuração
  static Future<void> atualizarConfiguracoes(
    String uid,
    Map<String, dynamic> configuracoes,
  ) async {
    await _firestore.collection('usuarios').doc(uid).update({
      'configuracoes': configuracoes,
    });
  }

  // ==============================================================================
  // GASTOS (FINANCEIRO)
  // ==============================================================================

  // Salva um gasto no Firestore
  // Importance: Armazena histórico de gastos
  // Impacto: Usuário acompanha despesas
  static Future<void> salvarGasto({
    required String uid,
    required String descricao,
    required double valor,
    required DateTime data,
    String? categoria,
  }) async {
    await _firestore.collection('usuarios').doc(uid).collection('gastos').add({
      'descricao': descricao,
      'valor': valor,
      'data': data,
      'categoria': categoria,
      'criadoEm': DateTime.now(),
    });
  }

  // Obtém stream de gastos (tempo real)
  // Importance: Sincronização automática
  static Stream<QuerySnapshot> getGastos(String uid) {
    return _firestore
        .collection('usuarios')
        .doc(uid)
        .collection('gastos')
        .orderBy('data', descending: true)
        .snapshots();
  }

  // ==============================================================================
  // METAS (FINANCEIRO)
  // ==============================================================================

  // Salva uma meta no Firestore
  // Importance: Rastrear objetivos financeiros
  static Future<void> salvarMeta({
    required String uid,
    required String nome,
    required double valorAlvo,
    required double valorAtual,
    DateTime? prazo,
  }) async {
    await _firestore.collection('usuarios').doc(uid).collection('metas').add({
      'nome': nome,
      'valorAlvo': valorAlvo,
      'valorAtual': valorAtual,
      'prazo': prazo,
      'criadoEm': DateTime.now(),
    });
  }

  // Obtém stream de metas
  static Stream<QuerySnapshot> getMetas(String uid) {
    return _firestore
        .collection('usuarios')
        .doc(uid)
        .collection('metas')
        .snapshots();
  }
}
