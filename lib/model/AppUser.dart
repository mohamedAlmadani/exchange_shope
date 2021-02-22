enum userType { customer, admin }
class AppUser{
  String userId;
  String Name;
  String Email;
  String Address;
  String PhoneNumber;
  userType type;
  String password;

  AppUser({this.type,this.Name,this.Address,this.Email,this.PhoneNumber,this.password, this.userId,});
  AppUser.fromMap(Map map){
    this.password=map['password'];
    this.PhoneNumber=map['PhoneNumber'];
    this.Email=map['Email'];
    this.Name=map['Name'];
    this.Address=map['Address'];
    this.userId=map['userId'];
    this.type=map['role'] =='admin'?userType.admin:userType.customer;


  }
  toJson(){
    return {
      'password':this.password,
      'PhoneNumber':this.PhoneNumber,
      'Email':this.Email,
      'Name':this.Name,
      'Address':this.Address,
      'userType':this.type.toString(),





    };
  }
}