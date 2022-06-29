class Status {
  int? totalresult;
  String? status;
  List<dynamic>? article;

  Status({this.totalresult, this.status, this.article});

  Status NewsFactory(Map map) {
    return Status(
        article: map['articles'].map((e)=> Article().articleFactory(e)).toList(),
        totalresult: map['totalResults'],
        status: map['status']);
  }
}

class Article {
  Source? source;
  String? author, title, description, url, urltoimage, publishedAt, content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urltoimage,
      this.publishedAt,
      this.content});

  Article articleFactory(Map map) {
    return Article(
      source: Source().sourceFactory(map['source']),
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urltoimage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }
}

class Source {
  String? id, name;

  Source({this.id, this.name});

  Source sourceFactory(Map map) {
    return Source(id: map['id'], name: map['name']);
  }
}
