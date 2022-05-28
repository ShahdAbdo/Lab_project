class Note{
final int id;
final String title;
final String content;

  Note({required this.id,required this.title,required this.content});

  Map<String,dynamic> toMap(){ 
    return <String,dynamic>{
      "id" : id,
      "title" : title,
      "content" : content,
    };
  }

  static Note fromMap(map){
      return Note(              
        id: map['id'] as int,
        title: map['title'] as String,
        content: map['content']  as String,
      );
  }
    
}
