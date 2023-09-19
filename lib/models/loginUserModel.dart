class LoginUser {
  final String empCode;
  final String empName;

  const LoginUser({
    required this.empCode,
    required this.empName,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(empCode: json['CD_EMP'], empName: json['NM_USER']);
  }

  Map<String, dynamic> toJson() => {
        'empCode': empCode,
        'empName': empName,
      };
}
