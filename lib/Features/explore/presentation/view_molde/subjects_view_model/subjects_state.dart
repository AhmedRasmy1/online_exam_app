part of 'subjects_cubit.dart';

@immutable
sealed class SubjectsState {}

final class SubjectsInitial extends SubjectsState {}

final class SubjectsLoading extends SubjectsState {}

final class SubjectsSuccess extends SubjectsState {
  final List<SubjectEntity?>? subjects;

  SubjectsSuccess(this.subjects);
}

final class SubjectsFail extends SubjectsState {
  final Exception? exception;

  SubjectsFail(this.exception);
}
