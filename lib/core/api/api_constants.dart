class ApiConstants {
  static const String baseUrl = "https://exam.elevateegy.com/api/";
  static const String signInUrl = "v1/auth/signin";
  static const String signUpUrl = "v1/auth/signup";
  static const String forgotPassword = "v1/auth/forgotPassword";
  static const String verifyCodeApi = "v1/auth/verifyResetCode";
  static const String resetPassword = "v1/auth/resetPassword";
  static const String changePassword = "v1/auth/changePassword";
  static const String editProfile = "v1/auth/editProfile";
  static const String getAllSubjects = 'v1/subjects';
  static const String getExamById = 'v1/exams?subject=';
  static const String getQuestionById = 'v1/questions?exam=';
}
