enum TestStatus {
  resultReady,
  queued,
  pending,
}

String getTestStatusName(TestStatus testStatus) {
  switch (testStatus) {
    case TestStatus.pending:
      return 'Pending';
    case TestStatus.queued:
      return 'Queued';
    case TestStatus.resultReady:
      return 'Result Ready';
    default:
      return 'Unknown';
  }
}
