const String tblColId = 'id';
const String tblColName = 'name';
const String tblColImage = 'image';
const String tblColBudget = 'budget';
const String tblColDes = 'description';
const String tblColType = 'type';
const String tblColRelease= 'release_date';
const String tblColRating = 'rating';
const String tblColFavorite = 'favorite';

class MovieModel{
  int? id;
  String name;
  String image;
  String description;
  int budget;
  String type;
  String release_date;
  double rating;
  bool favorite;

  MovieModel(
      {
        this.id,
        required this.name,
        required this.image,
        required this.description,
        required this.budget,
        required this.type,
        required this.release_date,
        required this.rating,
        this.favorite=false
      });
  Map<String,dynamic> toMap(){
    final map = <String,dynamic>{
      tblColName:name,
      tblColDes:description,
      tblColImage: image,
      tblColBudget: budget,
      tblColType: type,
      tblColRelease:release_date,
      tblColRating:rating,
      tblColFavorite:favorite?1:0
    };
    if(id!=null){
      map[tblColId]=id;
    }
    return map;
  }

  factory MovieModel.fromMap(Map<String,dynamic> map)=>
      MovieModel(
        id: map[tblColId],
          name: map[tblColName],
      image: map[tblColImage],
      description: map[tblColDes],
      budget: map[tblColBudget],
      type: map[tblColType],
      release_date: map[tblColRelease],
      favorite: map[tblColFavorite]==1?true:false,
      rating: map[tblColRating]);

@override
String toString() {
  return 'MovieModel{id: $id, name: $name, image: $image, description: $description, budget: $budget, type: $type, release_date: $release_date, rating: $rating, favorite: $favorite}';
}
}

