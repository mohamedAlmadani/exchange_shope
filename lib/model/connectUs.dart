
class connectUs{
  String Email;
  String phoneNumber;
  String addressComplaint;
  String Content;
  connectUs({this.Email,this.addressComplaint,this.Content,this.phoneNumber});
  connectUs.fromMap(Map map){
    this.phoneNumber=map['phoneNumber'];
    this.Content=map['Content'];
    this.addressComplaint=map['addressComplaint'];
    this.Email=map['Email'];

  }
  toJson(){
    return {
      'phoneNumber':this.phoneNumber,
      'Content':this.Content,
      'addressComplaint':this.addressComplaint,
      'Email':this.Email,

    };
  }
}
