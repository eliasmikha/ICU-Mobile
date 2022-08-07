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
  static String branchListApi(int id) => 'api/branch/user/$id'; // get
  static const ADD_BRANCH_API = 'api/branch/add'; // post

  // @ Camera
  static const CAMERAS_LIST_API = 'api/cam/getAll'; // get
  static const ADD_CAMERA_API = 'api/cam/add'; // post

  // @ Department
  static const ADD_DEPARTMENT_API = 'api/department/add'; // post

  // @ Person
  static const ADD_PERSON_API = 'api/person/add'; // post
  static String personsListApi(int id) => 'api/person/user/$id'; // get

  // @ Room
  static const ADD_ROOM_API = 'api/room/add'; // post
}
