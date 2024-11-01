part of 'exams_cubit.dart';

@immutable
sealed class ExamsState {}

final class ExamsInitial extends ExamsState {}

final class ExamsLoading extends ExamsState {}

final class ExamsSuccess extends ExamsState {
  final List<ExamsEntity> exams;

  ExamsSuccess(this.exams);
}

final class ExamsFail extends ExamsState {
  final Exception exception;

  ExamsFail(this.exception);
}
