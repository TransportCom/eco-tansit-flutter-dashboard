class Customer {
  int? id;
  String? lastActive;
  String? email;
  String? password;
  String? name;
  String? lastname;
  bool? verified;
  String? loginStamp;
  String? role;
  String? tel;

  Customer({
    this.id,
    this.lastActive,
    this.email,
    this.password,
    this.name,
    this.lastname,
    this.verified,
    this.loginStamp,
    this.role,
    this.tel,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastActive = json['lastActive'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    lastname = json['lastname'];
    verified = json['verified'];
    loginStamp = json['loginStamp'];
    role = json['role'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lastActive'] = lastActive;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['lastname'] = lastname;
    data['verified'] = verified;
    data['loginStamp'] = loginStamp;
    data['role'] = role;
    data['tel'] = tel;
    return data;
  }
}
