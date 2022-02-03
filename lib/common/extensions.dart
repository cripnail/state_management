enum AppStatus { success, loading, error, empty }

extension StateMessage on AppStatus {
  String message() {
    if (this == AppStatus.error) {
      return "Ops! Something went wrong...";
    }
    return "";
  }
}

extension Format on double {
  String real() {
    return "R\$ ${toStringAsFixed(2)}".replaceAll(".", ",");
  }
}
