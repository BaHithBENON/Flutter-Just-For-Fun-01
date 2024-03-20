// ignore_for_file: constant_identifier_names

enum LoginMethod { Option1, Option2 }

enum AppAuthType { Firebase, MongoDBAtlas }

enum AppThemeMode { Light, Dark }

extension AppThemeModeValue on AppThemeMode {
  String get value {
    switch (this) {
      case AppThemeMode.Dark:
        return 'dark';
      case AppThemeMode.Light:
        return 'light';
      default:
        return 'dark';
    }
  }
}

enum ReturnStatus { Failure, Success, Nothing }

enum ApiResponseStatus { SUCCESS, FAILURE }

enum ResponseStatus { SUCCESS, FAILURE, WAITING }

enum StatusValue { Accepted, Refused, Waiting }

enum CollectionType { Users }


extension StatusValueStrings on StatusValue {
  String get title {
    switch (this) {
      case StatusValue.Accepted:
        return 'Accepted';
      case StatusValue.Refused:
        return 'Refused';
      case StatusValue.Waiting:
        return 'Waiting';
      default:
        throw UnimplementedError('Unhandled status value');
    }
  }
}

extension ApiResponseStatusManagement on ApiResponseStatus { 
  String get title {
    switch (this) {
      case ApiResponseStatus.FAILURE:
        return 'Failure';
      case ApiResponseStatus.SUCCESS:
        return 'Success';
      default: 
        return 'Failure';
    }
  }
}

extension ResponseStatusManagement on ResponseStatus { 
  String get title {
    switch (this) {
      case ResponseStatus.FAILURE:
        return 'FAILURE';
      case ResponseStatus.SUCCESS:
        return 'SUCCESS';
      case ResponseStatus.WAITING:
        return 'WAITING';
      default: 
        return 'FAILURE';
    }
  }
}