import 'migration_files/migration_messages_detail.dart';
import 'migration_files/migration_messages.dart';
import 'migration_files/migration_users.dart';
import 'base/migration_base.dart';

List<MigrationBase> migrationList = [
  MigrationUsers(),
  MigrationMessages(),
  MigrationMessagesDetail()
];
