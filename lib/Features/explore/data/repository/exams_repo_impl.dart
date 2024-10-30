import 'package:injectable/injectable.dart';
import '../data_sources/exams_data_source.dart';
import '../../domain/entities/exams_entity.dart';
import '../../domain/repositores/exams_repo.dart';
import '../../../../core/common/api_result.dart';

@Injectable(as: ExamsRepo)
class ExamsRepoImpl implements ExamsRepo {
  ExamsDataSource examsDataSource;
  ExamsRepoImpl(this.examsDataSource);
  @override
  Future<Result<List<ExamsEntity>>> getExamById(String id, String token) {
    return examsDataSource.getExamById(id, token);
  }
}
