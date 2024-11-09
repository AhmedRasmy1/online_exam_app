part of 'questions_cubit.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoading extends QuestionsState {}

final class QuestionsSuccess extends QuestionsState {
  final List<QuestionEntity> questions;
  QuestionsSuccess(this.questions);
}

final class QuestionsFail extends QuestionsState {
  final Exception exception;
  QuestionsFail(this.exception);
}

final class QuestionResult extends QuestionsState {
  final List<QuestionEntity> questions;
  final Map<String, dynamic> results;
  QuestionResult(this.questions, this.results);
}
