class EmployeeDbModel {
  EmployeeDbModel({
    required this.id,
   this.name, this.username, this.email, this.phone,
    this.profile_image,this.address,this.latitude,this.longitude,this.company_name,this.bs,
    this.catchPhrase,this.website
  });

  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? profile_image;
  String? address;
  String? latitude;
  String? longitude;
  String? company_name;
  String? catchPhrase;
  String? bs;
  String? website;

  factory EmployeeDbModel.fromJson(Map<String, dynamic> json) => EmployeeDbModel(
    id: json["id"],
      name:json['name'],
      username:json['username'],
      email:json['email'] ,
      phone:json['phone'] ,
      profile_image:json['profile_image'] ,
      address:json['address'] ,
      latitude:json['latitude'] ,
      longitude:json['longitude'] ,
      company_name:json['company_name'] ,
      catchPhrase:json['catchPhrase'] ,
      bs:json['bs'] ,
      website:json['website'] ,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'phone': phone,
    'profile_image': profile_image,
    'address': address,
    'latitude': latitude,
    'longitude': longitude,
    'company_name': company_name,
    'catchPhrase': catchPhrase,
    'bs': bs,
    'website': website,
  };
}