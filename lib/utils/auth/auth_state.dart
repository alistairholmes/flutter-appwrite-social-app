import 'package:flutter/widgets.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_appwrite_demo/data/models/user.dart';
import 'package:flutter_appwrite_demo/utils/prefs/prefs.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account account;
  Storage storage;
  Prefs _prefs;
  bool _isLoggedIn;
  User _user;

  Prefs get prefs => _prefs;
  bool get isLoggedIn => _isLoggedIn;
  User get user => _user;

  AuthState() {
    _init();
  }

  _init() {
    account = Account(client);
    storage = Storage(client);
    _isLoggedIn = false;
    _user = null;

    client
        .setEndpoint('http://192.168.1.103:4003/v1')
        .setProject('5f71b0a937fe4');
    //_checkIsLoggedIn();
    _getUserPrefs();
  }

  _checkIsLoggedIn() async {
    try {
      _user = await _getAccount();
      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      print(e.message);
    }
  }

  createAccount(String email, String password) async {
    try {
      var result = await account.create(email: email, password: password);
      print(result);
    } catch (error) {
      print(error.message);
    }
  }

  Future _getUserPrefs() async {
    try {
      Response<dynamic> res = await account.getPrefs();
      if (res.statusCode == 200) {
        _prefs = Prefs.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  Future updatePrefs(Map<String, dynamic> prefs) async {
    try {
      Response<dynamic> res = await account.updatePrefs(prefs: prefs);
      if (res.statusCode == 200) {
        _prefs = Prefs.fromJson(res.data);
        notifyListeners();
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<User> _getAccount() async {
    try {
      Response<dynamic> res = await account.get();
      if (res.statusCode == 200) {
        return User.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      throw e;
    }
  }

  login(String email, String password) async {
    try {
      var result =
          await account.createSession(email: email, password: password);
      print(result);
    } catch (error) {
      print(error.message);
    }
  }
}
