import 'package:injectable/injectable.dart';
import 'package:online_exam_app/Features/Auth/domain/common/api_result.dart';
import 'package:online_exam_app/Features/profile/domain/entities/edit_profile_entity.dart';
import 'package:online_exam_app/Features/profile/domain/repositories/profile_repo.dart';

@injectable
class EditProfileUseCase {
  ProfileRepo profileRepo;

  EditProfileUseCase(this.profileRepo);

  Future<Result<EditProfileEntity?>> editProfile(
      {required String username,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String token}) {
    return profileRepo.editProfile(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        token: token);
  }
}
