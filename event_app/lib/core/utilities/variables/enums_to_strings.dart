import 'enums.dart';
import 'enums_values_strings.dart';

class EnumsToStrings {
  // StatusValue to String
  static String statusValue(StatusValue value) {
    String converted = EnumsValuesStrings.WAITING;
    switch (value) {
      case StatusValue.Accepted:
        converted = EnumsValuesStrings.ACCEPTED;
        break;
      case StatusValue.Refused:
        converted = EnumsValuesStrings.REFUSED;
        break;
      case StatusValue.Waiting:
        converted = EnumsValuesStrings.WAITING;
        break;
      default:
        converted = EnumsValuesStrings.WAITING;
    }
    return converted;
  }

  static String apiResponseStatus(ApiResponseStatus status) {
    String response = "";
    switch (status) {
      case ApiResponseStatus.SUCCESS:
        response = EnumsValuesStrings.SUCCESS;
        break;
      case ApiResponseStatus.FAILURE:
        response = EnumsValuesStrings.FAILURE;
        break;
      default:
        response = EnumsValuesStrings.FAILURE;
    }
    return response;
  }


  String enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last.toUpperCase();
  }


}
