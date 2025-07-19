class MainFailures {
  final String? error;
  final Map messages;
  final dynamic dump;

  MainFailures.clientFailure({
    this.error = 'Oops, Something went wrong. please try again later.',
    this.messages = const {},
    this.dump,
  });

  MainFailures.serverFailure({
    this.error = 'Oops, Something went wrong. please try again later.',
    this.messages = const {},
    this.dump,
  });
}
