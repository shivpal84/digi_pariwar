import 'package:digi_pariwar/features/profile/data/profile_model.dart';

import '../../../network/api_client.dart';

abstract class ProfileRepository {
  Future<void> createProfile({
    required ProfileModel profileModel,
  });
}

class ProfileRepositoryImpl implements ProfileRepository {

  final ApiClient apiClient;

  ProfileRepositoryImpl(this.apiClient);

  @override
  Future<void> createProfile({required ProfileModel profileModel}) async {
     await apiClient.put(
      "/users/me",
      data: profileModel,
    );
     return;
  }
}