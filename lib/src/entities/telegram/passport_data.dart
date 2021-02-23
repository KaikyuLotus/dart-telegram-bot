class PassportData {
  PassportData();

  factory PassportData.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PassportData();
  }
}
