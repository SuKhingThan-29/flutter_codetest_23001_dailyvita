class Health{
  final int id;
  final String name;
   bool isClick;
  Health({required this.id,required this.name,required this.isClick});

  Health.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        isClick=false;

}