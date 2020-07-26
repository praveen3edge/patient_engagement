

class ArticlesApiResponse{

  String status;
  List<ArticlesModel> articles;

  ArticlesApiResponse({this.status,this.articles});

  factory ArticlesApiResponse.fromJson(var data){
    return ArticlesApiResponse(
      status: data["status"]??"error",
      articles: data["data"] != null?List.generate(data["data"].length, (index) => ArticlesModel.fromJson(data["data"][index])):[]
    );
  }

}


class ArticlesModel {
  int articleId;
  String articleName;
  String articleContent;
  String articleDescription;
  int articleDatePublished;
  String articleAuthor;
  int category;
  String articleImage;

  ArticlesModel(
      {this.articleId,
      this.articleName,
      this.articleContent,
      this.articleDescription,
      this.articleDatePublished,
      this.articleAuthor,
      this.category,this.articleImage});

  factory ArticlesModel.fromJson(var data) {
    return ArticlesModel(
        articleId: data["articleId"] ?? null,
        articleName: data["articleName"]??"-",
        articleContent: data["articleContent"]??"-",
        articleDescription: data["articleDescription"]??"-",
        articleAuthor: data["articleAuthor"]??"-",
        articleDatePublished: data["articleDatePublished"]??0,
        category: data["category"]??-1,
        articleImage:data["articleImage"]??"none.jpg"
    );
  }
}



class VideosApiResponse{

  String status;
  List<VideoModel> articles;

  VideosApiResponse({this.status,this.articles});

  factory VideosApiResponse.fromJson(var data){
    return VideosApiResponse(
        status: data["status"]??"error",
        articles: data["data"] != null?List.generate(data["data"].length, (index) => VideoModel.fromJson(data["data"][index])):[]
    );
  }
}


class VideoModel {
  int videoId;
  String videoName;
  String videoContent;
  String videoDescription;
  int videoDatePublished;
  String videoAuthor;
  int category;
  String videoImage;

  VideoModel(
      {this.videoId,
        this.videoName,
        this.videoContent,
        this.videoDescription,
        this.videoDatePublished,
        this.videoAuthor,
        this.category,this.videoImage});

  factory VideoModel.fromJson(var data) {
    return VideoModel(
        videoId: data["videoId"] ?? null,
        videoName: data["videoName"]??"-",
        videoContent: data["videoContent"]??"-",
        videoDescription: data["videoDescription"]??"-",
        videoAuthor: data["videoAuthor"]??"-",
        videoDatePublished: data["videoDatePublished"]??0,
        category: data["category"]??-1,
        videoImage:data["videoImage"]??"none.jpg"
    );
  }
}

