import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:splasher_flutter/actions/actions.dart';
import 'package:splasher_flutter/middlewares/middleware.dart';
import 'package:splasher_flutter/models/app_state.dart';
import 'package:splasher_flutter/models/photo.dart';
import 'package:splasher_flutter/reducers/app_reducer.dart';
import 'package:splasher_flutter/repository/photo_repository.dart';
import 'package:splasher_flutter/selectors/selector.dart';

class MockRepository extends Mock implements PhotoRepository {}

main() {
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
  test('photo loaded test', () {
    final mockPhotos = Photo.fromJsonList(mockPhotoListJson);
    final repository = MockRepository();
    final Store<AppState> store =
        Store(appReducers, middleware: appMiddleware(repository));

    store.dispatch(PhotoLoadedAction(mockPhotos));
    expect(photosSelector(store.state), mockPhotos);
  });
}
