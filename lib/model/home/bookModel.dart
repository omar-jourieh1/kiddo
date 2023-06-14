
class BookModel {
  String? id, title, subtitle, description, thumbnail, bookUrl;

  BookModel({this.id, this.title, this.subtitle, this.description, this.thumbnail, this.bookUrl});

  factory BookModel.fromJson(Map<String, dynamic> data) {

    String getThumbnailSafety(Map<String, dynamic> data) {
      final imageLinks = data['volumeInfo']['imageLinks'];
      if (imageLinks != null && imageLinks['thumbnail'] != null) {
        return imageLinks['thumbnail'];
      } else {
        return 'https://www.unfe.org/wp-content/uploads/2019/04/SM-placeholder.png';
      }
    }

    return BookModel(
        id: data['id'],
        title: data['volumeInfo']['title'],
        description: data['volumeInfo']['description'],
        subtitle: data['volumeInfo']['subtitle'],
        thumbnail: getThumbnailSafety(data).replaceAll("http", "https"),
        bookUrl: data['volumeInfo']['previewLink']);
  }
}