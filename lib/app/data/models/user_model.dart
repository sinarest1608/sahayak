// ignore_for_file: unnecessary_this

class UserModel {
  // "name": googleUser.displayName,
  //       "email": googleUser.email,
  //       "uid": value.user!.uid,
  //       "imgUrl": value.user!.photoURL,
  //       "phoneNumber": "",

  String? name;
  String? email;
  String? uid;
  String? imgUrl;
  String? phoneNumber;
  UserModel({
    this.name,
    this.email,
    this.uid,
    this.imgUrl,
    this.phoneNumber,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    this.name = json["name"] ?? "Default";
    this.email = json["email"] ?? "default@defualt.com";
    this.uid = json["uid"] ?? "uuidMAX";
    this.imgUrl = json["imgUrl"] ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnt6tobvCrkmXN8-jE1h3flEx9wCXkdf0Xsg&usqp=CAU";
    this.phoneNumber = json["phoneNumber"] ?? "+19999999999";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name ?? "Default";
    data["email"] = this.email ?? "default@defualt.com";
    data["uid"] = this.uid ?? "uuidMAX";
    data["imgUrl"] = this.imgUrl ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnt6tobvCrkmXN8-jE1h3flEx9wCXkdf0Xsg&usqp=CAU";
    data["phoneNumber"] = this.phoneNumber ?? "19999999999";
    return data;
  }
}
