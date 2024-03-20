
import 'enums.dart';
import 'enums_values_strings.dart';

class StringsToEnums {
  // String to StatusValue
  static StatusValue statusValue(String value) {
    StatusValue converted = StatusValue.Waiting;
    switch (value) {
      case EnumsValuesStrings.ACCEPTED:
        converted = StatusValue.Accepted;
        break;
      case EnumsValuesStrings.REFUSED:
        converted = StatusValue.Refused;
        break;
      case EnumsValuesStrings.WAITING:
        converted = StatusValue.Waiting;
        break;
      default:
        converted = StatusValue.Waiting;
    }
    return converted;
  }

  static ApiResponseStatus apiResponseStatus(String status) {
    ApiResponseStatus response = ApiResponseStatus.SUCCESS;
    switch (status) {
      case EnumsValuesStrings.SUCCESS:
        response = ApiResponseStatus.SUCCESS;
        break;
      case EnumsValuesStrings.FAILURE:
        response = ApiResponseStatus.FAILURE;
        break;
      default:
        response = ApiResponseStatus.FAILURE;
    }
    return response;
  }

  static int apiResponseStatusCode(String status) {
    int response = 200;
    switch (status) {
      case EnumsValuesStrings.SUCCESS:
        response = 200;
        break;
      case EnumsValuesStrings.FAILURE:
        response = 500;
        break;
      default:
        response = 200;
    }
    return response;
  }


}
