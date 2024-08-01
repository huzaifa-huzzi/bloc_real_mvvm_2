


class SessionManager {
  static final SessionManager _session = SessionManager._internal();



  factory SessionManager(){
    return _session;
  }

  SessionManager._internal(){
  }



}