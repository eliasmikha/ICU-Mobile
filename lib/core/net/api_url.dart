/// API
class APIUrls {
  APIUrls._();

  /// Domain url
  static const BASE_URL = "https://auth-icu.herokuapp.com/";

  /// Urls

  // @ Account
  static const LOGIN_API = "api/auth/login"; // post
  static const REGISTER_API = 'registration/register'; // post

  // @ Branch
  static String branchListApi(int id) => 'api/branch/user/$id';

  // @ Camera
  static const CAMERAS_LIST_API = 'api/cam/getAll';

  // @ Person
  static const ADD_PERSON_API = 'api/person/add';
  static String personsListApi(int id) => 'api/person/user/$id';
}
