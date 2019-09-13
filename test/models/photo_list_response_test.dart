import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:splasher_flutter/models/photo.dart';

main() {
  final String mockPhotoJson = '''{
        "id": "JgR4BdovzuE",
        "created_at": "2019-09-12T11:33:41-04:00",
        "updated_at": "2019-09-12T14:03:13-04:00",
        "width": 3712,
        "height": 5568,
        "color": "#251D15",
        "description": "Leaves of date trees on the sunset of a windy day in the last days of summer.",
        "alt_description": null,
        "urls": {
            "raw": "https://images.unsplash.com/photo-1568302388632-363e230215d2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjMyMTI3fQ",
            "full": "https://images.unsplash.com/photo-1568302388632-363e230215d2?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjMyMTI3fQ",
            "regular": "https://images.unsplash.com/photo-1568302388632-363e230215d2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjMyMTI3fQ",
            "small": "https://images.unsplash.com/photo-1568302388632-363e230215d2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjMyMTI3fQ",
            "thumb": "https://images.unsplash.com/photo-1568302388632-363e230215d2?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMyMTI3fQ"
        },
        "links": {
            "self": "https://api.unsplash.com/photos/JgR4BdovzuE",
            "html": "https://unsplash.com/photos/JgR4BdovzuE",
            "download": "https://unsplash.com/photos/JgR4BdovzuE/download",
            "download_location": "https://api.unsplash.com/photos/JgR4BdovzuE/download"
        },
        "categories": [],
        "likes": 51,
        "liked_by_user": false,
        "current_user_collections": [],
        "user": {
            "id": "K1oDPIcihV8",
            "updated_at": "2019-09-12T14:39:01-04:00",
            "username": "ashkfor121",
            "name": "Ashkan Forouzani",
            "first_name": "Ashkan",
            "last_name": "Forouzani",
            "twitter_username": null,
            "portfolio_url": null,
            "bio": "Capturing the beauty and stories of this world. ",
            "location": "Iran",
            "links": {
                "self": "https://api.unsplash.com/users/ashkfor121",
                "html": "https://unsplash.com/@ashkfor121",
                "photos": "https://api.unsplash.com/users/ashkfor121/photos",
                "likes": "https://api.unsplash.com/users/ashkfor121/likes",
                "portfolio": "https://api.unsplash.com/users/ashkfor121/portfolio",
                "following": "https://api.unsplash.com/users/ashkfor121/following",
                "followers": "https://api.unsplash.com/users/ashkfor121/followers"
            },
            "profile_image": {
                "small": "https://images.unsplash.com/profile-1544979181928-fc70236572f4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                "medium": "https://images.unsplash.com/profile-1544979181928-fc70236572f4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                "large": "https://images.unsplash.com/profile-1544979181928-fc70236572f4?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
            },
            "instagram_username": null,
            "total_collections": 4,
            "total_likes": 6021,
            "total_photos": 410,
            "accepted_tos": true
        }
    }''';
  final String mockPhotoListJson = '''[
    {
  "id": "LBI7cgq3pbM",
  "created_at": "2016-05-03T11:00:28-04:00",
  "updated_at": "2016-07-10T11:00:01-05:00",
  "width": 5245,
  "height": 3497,
  "color": "#60544D",
  "likes": 12,
  "liked_by_user": false,
  "description": "A man drinking a coffee.",
  "user": {
    "id": "pXhwzz1JtQU",
    "username": "poorkane",
    "name": "Gilbert Kane",
    "portfolio_url": "https://theylooklikeeggsorsomething.com/",
    "bio": "XO",
    "location": "Way out there",
    "total_likes": 5,
    "total_photos": 74,
    "total_collections": 52,
    "instagram_username": "instantgrammer",
    "twitter_username": "crew",
    "profile_image": {
      "small": "https://images.unsplash.com/face-springmorning.jpg?q=80&fm=jpg&crop=faces&fit=crop&h=32&w=32",
      "medium": "https://images.unsplash.com/face-springmorning.jpg?q=80&fm=jpg&crop=faces&fit=crop&h=64&w=64",
      "large": "https://images.unsplash.com/face-springmorning.jpg?q=80&fm=jpg&crop=faces&fit=crop&h=128&w=128"
    },
    "links": {
      "self": "https://api.unsplash.com/users/poorkane",
      "html": "https://unsplash.com/poorkane",
      "photos": "https://api.unsplash.com/users/poorkane/photos",
      "likes": "https://api.unsplash.com/users/poorkane/likes",
      "portfolio": "https://api.unsplash.com/users/poorkane/portfolio"
    }
  },
  "current_user_collections": [
    {
      "id": 206,
      "title": "Makers: Cat and Ben",
      "published_at": "2016-01-12T18:16:09-05:00",
      "updated_at": "2016-07-10T11:00:01-05:00",
      "curated": false,
      "cover_photo": null,
      "user": null
    }
  ],
  "urls": {
    "raw": "https://images.unsplash.com/face-springmorning.jpg",
    "full": "https://images.unsplash.com/face-springmorning.jpg?q=75&fm=jpg",
    "regular": "https://images.unsplash.com/face-springmorning.jpg?q=75&fm=jpg&w=1080&fit=max",
    "small": "https://images.unsplash.com/face-springmorning.jpg?q=75&fm=jpg&w=400&fit=max",
    "thumb": "https://images.unsplash.com/face-springmorning.jpg?q=75&fm=jpg&w=200&fit=max"
  },
  "links": {
    "self": "https://api.unsplash.com/photos/LBI7cgq3pbM",
    "html": "https://unsplash.com/photos/LBI7cgq3pbM",
    "download": "https://unsplash.com/photos/LBI7cgq3pbM/download",
    "download_location": "https://api.unsplash.com/photos/LBI7cgq3pbM/download"
  }
}]''';

  test("photo reponse parse test", () {
    final Photo response = Photo.fromJsonObj(mockPhotoJson);
    expect(response, isNotNull);
    expect(response.id, "JgR4BdovzuE");
    expect(response.user.name, "Ashkan Forouzani");
  });

  test("photo list response parse test", () {
    final BuiltList<Photo> responseList = Photo.fromJsonList(mockPhotoListJson);
    expect(responseList, isNotNull);
    expect(responseList, isInstanceOf<BuiltList<Photo>>());
    expect(responseList.length, 1);
    expect(responseList[0].id, 'LBI7cgq3pbM');
    expect(responseList[0].user.name, 'Gilbert Kane');
  });
}
