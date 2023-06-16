import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:help_me_design/appwrite_service/appwrite_constants_all.dart';
import 'package:help_me_design/utility/utility_helper.dart';

// class AuthService {
//   final client = Client()
//       .setEndpoint(AppWriteConst.APPWRITE_ENDPOINT) // Your API Endpoint
//       .setProject(AppWriteConst.APPWRITE_PROJECT_ID); // Your project ID

//   static signInWithEmailAndPassword() {}
//   static signInWithGitHub() {}
//   static signInWithGoogle() {}
// }

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AuthService extends ChangeNotifier {
  Client client = Client();
  late final Account account;

  late User _currentUser;

  AuthStatus _status = AuthStatus.uninitialized;

  // Getter methods
  User get currentUser => _currentUser;
  AuthStatus get status => _status;
  String? get username => _currentUser.name;
  String? get email => _currentUser.email;
  String? get userId => _currentUser.$id;

  // Constructor
  AuthService() {
    init();
    loadUser();
  }

  // Initialize the Appwrite client
  init() {
    client.setEndpoint(AppWriteConst.APPWRITE_ENDPOINT).setProject(AppWriteConst.APPWRITE_PROJECT_ID).setSelfSigned();
    account = Account(client);
  }

  loadUser() async {
    try {
      final user = await account.get();
      _status = AuthStatus.authenticated;
      _currentUser = user;
    } catch (e) {
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }

  Future<User?> createUser({required String email, required String password}) async {
    notifyListeners();

    try {
      final user = await account.create(userId: ID.unique(), email: email, password: password);
      return user;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message ?? "AuthService.createUser() null message");
      return null;
    }
  }

  createVerification() async {
    notifyListeners();

    try {
      Token result = await account.createVerification(
        url: 'https://help-me-design.sumitpanwar.com/',
      );
      print(result.secret);
      // return result;
    } finally {
      notifyListeners();
    }
  }

  Future<Session?> createEmailSession({required String email, required String password}) async {
    notifyListeners();

    try {
      final session = await account.createEmailSession(email: email, password: password);
      _currentUser = await account.get();
      _status = AuthStatus.authenticated;
      return session;
    } on AppwriteException catch (e) {
      print(e);
      UtilityHelper.toastMessage(message: e.message.toString());
    } finally {
      notifyListeners();
    }
  }

  signInWithProvider({required String provider}) async {
    try {
      final session = await account.createOAuth2Session(provider: provider, success: "https://help-me-design.sumitpanwar.com");
      _currentUser = await account.get();
      _status = AuthStatus.authenticated;
      return session;
    } finally {
      notifyListeners();
    }
  }

  signOut() async {
    try {
      await account.deleteSession(sessionId: 'current');
      _status = AuthStatus.unauthenticated;
    } finally {
      notifyListeners();
    }
  }
}
