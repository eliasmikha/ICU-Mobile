import 'package:starter_application/core/common/local_storage.dart';
import 'package:starter_application/features/account/data/model/response/login_model.dart';
import 'package:starter_application/features/account/domain/entity/login_entity.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';

class ProfileNotifier extends ScreenNotifier {
  /// Constructors
  // ProfileScreenNotifier();

  /// Fields
  // late BuildContext context;
  AccountEntity? profile;

  /// Getters and Setters

  /// Methods
  Future<void> setProfileInfo({AccountEntity? profile}) async {
    if (profile == null && LocalStorage.hasToken) {
      this.profile = LocalStorage.profile?.toEntity();
    } else {
      this.profile = profile;
      await LocalStorage.presistProfile(
        AccountModel(
          id: profile?.id,
          name: profile?.name,
          imageUrl: profile?.imageUrl,
          dob: profile?.dob,
          email: profile?.email,
          gender: profile?.gender,
          phonenumber: profile?.phonenumber,
        ),
      );
      print(LocalStorage.profile?.toJson());
    }
  }

  @override
  void closeNotifier() {
    this.dispose();
  }
}
