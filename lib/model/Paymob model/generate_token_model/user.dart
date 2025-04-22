class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  DateTime? dateJoined;
  String? email;
  bool? isActive;
  bool? isStaff;
  bool? isSuperuser;
  dynamic lastLogin;
  List<dynamic>? groups;
  List<int>? userPermissions;

  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.dateJoined,
    this.email,
    this.isActive,
    this.isStaff,
    this.isSuperuser,
    this.lastLogin,
    this.groups,
    this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    username: json['username'] as String?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    dateJoined:
        json['date_joined'] == null
            ? null
            : DateTime.parse(json['date_joined'] as String),
    email: json['email'] as String?,
    isActive: json['is_active'] as bool?,
    isStaff: json['is_staff'] as bool?,
    isSuperuser: json['is_superuser'] as bool?,
    lastLogin: json['last_login'] as dynamic,
    groups: json['groups'] as List<dynamic>?,
    userPermissions: json['user_permissions'] as List<int>?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'first_name': firstName,
    'last_name': lastName,
    'date_joined': dateJoined?.toIso8601String(),
    'email': email,
    'is_active': isActive,
    'is_staff': isStaff,
    'is_superuser': isSuperuser,
    'last_login': lastLogin,
    'groups': groups,
    'user_permissions': userPermissions,
  };
}
