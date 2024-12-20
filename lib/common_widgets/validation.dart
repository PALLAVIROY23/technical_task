

class Validation{

  static Function passwordValidator() {
    return (String? value) {
      RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (value == null || value.isEmpty) {
        return "Password is required";
      } else if (value.length < 8) {
        return "Password must be more than 7 characters";
      } else if (!regex.hasMatch(value)) {
        return "Password should contain upper, lower, digit, and special character";
      }
      return null;
    };
  }

  static Function validateUserName() {
    return (String? value) {
      RegExp regex = RegExp(r'^[a-zA-Z]');

      if (value == null || value.isEmpty) {
        return "Name is required";
      } else if (value.length < 3) {
        return "Name must be more than 2 characters";
      } else if (!regex.hasMatch(value)) {
        return "Name should only contain letters";
      }

      return null;
    };
  }

  static Function phoneValidator() {
    return (String? value) {
      RegExp regex = RegExp(r'^[0-9]{10}$'); // Assuming a 10-digit phone number format

      if (value == null || value.isEmpty) {
        return "Phone number is required";
      } else if (!regex.hasMatch(value)) {
        return "Invalid phone number format";
      }

      return null;
    };
  }

  static Function emailValidator() {
    return (String? value) {
      RegExp regex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Basic email format

      if (value == null || value.isEmpty) {
        return "Email is required";
      } else if (!regex.hasMatch(value)) {
        return "Invalid email format";
      }

      return null;
    };
  }

}