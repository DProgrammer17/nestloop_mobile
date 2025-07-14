import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';

class HomeModel {
  final bool isLoading;
  final GetUserProfileResponse? userResponse;

  const HomeModel({
    this.isLoading = false,
    this.userResponse,
});

  HomeModel copyWith({
    bool? isLoading,
    GetUserProfileResponse? Function()? userResponse,
}){
    return HomeModel(
      isLoading: isLoading ?? this.isLoading,
      userResponse: userResponse != null ? userResponse() : this.userResponse,
    );
  }
}