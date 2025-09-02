abstract class ApiPath{
  static const baseUrl = 'https://nestloop-dev-629dac1c40f8.herokuapp.com';

  ///Auth
  static const signUp = '$baseUrl/api/auth/register';
  static const login = '$baseUrl/api/auth/login';
  static const googleAuth = '$baseUrl/api/auth/google/auth';
  static const appleLogin = '$baseUrl/api/auth/apple';
  static const verifyEmail = '$baseUrl/api/auth/verify-email';
  static const resendVerificationEmail = '$baseUrl/api/auth/resend-verification';
  static const forgotPassword = '$baseUrl/api/auth/forgot-password';
  static const resendResetPasswordCode = '$baseUrl/api/auth/reset-password';
  static const resetPassword = '$baseUrl/api/auth/forgot-password';

  ///Child Profile APIs
  static const postChildProfile = '$baseUrl/api/child-profile/single';
  static const putChildProfile = '$baseUrl/api/child-profile/update';
  static const deleteChildProfile = '$baseUrl/api/child-profile/delete';
  static const getChildProfiles = '$baseUrl/api/child-profile';
  static const getSingleChildProfile = '$baseUrl/api/child-profile/single';
  static const getChildCareProviders = '$baseUrl/api/child-profile/care-providers';

  ///Child Profile Docs
  static const postChildDocs = '$baseUrl/api/child-profile/documents';
  static const getChildDocs = '$baseUrl/api/child-profile/documents';
  static const deleteChildDocs = '$baseUrl/api/child-profile/documents/delete';

  ///Carer APIs
  static const postCarerInvite = '$baseUrl/api/care-provider-invitations';
  static const getCarers = '$baseUrl/api/care-providers/list';

  ///User APIs
  static const getUserInfo = '$baseUrl/api/users/me';
  static const deleteUserInfo = '$baseUrl/api/users/me';

  ///Task APIs
  static const createTasks = '$baseUrl/api/tasks';
  static const getTasks = '$baseUrl/api/tasks';
  static const getSpecificTask = '$baseUrl/api/tasks/single';
  static const updateTasks = '$baseUrl/api/tasks/update';
  static const markTaskComplete = '$baseUrl/api/tasks/complete';
  static const deleteTask = '$baseUrl/api/tasks/delete';
  static const cancelTask = '$baseUrl/api/tasks/cancel';
}