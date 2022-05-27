import 'package:drift/drift.dart';
import 'package:newstragram/models/db/database.dart';

part 'dao.g.dart';

@DriftAccessor(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin{

}
