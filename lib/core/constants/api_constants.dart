class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.myanimelist.net/v2';
  static const String clientId = 'd5a705a35dec4d55c53ee7463051fc6c';

  static const String animeBaseFields =
      'id,title,main_picture,mean,rank,popularity,num_episodes,status,media_type,start_season,genres';

  static const String animeDetailFields =
      'id,title,main_picture,alternative_titles,start_date,end_date,synopsis,mean,rank,popularity,'
      'num_list_users,num_scoring_users,media_type,status,genres,num_episodes,start_season,'
      'broadcast,source,average_episode_duration,rating,studios,recommendations,background';

  static const int defaultLimit = 20;
  static const int searchLimit = 20;
  static const int rankingLimit = 20;
  static const int seasonalLimit = 20;
}
