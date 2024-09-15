abstract class TransactionsScreenState {}

class TransactionsScreenInitState extends TransactionsScreenState {}

class TransactionsScreenReadTotalPaidState extends TransactionsScreenState {}

class TransactionsScreenReadTotalReceivedState
    extends TransactionsScreenState {}

// * Read

class TransactionsScreenReadSendState extends TransactionsScreenState {}

class TransactionsScreenReadReceiveState extends TransactionsScreenState {}

class TransactionsScreenInsertState extends TransactionsScreenState {}

class TransactionsScreenDeleteState extends TransactionsScreenState {}

class TransactionsScreenUpdateState extends TransactionsScreenState {}

class TransactionsScreenToggleTransactionTypeState
    extends TransactionsScreenState {}
