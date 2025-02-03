import 'package:dio/dio.dart';
import 'package:chondohealth/core/functions/printer.dart';
import 'package:chondohealth/core/functions/snackbar.dart';
import 'package:chondohealth/core/models/view_state_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CBase extends GetxController {
  ViewState viewState = ViewState.initial;
  Object? _exception;
  Object? get exception {
    return _exception;
  }

  setException({
    required Object? error,
    required StackTrace? stackTrace,
    bool showSnackbar = true,
    bool setExceptionOnly = false,
  }) {
    errorPrint("Error =====>: $error");
    _exception = error;
    if (setExceptionOnly == false) {
      viewState = ViewState.error;
      // notifyListeners();
      update();
    }

    if (showSnackbar == true) {
      showSnackBar(errorMsg());
    }
// TODO: Add Sentry here so that we can observe the error analytics //
  }

  String errorMsg() {
    if (exception is DioException) {
      final dioError = exception as DioException;

      if (dioError.type == DioExceptionType.cancel) {
        return "Request to API server was cancelled";
      } else if (dioError.type == DioExceptionType.connectionTimeout) {
        return "Connection timeout with API server";
      } else if (dioError.type == DioExceptionType.connectionError || dioError.type == DioExceptionType.unknown) {
        return "There is no internet connection";
      } else if (dioError.type == DioExceptionType.receiveTimeout || dioError.type == DioExceptionType.sendTimeout) {
        return "Timeout in connection with API server";
      } else if (dioError.type == DioExceptionType.badCertificate) {
        return "Something went wrong! Try again";
      } else {
        return dioError.response?.data['message'] ??
            dioError.response?.data['CustomerErrorMessage'] ??
            dioError.response?.data['Message'] ??
            "Something went wrong! Try again";
      }
    } else {
      return _mapAwsErrorToUserMessage(exception.toString());
    }
  }

// Map specific  error messages to user-friendly messages
  String _mapAwsErrorToUserMessage(String errorMessage) {
    // (Mapping logic remains the same as the previous example)
    if (errorMessage.contains("User does not exist")) {
      return "User not found. Please check your credentials.";
    } else if (errorMessage.contains("User already exists")) {
      return "An account with this phone number already exists.";
    } else if (errorMessage.contains("Invalid OTP") || errorMessage.contains("CodeMismatchException")) {
      return "The OTP you entered is incorrect. Please try again.";
    } else if (errorMessage.contains("ExpiredCodeException")) {
      return "The OTP has expired. Please request a new one.";
    } else if (errorMessage.contains("NotAuthorizedException")) {
      return "You are not authorized to perform this action.";
    } else if (errorMessage.contains("InvalidParameterException")) {
      return "One or more parameters are invalid. Please check and try again.";
    } else if (errorMessage.contains("LimitExceededException")) {
      return "You have exceeded the limit for this action. Please try again later.";
    } else if (errorMessage.contains("TooManyRequestsException")) {
      return "Too many requests made. Please wait a moment and try again.";
    } else if (errorMessage.contains("PasswordResetRequiredException")) {
      return "Password reset is required. Please reset your password to continue.";
    } else if (errorMessage.contains("UserNotConfirmedException")) {
      return "Your account is not confirmed. Please verify your email.";
    } else if (errorMessage.contains("InternalErrorException")) {
      return "An internal error occurred. Please try again later.";
    } else if (errorMessage.contains("ServiceUnavailableException")) {
      return "The service is temporarily unavailable. Please try again later.";
    } else if (errorMessage.contains("ResourceNotFoundException")) {
      return "The requested resource was not found. Please check and try again.";
    } else if (errorMessage.contains("InvalidPasswordException")) {
      return "The password provided is invalid. Please try again.";
    } else if (errorMessage.contains("already exists")) {
      return "An account with this phone number already exists.";
    }
    return errorMessage;
  }
}
