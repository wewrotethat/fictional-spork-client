abstract class AuthCheckState {}

class AuthCheckInitialState extends AuthCheckState {}

class AuthCheckInProgressState extends AuthCheckState {}

class AuthCheckCompletedState extends AuthCheckState {
  AuthCheckCompletedState({
    required this.loggedIn,
  });
  final bool loggedIn;
}

class AuthCheckFailedState extends AuthCheckState {}
