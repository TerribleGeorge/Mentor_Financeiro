import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/subscription_constants.dart';

class SubscriptionProvider extends ChangeNotifier {
  bool _isPremium = false;
  bool _isLoading = false;
  String? _errorMessage;
  String _currentRegion = 'BR';
  DateTime? _subscriptionEndDate;

  bool get isPremium => _isPremium;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get currentRegion => _currentRegion;
  DateTime? get subscriptionEndDate => _subscriptionEndDate;

  bool get hasActiveSubscription =>
      _isPremium &&
      _subscriptionEndDate != null &&
      _subscriptionEndDate!.isAfter(DateTime.now());

  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    await _loadPremiumStatus();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadPremiumStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      _isPremium = false;
      return;
    }

    try {
      final doc = await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .get();

      if (doc.exists) {
        final data = doc.data();
        _isPremium = data?['isPremium'] ?? false;

        if (data?['premiumEndDate'] != null) {
          _subscriptionEndDate = (data!['premiumEndDate'] as Timestamp)
              .toDate();
        }
      }
    } catch (e) {
      debugPrint('Erro ao carregar status premium: $e');
    }
  }

  Future<bool> purchaseMonthly() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        _errorMessage = 'Usuário não autenticado';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      await Future.delayed(const Duration(seconds: 1));

      _isPremium = true;
      _subscriptionEndDate = DateTime.now().add(const Duration(days: 30));

      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .set({
            'isPremium': true,
            'premiumStartDate': DateTime.now(),
            'premiumEndDate': _subscriptionEndDate,
            'premiumType': 'monthly',
          }, SetOptions(merge: true));

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Erro ao processar compra: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> purchaseYearly() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        _errorMessage = 'Usuário não autenticado';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      await Future.delayed(const Duration(seconds: 1));

      _isPremium = true;
      _subscriptionEndDate = DateTime.now().add(const Duration(days: 365));

      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .set({
            'isPremium': true,
            'premiumStartDate': DateTime.now(),
            'premiumEndDate': _subscriptionEndDate,
            'premiumType': 'yearly',
          }, SetOptions(merge: true));

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Erro ao processar compra: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> restorePurchases() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await _loadPremiumStatus();

    _isLoading = false;
    notifyListeners();
  }

  void setRegion(String regionCode) {
    _currentRegion = regionCode;
    notifyListeners();
  }

  String getFormattedPrice(String offerType) {
    if (offerType == 'monthly') {
      return SubscriptionConstants.getMonthlyPrice(_currentRegion);
    } else {
      return SubscriptionConstants.getYearlyPrice(_currentRegion);
    }
  }

  List<String> getLocalizedBenefits() {
    return SubscriptionConstants.getBenefitsForLocale(_currentRegion);
  }

  Future<void> updatePremiumStatus(bool isPremium) async {
    _isPremium = isPremium;
    notifyListeners();

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('usuarios').doc(user.uid).set(
        {'isPremium': isPremium},
        SetOptions(merge: true),
      );
    }
  }

  Future<void> refreshStatus() async {
    await _loadPremiumStatus();
    notifyListeners();
  }
}
