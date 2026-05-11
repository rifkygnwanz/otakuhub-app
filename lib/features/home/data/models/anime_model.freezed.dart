// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnimeListResponse _$AnimeListResponseFromJson(Map<String, dynamic> json) {
  return _AnimeListResponse.fromJson(json);
}

/// @nodoc
mixin _$AnimeListResponse {
  List<AnimeDataNode> get data => throw _privateConstructorUsedError;
  AnimeListPaging? get paging => throw _privateConstructorUsedError;

  /// Serializes this AnimeListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeListResponseCopyWith<AnimeListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeListResponseCopyWith<$Res> {
  factory $AnimeListResponseCopyWith(
    AnimeListResponse value,
    $Res Function(AnimeListResponse) then,
  ) = _$AnimeListResponseCopyWithImpl<$Res, AnimeListResponse>;
  @useResult
  $Res call({List<AnimeDataNode> data, AnimeListPaging? paging});

  $AnimeListPagingCopyWith<$Res>? get paging;
}

/// @nodoc
class _$AnimeListResponseCopyWithImpl<$Res, $Val extends AnimeListResponse>
    implements $AnimeListResponseCopyWith<$Res> {
  _$AnimeListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? paging = freezed}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<AnimeDataNode>,
            paging: freezed == paging
                ? _value.paging
                : paging // ignore: cast_nullable_to_non_nullable
                      as AnimeListPaging?,
          )
          as $Val,
    );
  }

  /// Create a copy of AnimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeListPagingCopyWith<$Res>? get paging {
    if (_value.paging == null) {
      return null;
    }

    return $AnimeListPagingCopyWith<$Res>(_value.paging!, (value) {
      return _then(_value.copyWith(paging: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimeListResponseImplCopyWith<$Res>
    implements $AnimeListResponseCopyWith<$Res> {
  factory _$$AnimeListResponseImplCopyWith(
    _$AnimeListResponseImpl value,
    $Res Function(_$AnimeListResponseImpl) then,
  ) = __$$AnimeListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AnimeDataNode> data, AnimeListPaging? paging});

  @override
  $AnimeListPagingCopyWith<$Res>? get paging;
}

/// @nodoc
class __$$AnimeListResponseImplCopyWithImpl<$Res>
    extends _$AnimeListResponseCopyWithImpl<$Res, _$AnimeListResponseImpl>
    implements _$$AnimeListResponseImplCopyWith<$Res> {
  __$$AnimeListResponseImplCopyWithImpl(
    _$AnimeListResponseImpl _value,
    $Res Function(_$AnimeListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? paging = freezed}) {
    return _then(
      _$AnimeListResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<AnimeDataNode>,
        paging: freezed == paging
            ? _value.paging
            : paging // ignore: cast_nullable_to_non_nullable
                  as AnimeListPaging?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeListResponseImpl implements _AnimeListResponse {
  const _$AnimeListResponseImpl({
    required final List<AnimeDataNode> data,
    this.paging,
  }) : _data = data;

  factory _$AnimeListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeListResponseImplFromJson(json);

  final List<AnimeDataNode> _data;
  @override
  List<AnimeDataNode> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final AnimeListPaging? paging;

  @override
  String toString() {
    return 'AnimeListResponse(data: $data, paging: $paging)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.paging, paging) || other.paging == paging));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    paging,
  );

  /// Create a copy of AnimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeListResponseImplCopyWith<_$AnimeListResponseImpl> get copyWith =>
      __$$AnimeListResponseImplCopyWithImpl<_$AnimeListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeListResponseImplToJson(this);
  }
}

abstract class _AnimeListResponse implements AnimeListResponse {
  const factory _AnimeListResponse({
    required final List<AnimeDataNode> data,
    final AnimeListPaging? paging,
  }) = _$AnimeListResponseImpl;

  factory _AnimeListResponse.fromJson(Map<String, dynamic> json) =
      _$AnimeListResponseImpl.fromJson;

  @override
  List<AnimeDataNode> get data;
  @override
  AnimeListPaging? get paging;

  /// Create a copy of AnimeListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeListResponseImplCopyWith<_$AnimeListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeDataNode _$AnimeDataNodeFromJson(Map<String, dynamic> json) {
  return _AnimeDataNode.fromJson(json);
}

/// @nodoc
mixin _$AnimeDataNode {
  AnimeModel get node => throw _privateConstructorUsedError;
  AnimeRanking? get ranking => throw _privateConstructorUsedError;

  /// Serializes this AnimeDataNode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeDataNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeDataNodeCopyWith<AnimeDataNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeDataNodeCopyWith<$Res> {
  factory $AnimeDataNodeCopyWith(
    AnimeDataNode value,
    $Res Function(AnimeDataNode) then,
  ) = _$AnimeDataNodeCopyWithImpl<$Res, AnimeDataNode>;
  @useResult
  $Res call({AnimeModel node, AnimeRanking? ranking});

  $AnimeModelCopyWith<$Res> get node;
  $AnimeRankingCopyWith<$Res>? get ranking;
}

/// @nodoc
class _$AnimeDataNodeCopyWithImpl<$Res, $Val extends AnimeDataNode>
    implements $AnimeDataNodeCopyWith<$Res> {
  _$AnimeDataNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeDataNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? node = null, Object? ranking = freezed}) {
    return _then(
      _value.copyWith(
            node: null == node
                ? _value.node
                : node // ignore: cast_nullable_to_non_nullable
                      as AnimeModel,
            ranking: freezed == ranking
                ? _value.ranking
                : ranking // ignore: cast_nullable_to_non_nullable
                      as AnimeRanking?,
          )
          as $Val,
    );
  }

  /// Create a copy of AnimeDataNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeModelCopyWith<$Res> get node {
    return $AnimeModelCopyWith<$Res>(_value.node, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }

  /// Create a copy of AnimeDataNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeRankingCopyWith<$Res>? get ranking {
    if (_value.ranking == null) {
      return null;
    }

    return $AnimeRankingCopyWith<$Res>(_value.ranking!, (value) {
      return _then(_value.copyWith(ranking: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimeDataNodeImplCopyWith<$Res>
    implements $AnimeDataNodeCopyWith<$Res> {
  factory _$$AnimeDataNodeImplCopyWith(
    _$AnimeDataNodeImpl value,
    $Res Function(_$AnimeDataNodeImpl) then,
  ) = __$$AnimeDataNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AnimeModel node, AnimeRanking? ranking});

  @override
  $AnimeModelCopyWith<$Res> get node;
  @override
  $AnimeRankingCopyWith<$Res>? get ranking;
}

/// @nodoc
class __$$AnimeDataNodeImplCopyWithImpl<$Res>
    extends _$AnimeDataNodeCopyWithImpl<$Res, _$AnimeDataNodeImpl>
    implements _$$AnimeDataNodeImplCopyWith<$Res> {
  __$$AnimeDataNodeImplCopyWithImpl(
    _$AnimeDataNodeImpl _value,
    $Res Function(_$AnimeDataNodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeDataNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? node = null, Object? ranking = freezed}) {
    return _then(
      _$AnimeDataNodeImpl(
        node: null == node
            ? _value.node
            : node // ignore: cast_nullable_to_non_nullable
                  as AnimeModel,
        ranking: freezed == ranking
            ? _value.ranking
            : ranking // ignore: cast_nullable_to_non_nullable
                  as AnimeRanking?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeDataNodeImpl implements _AnimeDataNode {
  const _$AnimeDataNodeImpl({required this.node, this.ranking});

  factory _$AnimeDataNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeDataNodeImplFromJson(json);

  @override
  final AnimeModel node;
  @override
  final AnimeRanking? ranking;

  @override
  String toString() {
    return 'AnimeDataNode(node: $node, ranking: $ranking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeDataNodeImpl &&
            (identical(other.node, node) || other.node == node) &&
            (identical(other.ranking, ranking) || other.ranking == ranking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, node, ranking);

  /// Create a copy of AnimeDataNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeDataNodeImplCopyWith<_$AnimeDataNodeImpl> get copyWith =>
      __$$AnimeDataNodeImplCopyWithImpl<_$AnimeDataNodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeDataNodeImplToJson(this);
  }
}

abstract class _AnimeDataNode implements AnimeDataNode {
  const factory _AnimeDataNode({
    required final AnimeModel node,
    final AnimeRanking? ranking,
  }) = _$AnimeDataNodeImpl;

  factory _AnimeDataNode.fromJson(Map<String, dynamic> json) =
      _$AnimeDataNodeImpl.fromJson;

  @override
  AnimeModel get node;
  @override
  AnimeRanking? get ranking;

  /// Create a copy of AnimeDataNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeDataNodeImplCopyWith<_$AnimeDataNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) {
  return _AnimeModel.fromJson(json);
}

/// @nodoc
mixin _$AnimeModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'main_picture')
  AnimeMainPicture? get mainPicture => throw _privateConstructorUsedError;
  @JsonKey(name: 'alternative_titles')
  AnimeAlternativeTitles? get alternativeTitles =>
      throw _privateConstructorUsedError;
  String? get synopsis => throw _privateConstructorUsedError;
  double? get mean => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  int? get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_episodes')
  int? get numEpisodes => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_list_users')
  int? get numListUsers => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  String? get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_season')
  AnimeSeason? get startSeason => throw _privateConstructorUsedError;
  List<AnimeGenre>? get genres => throw _privateConstructorUsedError;
  List<AnimeStudio>? get studios => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get background => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_episode_duration')
  int? get averageEpisodeDuration => throw _privateConstructorUsedError;
  List<AnimeRecommendation>? get recommendations =>
      throw _privateConstructorUsedError;

  /// Serializes this AnimeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeModelCopyWith<AnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeModelCopyWith<$Res> {
  factory $AnimeModelCopyWith(
    AnimeModel value,
    $Res Function(AnimeModel) then,
  ) = _$AnimeModelCopyWithImpl<$Res, AnimeModel>;
  @useResult
  $Res call({
    int id,
    String title,
    @JsonKey(name: 'main_picture') AnimeMainPicture? mainPicture,
    @JsonKey(name: 'alternative_titles')
    AnimeAlternativeTitles? alternativeTitles,
    String? synopsis,
    double? mean,
    int? rank,
    int? popularity,
    @JsonKey(name: 'num_episodes') int? numEpisodes,
    @JsonKey(name: 'num_list_users') int? numListUsers,
    String? status,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'start_season') AnimeSeason? startSeason,
    List<AnimeGenre>? genres,
    List<AnimeStudio>? studios,
    String? rating,
    String? source,
    String? background,
    @JsonKey(name: 'average_episode_duration') int? averageEpisodeDuration,
    List<AnimeRecommendation>? recommendations,
  });

  $AnimeMainPictureCopyWith<$Res>? get mainPicture;
  $AnimeAlternativeTitlesCopyWith<$Res>? get alternativeTitles;
  $AnimeSeasonCopyWith<$Res>? get startSeason;
}

/// @nodoc
class _$AnimeModelCopyWithImpl<$Res, $Val extends AnimeModel>
    implements $AnimeModelCopyWith<$Res> {
  _$AnimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? mainPicture = freezed,
    Object? alternativeTitles = freezed,
    Object? synopsis = freezed,
    Object? mean = freezed,
    Object? rank = freezed,
    Object? popularity = freezed,
    Object? numEpisodes = freezed,
    Object? numListUsers = freezed,
    Object? status = freezed,
    Object? mediaType = freezed,
    Object? startSeason = freezed,
    Object? genres = freezed,
    Object? studios = freezed,
    Object? rating = freezed,
    Object? source = freezed,
    Object? background = freezed,
    Object? averageEpisodeDuration = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            mainPicture: freezed == mainPicture
                ? _value.mainPicture
                : mainPicture // ignore: cast_nullable_to_non_nullable
                      as AnimeMainPicture?,
            alternativeTitles: freezed == alternativeTitles
                ? _value.alternativeTitles
                : alternativeTitles // ignore: cast_nullable_to_non_nullable
                      as AnimeAlternativeTitles?,
            synopsis: freezed == synopsis
                ? _value.synopsis
                : synopsis // ignore: cast_nullable_to_non_nullable
                      as String?,
            mean: freezed == mean
                ? _value.mean
                : mean // ignore: cast_nullable_to_non_nullable
                      as double?,
            rank: freezed == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int?,
            popularity: freezed == popularity
                ? _value.popularity
                : popularity // ignore: cast_nullable_to_non_nullable
                      as int?,
            numEpisodes: freezed == numEpisodes
                ? _value.numEpisodes
                : numEpisodes // ignore: cast_nullable_to_non_nullable
                      as int?,
            numListUsers: freezed == numListUsers
                ? _value.numListUsers
                : numListUsers // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            mediaType: freezed == mediaType
                ? _value.mediaType
                : mediaType // ignore: cast_nullable_to_non_nullable
                      as String?,
            startSeason: freezed == startSeason
                ? _value.startSeason
                : startSeason // ignore: cast_nullable_to_non_nullable
                      as AnimeSeason?,
            genres: freezed == genres
                ? _value.genres
                : genres // ignore: cast_nullable_to_non_nullable
                      as List<AnimeGenre>?,
            studios: freezed == studios
                ? _value.studios
                : studios // ignore: cast_nullable_to_non_nullable
                      as List<AnimeStudio>?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
            background: freezed == background
                ? _value.background
                : background // ignore: cast_nullable_to_non_nullable
                      as String?,
            averageEpisodeDuration: freezed == averageEpisodeDuration
                ? _value.averageEpisodeDuration
                : averageEpisodeDuration // ignore: cast_nullable_to_non_nullable
                      as int?,
            recommendations: freezed == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<AnimeRecommendation>?,
          )
          as $Val,
    );
  }

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeMainPictureCopyWith<$Res>? get mainPicture {
    if (_value.mainPicture == null) {
      return null;
    }

    return $AnimeMainPictureCopyWith<$Res>(_value.mainPicture!, (value) {
      return _then(_value.copyWith(mainPicture: value) as $Val);
    });
  }

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeAlternativeTitlesCopyWith<$Res>? get alternativeTitles {
    if (_value.alternativeTitles == null) {
      return null;
    }

    return $AnimeAlternativeTitlesCopyWith<$Res>(_value.alternativeTitles!, (
      value,
    ) {
      return _then(_value.copyWith(alternativeTitles: value) as $Val);
    });
  }

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeSeasonCopyWith<$Res>? get startSeason {
    if (_value.startSeason == null) {
      return null;
    }

    return $AnimeSeasonCopyWith<$Res>(_value.startSeason!, (value) {
      return _then(_value.copyWith(startSeason: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimeModelImplCopyWith<$Res>
    implements $AnimeModelCopyWith<$Res> {
  factory _$$AnimeModelImplCopyWith(
    _$AnimeModelImpl value,
    $Res Function(_$AnimeModelImpl) then,
  ) = __$$AnimeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    @JsonKey(name: 'main_picture') AnimeMainPicture? mainPicture,
    @JsonKey(name: 'alternative_titles')
    AnimeAlternativeTitles? alternativeTitles,
    String? synopsis,
    double? mean,
    int? rank,
    int? popularity,
    @JsonKey(name: 'num_episodes') int? numEpisodes,
    @JsonKey(name: 'num_list_users') int? numListUsers,
    String? status,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'start_season') AnimeSeason? startSeason,
    List<AnimeGenre>? genres,
    List<AnimeStudio>? studios,
    String? rating,
    String? source,
    String? background,
    @JsonKey(name: 'average_episode_duration') int? averageEpisodeDuration,
    List<AnimeRecommendation>? recommendations,
  });

  @override
  $AnimeMainPictureCopyWith<$Res>? get mainPicture;
  @override
  $AnimeAlternativeTitlesCopyWith<$Res>? get alternativeTitles;
  @override
  $AnimeSeasonCopyWith<$Res>? get startSeason;
}

/// @nodoc
class __$$AnimeModelImplCopyWithImpl<$Res>
    extends _$AnimeModelCopyWithImpl<$Res, _$AnimeModelImpl>
    implements _$$AnimeModelImplCopyWith<$Res> {
  __$$AnimeModelImplCopyWithImpl(
    _$AnimeModelImpl _value,
    $Res Function(_$AnimeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? mainPicture = freezed,
    Object? alternativeTitles = freezed,
    Object? synopsis = freezed,
    Object? mean = freezed,
    Object? rank = freezed,
    Object? popularity = freezed,
    Object? numEpisodes = freezed,
    Object? numListUsers = freezed,
    Object? status = freezed,
    Object? mediaType = freezed,
    Object? startSeason = freezed,
    Object? genres = freezed,
    Object? studios = freezed,
    Object? rating = freezed,
    Object? source = freezed,
    Object? background = freezed,
    Object? averageEpisodeDuration = freezed,
    Object? recommendations = freezed,
  }) {
    return _then(
      _$AnimeModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        mainPicture: freezed == mainPicture
            ? _value.mainPicture
            : mainPicture // ignore: cast_nullable_to_non_nullable
                  as AnimeMainPicture?,
        alternativeTitles: freezed == alternativeTitles
            ? _value.alternativeTitles
            : alternativeTitles // ignore: cast_nullable_to_non_nullable
                  as AnimeAlternativeTitles?,
        synopsis: freezed == synopsis
            ? _value.synopsis
            : synopsis // ignore: cast_nullable_to_non_nullable
                  as String?,
        mean: freezed == mean
            ? _value.mean
            : mean // ignore: cast_nullable_to_non_nullable
                  as double?,
        rank: freezed == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int?,
        popularity: freezed == popularity
            ? _value.popularity
            : popularity // ignore: cast_nullable_to_non_nullable
                  as int?,
        numEpisodes: freezed == numEpisodes
            ? _value.numEpisodes
            : numEpisodes // ignore: cast_nullable_to_non_nullable
                  as int?,
        numListUsers: freezed == numListUsers
            ? _value.numListUsers
            : numListUsers // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        mediaType: freezed == mediaType
            ? _value.mediaType
            : mediaType // ignore: cast_nullable_to_non_nullable
                  as String?,
        startSeason: freezed == startSeason
            ? _value.startSeason
            : startSeason // ignore: cast_nullable_to_non_nullable
                  as AnimeSeason?,
        genres: freezed == genres
            ? _value._genres
            : genres // ignore: cast_nullable_to_non_nullable
                  as List<AnimeGenre>?,
        studios: freezed == studios
            ? _value._studios
            : studios // ignore: cast_nullable_to_non_nullable
                  as List<AnimeStudio>?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
        background: freezed == background
            ? _value.background
            : background // ignore: cast_nullable_to_non_nullable
                  as String?,
        averageEpisodeDuration: freezed == averageEpisodeDuration
            ? _value.averageEpisodeDuration
            : averageEpisodeDuration // ignore: cast_nullable_to_non_nullable
                  as int?,
        recommendations: freezed == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<AnimeRecommendation>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeModelImpl implements _AnimeModel {
  const _$AnimeModelImpl({
    required this.id,
    required this.title,
    @JsonKey(name: 'main_picture') this.mainPicture,
    @JsonKey(name: 'alternative_titles') this.alternativeTitles,
    this.synopsis,
    this.mean,
    this.rank,
    this.popularity,
    @JsonKey(name: 'num_episodes') this.numEpisodes,
    @JsonKey(name: 'num_list_users') this.numListUsers,
    this.status,
    @JsonKey(name: 'media_type') this.mediaType,
    @JsonKey(name: 'start_season') this.startSeason,
    final List<AnimeGenre>? genres,
    final List<AnimeStudio>? studios,
    this.rating,
    this.source,
    this.background,
    @JsonKey(name: 'average_episode_duration') this.averageEpisodeDuration,
    final List<AnimeRecommendation>? recommendations,
  }) : _genres = genres,
       _studios = studios,
       _recommendations = recommendations;

  factory _$AnimeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'main_picture')
  final AnimeMainPicture? mainPicture;
  @override
  @JsonKey(name: 'alternative_titles')
  final AnimeAlternativeTitles? alternativeTitles;
  @override
  final String? synopsis;
  @override
  final double? mean;
  @override
  final int? rank;
  @override
  final int? popularity;
  @override
  @JsonKey(name: 'num_episodes')
  final int? numEpisodes;
  @override
  @JsonKey(name: 'num_list_users')
  final int? numListUsers;
  @override
  final String? status;
  @override
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @override
  @JsonKey(name: 'start_season')
  final AnimeSeason? startSeason;
  final List<AnimeGenre>? _genres;
  @override
  List<AnimeGenre>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AnimeStudio>? _studios;
  @override
  List<AnimeStudio>? get studios {
    final value = _studios;
    if (value == null) return null;
    if (_studios is EqualUnmodifiableListView) return _studios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? rating;
  @override
  final String? source;
  @override
  final String? background;
  @override
  @JsonKey(name: 'average_episode_duration')
  final int? averageEpisodeDuration;
  final List<AnimeRecommendation>? _recommendations;
  @override
  List<AnimeRecommendation>? get recommendations {
    final value = _recommendations;
    if (value == null) return null;
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AnimeModel(id: $id, title: $title, mainPicture: $mainPicture, alternativeTitles: $alternativeTitles, synopsis: $synopsis, mean: $mean, rank: $rank, popularity: $popularity, numEpisodes: $numEpisodes, numListUsers: $numListUsers, status: $status, mediaType: $mediaType, startSeason: $startSeason, genres: $genres, studios: $studios, rating: $rating, source: $source, background: $background, averageEpisodeDuration: $averageEpisodeDuration, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mainPicture, mainPicture) ||
                other.mainPicture == mainPicture) &&
            (identical(other.alternativeTitles, alternativeTitles) ||
                other.alternativeTitles == alternativeTitles) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.mean, mean) || other.mean == mean) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.numEpisodes, numEpisodes) ||
                other.numEpisodes == numEpisodes) &&
            (identical(other.numListUsers, numListUsers) ||
                other.numListUsers == numListUsers) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.startSeason, startSeason) ||
                other.startSeason == startSeason) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._studios, _studios) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.background, background) ||
                other.background == background) &&
            (identical(other.averageEpisodeDuration, averageEpisodeDuration) ||
                other.averageEpisodeDuration == averageEpisodeDuration) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    mainPicture,
    alternativeTitles,
    synopsis,
    mean,
    rank,
    popularity,
    numEpisodes,
    numListUsers,
    status,
    mediaType,
    startSeason,
    const DeepCollectionEquality().hash(_genres),
    const DeepCollectionEquality().hash(_studios),
    rating,
    source,
    background,
    averageEpisodeDuration,
    const DeepCollectionEquality().hash(_recommendations),
  ]);

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeModelImplCopyWith<_$AnimeModelImpl> get copyWith =>
      __$$AnimeModelImplCopyWithImpl<_$AnimeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeModelImplToJson(this);
  }
}

abstract class _AnimeModel implements AnimeModel {
  const factory _AnimeModel({
    required final int id,
    required final String title,
    @JsonKey(name: 'main_picture') final AnimeMainPicture? mainPicture,
    @JsonKey(name: 'alternative_titles')
    final AnimeAlternativeTitles? alternativeTitles,
    final String? synopsis,
    final double? mean,
    final int? rank,
    final int? popularity,
    @JsonKey(name: 'num_episodes') final int? numEpisodes,
    @JsonKey(name: 'num_list_users') final int? numListUsers,
    final String? status,
    @JsonKey(name: 'media_type') final String? mediaType,
    @JsonKey(name: 'start_season') final AnimeSeason? startSeason,
    final List<AnimeGenre>? genres,
    final List<AnimeStudio>? studios,
    final String? rating,
    final String? source,
    final String? background,
    @JsonKey(name: 'average_episode_duration')
    final int? averageEpisodeDuration,
    final List<AnimeRecommendation>? recommendations,
  }) = _$AnimeModelImpl;

  factory _AnimeModel.fromJson(Map<String, dynamic> json) =
      _$AnimeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'main_picture')
  AnimeMainPicture? get mainPicture;
  @override
  @JsonKey(name: 'alternative_titles')
  AnimeAlternativeTitles? get alternativeTitles;
  @override
  String? get synopsis;
  @override
  double? get mean;
  @override
  int? get rank;
  @override
  int? get popularity;
  @override
  @JsonKey(name: 'num_episodes')
  int? get numEpisodes;
  @override
  @JsonKey(name: 'num_list_users')
  int? get numListUsers;
  @override
  String? get status;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  @JsonKey(name: 'start_season')
  AnimeSeason? get startSeason;
  @override
  List<AnimeGenre>? get genres;
  @override
  List<AnimeStudio>? get studios;
  @override
  String? get rating;
  @override
  String? get source;
  @override
  String? get background;
  @override
  @JsonKey(name: 'average_episode_duration')
  int? get averageEpisodeDuration;
  @override
  List<AnimeRecommendation>? get recommendations;

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeModelImplCopyWith<_$AnimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeMainPicture _$AnimeMainPictureFromJson(Map<String, dynamic> json) {
  return _AnimeMainPicture.fromJson(json);
}

/// @nodoc
mixin _$AnimeMainPicture {
  String? get medium => throw _privateConstructorUsedError;
  String? get large => throw _privateConstructorUsedError;

  /// Serializes this AnimeMainPicture to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeMainPicture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeMainPictureCopyWith<AnimeMainPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeMainPictureCopyWith<$Res> {
  factory $AnimeMainPictureCopyWith(
    AnimeMainPicture value,
    $Res Function(AnimeMainPicture) then,
  ) = _$AnimeMainPictureCopyWithImpl<$Res, AnimeMainPicture>;
  @useResult
  $Res call({String? medium, String? large});
}

/// @nodoc
class _$AnimeMainPictureCopyWithImpl<$Res, $Val extends AnimeMainPicture>
    implements $AnimeMainPictureCopyWith<$Res> {
  _$AnimeMainPictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeMainPicture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? medium = freezed, Object? large = freezed}) {
    return _then(
      _value.copyWith(
            medium: freezed == medium
                ? _value.medium
                : medium // ignore: cast_nullable_to_non_nullable
                      as String?,
            large: freezed == large
                ? _value.large
                : large // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimeMainPictureImplCopyWith<$Res>
    implements $AnimeMainPictureCopyWith<$Res> {
  factory _$$AnimeMainPictureImplCopyWith(
    _$AnimeMainPictureImpl value,
    $Res Function(_$AnimeMainPictureImpl) then,
  ) = __$$AnimeMainPictureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? medium, String? large});
}

/// @nodoc
class __$$AnimeMainPictureImplCopyWithImpl<$Res>
    extends _$AnimeMainPictureCopyWithImpl<$Res, _$AnimeMainPictureImpl>
    implements _$$AnimeMainPictureImplCopyWith<$Res> {
  __$$AnimeMainPictureImplCopyWithImpl(
    _$AnimeMainPictureImpl _value,
    $Res Function(_$AnimeMainPictureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeMainPicture
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? medium = freezed, Object? large = freezed}) {
    return _then(
      _$AnimeMainPictureImpl(
        medium: freezed == medium
            ? _value.medium
            : medium // ignore: cast_nullable_to_non_nullable
                  as String?,
        large: freezed == large
            ? _value.large
            : large // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeMainPictureImpl implements _AnimeMainPicture {
  const _$AnimeMainPictureImpl({this.medium, this.large});

  factory _$AnimeMainPictureImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeMainPictureImplFromJson(json);

  @override
  final String? medium;
  @override
  final String? large;

  @override
  String toString() {
    return 'AnimeMainPicture(medium: $medium, large: $large)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeMainPictureImpl &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.large, large) || other.large == large));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, medium, large);

  /// Create a copy of AnimeMainPicture
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeMainPictureImplCopyWith<_$AnimeMainPictureImpl> get copyWith =>
      __$$AnimeMainPictureImplCopyWithImpl<_$AnimeMainPictureImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeMainPictureImplToJson(this);
  }
}

abstract class _AnimeMainPicture implements AnimeMainPicture {
  const factory _AnimeMainPicture({final String? medium, final String? large}) =
      _$AnimeMainPictureImpl;

  factory _AnimeMainPicture.fromJson(Map<String, dynamic> json) =
      _$AnimeMainPictureImpl.fromJson;

  @override
  String? get medium;
  @override
  String? get large;

  /// Create a copy of AnimeMainPicture
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeMainPictureImplCopyWith<_$AnimeMainPictureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeAlternativeTitles _$AnimeAlternativeTitlesFromJson(
  Map<String, dynamic> json,
) {
  return _AnimeAlternativeTitles.fromJson(json);
}

/// @nodoc
mixin _$AnimeAlternativeTitles {
  String? get en => throw _privateConstructorUsedError;
  String? get ja => throw _privateConstructorUsedError;
  List<String>? get synonyms => throw _privateConstructorUsedError;

  /// Serializes this AnimeAlternativeTitles to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeAlternativeTitles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeAlternativeTitlesCopyWith<AnimeAlternativeTitles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeAlternativeTitlesCopyWith<$Res> {
  factory $AnimeAlternativeTitlesCopyWith(
    AnimeAlternativeTitles value,
    $Res Function(AnimeAlternativeTitles) then,
  ) = _$AnimeAlternativeTitlesCopyWithImpl<$Res, AnimeAlternativeTitles>;
  @useResult
  $Res call({String? en, String? ja, List<String>? synonyms});
}

/// @nodoc
class _$AnimeAlternativeTitlesCopyWithImpl<
  $Res,
  $Val extends AnimeAlternativeTitles
>
    implements $AnimeAlternativeTitlesCopyWith<$Res> {
  _$AnimeAlternativeTitlesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeAlternativeTitles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
    Object? ja = freezed,
    Object? synonyms = freezed,
  }) {
    return _then(
      _value.copyWith(
            en: freezed == en
                ? _value.en
                : en // ignore: cast_nullable_to_non_nullable
                      as String?,
            ja: freezed == ja
                ? _value.ja
                : ja // ignore: cast_nullable_to_non_nullable
                      as String?,
            synonyms: freezed == synonyms
                ? _value.synonyms
                : synonyms // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimeAlternativeTitlesImplCopyWith<$Res>
    implements $AnimeAlternativeTitlesCopyWith<$Res> {
  factory _$$AnimeAlternativeTitlesImplCopyWith(
    _$AnimeAlternativeTitlesImpl value,
    $Res Function(_$AnimeAlternativeTitlesImpl) then,
  ) = __$$AnimeAlternativeTitlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? en, String? ja, List<String>? synonyms});
}

/// @nodoc
class __$$AnimeAlternativeTitlesImplCopyWithImpl<$Res>
    extends
        _$AnimeAlternativeTitlesCopyWithImpl<$Res, _$AnimeAlternativeTitlesImpl>
    implements _$$AnimeAlternativeTitlesImplCopyWith<$Res> {
  __$$AnimeAlternativeTitlesImplCopyWithImpl(
    _$AnimeAlternativeTitlesImpl _value,
    $Res Function(_$AnimeAlternativeTitlesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeAlternativeTitles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
    Object? ja = freezed,
    Object? synonyms = freezed,
  }) {
    return _then(
      _$AnimeAlternativeTitlesImpl(
        en: freezed == en
            ? _value.en
            : en // ignore: cast_nullable_to_non_nullable
                  as String?,
        ja: freezed == ja
            ? _value.ja
            : ja // ignore: cast_nullable_to_non_nullable
                  as String?,
        synonyms: freezed == synonyms
            ? _value._synonyms
            : synonyms // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeAlternativeTitlesImpl implements _AnimeAlternativeTitles {
  const _$AnimeAlternativeTitlesImpl({
    this.en,
    this.ja,
    final List<String>? synonyms,
  }) : _synonyms = synonyms;

  factory _$AnimeAlternativeTitlesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeAlternativeTitlesImplFromJson(json);

  @override
  final String? en;
  @override
  final String? ja;
  final List<String>? _synonyms;
  @override
  List<String>? get synonyms {
    final value = _synonyms;
    if (value == null) return null;
    if (_synonyms is EqualUnmodifiableListView) return _synonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AnimeAlternativeTitles(en: $en, ja: $ja, synonyms: $synonyms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeAlternativeTitlesImpl &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.ja, ja) || other.ja == ja) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    en,
    ja,
    const DeepCollectionEquality().hash(_synonyms),
  );

  /// Create a copy of AnimeAlternativeTitles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeAlternativeTitlesImplCopyWith<_$AnimeAlternativeTitlesImpl>
  get copyWith =>
      __$$AnimeAlternativeTitlesImplCopyWithImpl<_$AnimeAlternativeTitlesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeAlternativeTitlesImplToJson(this);
  }
}

abstract class _AnimeAlternativeTitles implements AnimeAlternativeTitles {
  const factory _AnimeAlternativeTitles({
    final String? en,
    final String? ja,
    final List<String>? synonyms,
  }) = _$AnimeAlternativeTitlesImpl;

  factory _AnimeAlternativeTitles.fromJson(Map<String, dynamic> json) =
      _$AnimeAlternativeTitlesImpl.fromJson;

  @override
  String? get en;
  @override
  String? get ja;
  @override
  List<String>? get synonyms;

  /// Create a copy of AnimeAlternativeTitles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeAlternativeTitlesImplCopyWith<_$AnimeAlternativeTitlesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AnimeSeason _$AnimeSeasonFromJson(Map<String, dynamic> json) {
  return _AnimeSeason.fromJson(json);
}

/// @nodoc
mixin _$AnimeSeason {
  int? get year => throw _privateConstructorUsedError;
  String? get season => throw _privateConstructorUsedError;

  /// Serializes this AnimeSeason to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeSeason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeSeasonCopyWith<AnimeSeason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeSeasonCopyWith<$Res> {
  factory $AnimeSeasonCopyWith(
    AnimeSeason value,
    $Res Function(AnimeSeason) then,
  ) = _$AnimeSeasonCopyWithImpl<$Res, AnimeSeason>;
  @useResult
  $Res call({int? year, String? season});
}

/// @nodoc
class _$AnimeSeasonCopyWithImpl<$Res, $Val extends AnimeSeason>
    implements $AnimeSeasonCopyWith<$Res> {
  _$AnimeSeasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeSeason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? year = freezed, Object? season = freezed}) {
    return _then(
      _value.copyWith(
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int?,
            season: freezed == season
                ? _value.season
                : season // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimeSeasonImplCopyWith<$Res>
    implements $AnimeSeasonCopyWith<$Res> {
  factory _$$AnimeSeasonImplCopyWith(
    _$AnimeSeasonImpl value,
    $Res Function(_$AnimeSeasonImpl) then,
  ) = __$$AnimeSeasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? year, String? season});
}

/// @nodoc
class __$$AnimeSeasonImplCopyWithImpl<$Res>
    extends _$AnimeSeasonCopyWithImpl<$Res, _$AnimeSeasonImpl>
    implements _$$AnimeSeasonImplCopyWith<$Res> {
  __$$AnimeSeasonImplCopyWithImpl(
    _$AnimeSeasonImpl _value,
    $Res Function(_$AnimeSeasonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeSeason
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? year = freezed, Object? season = freezed}) {
    return _then(
      _$AnimeSeasonImpl(
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int?,
        season: freezed == season
            ? _value.season
            : season // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeSeasonImpl implements _AnimeSeason {
  const _$AnimeSeasonImpl({this.year, this.season});

  factory _$AnimeSeasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeSeasonImplFromJson(json);

  @override
  final int? year;
  @override
  final String? season;

  @override
  String toString() {
    return 'AnimeSeason(year: $year, season: $season)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeSeasonImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.season, season) || other.season == season));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, season);

  /// Create a copy of AnimeSeason
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeSeasonImplCopyWith<_$AnimeSeasonImpl> get copyWith =>
      __$$AnimeSeasonImplCopyWithImpl<_$AnimeSeasonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeSeasonImplToJson(this);
  }
}

abstract class _AnimeSeason implements AnimeSeason {
  const factory _AnimeSeason({final int? year, final String? season}) =
      _$AnimeSeasonImpl;

  factory _AnimeSeason.fromJson(Map<String, dynamic> json) =
      _$AnimeSeasonImpl.fromJson;

  @override
  int? get year;
  @override
  String? get season;

  /// Create a copy of AnimeSeason
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeSeasonImplCopyWith<_$AnimeSeasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeGenre _$AnimeGenreFromJson(Map<String, dynamic> json) {
  return _AnimeGenre.fromJson(json);
}

/// @nodoc
mixin _$AnimeGenre {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this AnimeGenre to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeGenre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeGenreCopyWith<AnimeGenre> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeGenreCopyWith<$Res> {
  factory $AnimeGenreCopyWith(
    AnimeGenre value,
    $Res Function(AnimeGenre) then,
  ) = _$AnimeGenreCopyWithImpl<$Res, AnimeGenre>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$AnimeGenreCopyWithImpl<$Res, $Val extends AnimeGenre>
    implements $AnimeGenreCopyWith<$Res> {
  _$AnimeGenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeGenre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimeGenreImplCopyWith<$Res>
    implements $AnimeGenreCopyWith<$Res> {
  factory _$$AnimeGenreImplCopyWith(
    _$AnimeGenreImpl value,
    $Res Function(_$AnimeGenreImpl) then,
  ) = __$$AnimeGenreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$AnimeGenreImplCopyWithImpl<$Res>
    extends _$AnimeGenreCopyWithImpl<$Res, _$AnimeGenreImpl>
    implements _$$AnimeGenreImplCopyWith<$Res> {
  __$$AnimeGenreImplCopyWithImpl(
    _$AnimeGenreImpl _value,
    $Res Function(_$AnimeGenreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeGenre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$AnimeGenreImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeGenreImpl implements _AnimeGenre {
  const _$AnimeGenreImpl({required this.id, required this.name});

  factory _$AnimeGenreImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeGenreImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'AnimeGenre(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeGenreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of AnimeGenre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeGenreImplCopyWith<_$AnimeGenreImpl> get copyWith =>
      __$$AnimeGenreImplCopyWithImpl<_$AnimeGenreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeGenreImplToJson(this);
  }
}

abstract class _AnimeGenre implements AnimeGenre {
  const factory _AnimeGenre({
    required final int id,
    required final String name,
  }) = _$AnimeGenreImpl;

  factory _AnimeGenre.fromJson(Map<String, dynamic> json) =
      _$AnimeGenreImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of AnimeGenre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeGenreImplCopyWith<_$AnimeGenreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeStudio _$AnimeStudioFromJson(Map<String, dynamic> json) {
  return _AnimeStudio.fromJson(json);
}

/// @nodoc
mixin _$AnimeStudio {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this AnimeStudio to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeStudio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeStudioCopyWith<AnimeStudio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeStudioCopyWith<$Res> {
  factory $AnimeStudioCopyWith(
    AnimeStudio value,
    $Res Function(AnimeStudio) then,
  ) = _$AnimeStudioCopyWithImpl<$Res, AnimeStudio>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$AnimeStudioCopyWithImpl<$Res, $Val extends AnimeStudio>
    implements $AnimeStudioCopyWith<$Res> {
  _$AnimeStudioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeStudio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimeStudioImplCopyWith<$Res>
    implements $AnimeStudioCopyWith<$Res> {
  factory _$$AnimeStudioImplCopyWith(
    _$AnimeStudioImpl value,
    $Res Function(_$AnimeStudioImpl) then,
  ) = __$$AnimeStudioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$AnimeStudioImplCopyWithImpl<$Res>
    extends _$AnimeStudioCopyWithImpl<$Res, _$AnimeStudioImpl>
    implements _$$AnimeStudioImplCopyWith<$Res> {
  __$$AnimeStudioImplCopyWithImpl(
    _$AnimeStudioImpl _value,
    $Res Function(_$AnimeStudioImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeStudio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$AnimeStudioImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeStudioImpl implements _AnimeStudio {
  const _$AnimeStudioImpl({required this.id, required this.name});

  factory _$AnimeStudioImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeStudioImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'AnimeStudio(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeStudioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of AnimeStudio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeStudioImplCopyWith<_$AnimeStudioImpl> get copyWith =>
      __$$AnimeStudioImplCopyWithImpl<_$AnimeStudioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeStudioImplToJson(this);
  }
}

abstract class _AnimeStudio implements AnimeStudio {
  const factory _AnimeStudio({
    required final int id,
    required final String name,
  }) = _$AnimeStudioImpl;

  factory _AnimeStudio.fromJson(Map<String, dynamic> json) =
      _$AnimeStudioImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of AnimeStudio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeStudioImplCopyWith<_$AnimeStudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeRanking _$AnimeRankingFromJson(Map<String, dynamic> json) {
  return _AnimeRanking.fromJson(json);
}

/// @nodoc
mixin _$AnimeRanking {
  int? get rank => throw _privateConstructorUsedError;

  /// Serializes this AnimeRanking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeRanking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeRankingCopyWith<AnimeRanking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeRankingCopyWith<$Res> {
  factory $AnimeRankingCopyWith(
    AnimeRanking value,
    $Res Function(AnimeRanking) then,
  ) = _$AnimeRankingCopyWithImpl<$Res, AnimeRanking>;
  @useResult
  $Res call({int? rank});
}

/// @nodoc
class _$AnimeRankingCopyWithImpl<$Res, $Val extends AnimeRanking>
    implements $AnimeRankingCopyWith<$Res> {
  _$AnimeRankingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeRanking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rank = freezed}) {
    return _then(
      _value.copyWith(
            rank: freezed == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimeRankingImplCopyWith<$Res>
    implements $AnimeRankingCopyWith<$Res> {
  factory _$$AnimeRankingImplCopyWith(
    _$AnimeRankingImpl value,
    $Res Function(_$AnimeRankingImpl) then,
  ) = __$$AnimeRankingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? rank});
}

/// @nodoc
class __$$AnimeRankingImplCopyWithImpl<$Res>
    extends _$AnimeRankingCopyWithImpl<$Res, _$AnimeRankingImpl>
    implements _$$AnimeRankingImplCopyWith<$Res> {
  __$$AnimeRankingImplCopyWithImpl(
    _$AnimeRankingImpl _value,
    $Res Function(_$AnimeRankingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeRanking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rank = freezed}) {
    return _then(
      _$AnimeRankingImpl(
        rank: freezed == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeRankingImpl implements _AnimeRanking {
  const _$AnimeRankingImpl({this.rank});

  factory _$AnimeRankingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeRankingImplFromJson(json);

  @override
  final int? rank;

  @override
  String toString() {
    return 'AnimeRanking(rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeRankingImpl &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rank);

  /// Create a copy of AnimeRanking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeRankingImplCopyWith<_$AnimeRankingImpl> get copyWith =>
      __$$AnimeRankingImplCopyWithImpl<_$AnimeRankingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeRankingImplToJson(this);
  }
}

abstract class _AnimeRanking implements AnimeRanking {
  const factory _AnimeRanking({final int? rank}) = _$AnimeRankingImpl;

  factory _AnimeRanking.fromJson(Map<String, dynamic> json) =
      _$AnimeRankingImpl.fromJson;

  @override
  int? get rank;

  /// Create a copy of AnimeRanking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeRankingImplCopyWith<_$AnimeRankingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeListPaging _$AnimeListPagingFromJson(Map<String, dynamic> json) {
  return _AnimeListPaging.fromJson(json);
}

/// @nodoc
mixin _$AnimeListPaging {
  String? get previous => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  /// Serializes this AnimeListPaging to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeListPaging
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeListPagingCopyWith<AnimeListPaging> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeListPagingCopyWith<$Res> {
  factory $AnimeListPagingCopyWith(
    AnimeListPaging value,
    $Res Function(AnimeListPaging) then,
  ) = _$AnimeListPagingCopyWithImpl<$Res, AnimeListPaging>;
  @useResult
  $Res call({String? previous, String? next});
}

/// @nodoc
class _$AnimeListPagingCopyWithImpl<$Res, $Val extends AnimeListPaging>
    implements $AnimeListPagingCopyWith<$Res> {
  _$AnimeListPagingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeListPaging
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? previous = freezed, Object? next = freezed}) {
    return _then(
      _value.copyWith(
            previous: freezed == previous
                ? _value.previous
                : previous // ignore: cast_nullable_to_non_nullable
                      as String?,
            next: freezed == next
                ? _value.next
                : next // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimeListPagingImplCopyWith<$Res>
    implements $AnimeListPagingCopyWith<$Res> {
  factory _$$AnimeListPagingImplCopyWith(
    _$AnimeListPagingImpl value,
    $Res Function(_$AnimeListPagingImpl) then,
  ) = __$$AnimeListPagingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? previous, String? next});
}

/// @nodoc
class __$$AnimeListPagingImplCopyWithImpl<$Res>
    extends _$AnimeListPagingCopyWithImpl<$Res, _$AnimeListPagingImpl>
    implements _$$AnimeListPagingImplCopyWith<$Res> {
  __$$AnimeListPagingImplCopyWithImpl(
    _$AnimeListPagingImpl _value,
    $Res Function(_$AnimeListPagingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeListPaging
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? previous = freezed, Object? next = freezed}) {
    return _then(
      _$AnimeListPagingImpl(
        previous: freezed == previous
            ? _value.previous
            : previous // ignore: cast_nullable_to_non_nullable
                  as String?,
        next: freezed == next
            ? _value.next
            : next // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeListPagingImpl implements _AnimeListPaging {
  const _$AnimeListPagingImpl({this.previous, this.next});

  factory _$AnimeListPagingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeListPagingImplFromJson(json);

  @override
  final String? previous;
  @override
  final String? next;

  @override
  String toString() {
    return 'AnimeListPaging(previous: $previous, next: $next)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeListPagingImpl &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, previous, next);

  /// Create a copy of AnimeListPaging
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeListPagingImplCopyWith<_$AnimeListPagingImpl> get copyWith =>
      __$$AnimeListPagingImplCopyWithImpl<_$AnimeListPagingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeListPagingImplToJson(this);
  }
}

abstract class _AnimeListPaging implements AnimeListPaging {
  const factory _AnimeListPaging({final String? previous, final String? next}) =
      _$AnimeListPagingImpl;

  factory _AnimeListPaging.fromJson(Map<String, dynamic> json) =
      _$AnimeListPagingImpl.fromJson;

  @override
  String? get previous;
  @override
  String? get next;

  /// Create a copy of AnimeListPaging
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeListPagingImplCopyWith<_$AnimeListPagingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeRecommendation _$AnimeRecommendationFromJson(Map<String, dynamic> json) {
  return _AnimeRecommendation.fromJson(json);
}

/// @nodoc
mixin _$AnimeRecommendation {
  @JsonKey(name: 'node')
  AnimeModel? get node => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_recommendations')
  int? get numRecommendations => throw _privateConstructorUsedError;

  /// Serializes this AnimeRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeRecommendationCopyWith<AnimeRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeRecommendationCopyWith<$Res> {
  factory $AnimeRecommendationCopyWith(
    AnimeRecommendation value,
    $Res Function(AnimeRecommendation) then,
  ) = _$AnimeRecommendationCopyWithImpl<$Res, AnimeRecommendation>;
  @useResult
  $Res call({
    @JsonKey(name: 'node') AnimeModel? node,
    @JsonKey(name: 'num_recommendations') int? numRecommendations,
  });

  $AnimeModelCopyWith<$Res>? get node;
}

/// @nodoc
class _$AnimeRecommendationCopyWithImpl<$Res, $Val extends AnimeRecommendation>
    implements $AnimeRecommendationCopyWith<$Res> {
  _$AnimeRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? node = freezed, Object? numRecommendations = freezed}) {
    return _then(
      _value.copyWith(
            node: freezed == node
                ? _value.node
                : node // ignore: cast_nullable_to_non_nullable
                      as AnimeModel?,
            numRecommendations: freezed == numRecommendations
                ? _value.numRecommendations
                : numRecommendations // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of AnimeRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeModelCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $AnimeModelCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimeRecommendationImplCopyWith<$Res>
    implements $AnimeRecommendationCopyWith<$Res> {
  factory _$$AnimeRecommendationImplCopyWith(
    _$AnimeRecommendationImpl value,
    $Res Function(_$AnimeRecommendationImpl) then,
  ) = __$$AnimeRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'node') AnimeModel? node,
    @JsonKey(name: 'num_recommendations') int? numRecommendations,
  });

  @override
  $AnimeModelCopyWith<$Res>? get node;
}

/// @nodoc
class __$$AnimeRecommendationImplCopyWithImpl<$Res>
    extends _$AnimeRecommendationCopyWithImpl<$Res, _$AnimeRecommendationImpl>
    implements _$$AnimeRecommendationImplCopyWith<$Res> {
  __$$AnimeRecommendationImplCopyWithImpl(
    _$AnimeRecommendationImpl _value,
    $Res Function(_$AnimeRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimeRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? node = freezed, Object? numRecommendations = freezed}) {
    return _then(
      _$AnimeRecommendationImpl(
        node: freezed == node
            ? _value.node
            : node // ignore: cast_nullable_to_non_nullable
                  as AnimeModel?,
        numRecommendations: freezed == numRecommendations
            ? _value.numRecommendations
            : numRecommendations // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeRecommendationImpl implements _AnimeRecommendation {
  const _$AnimeRecommendationImpl({
    @JsonKey(name: 'node') this.node,
    @JsonKey(name: 'num_recommendations') this.numRecommendations,
  });

  factory _$AnimeRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeRecommendationImplFromJson(json);

  @override
  @JsonKey(name: 'node')
  final AnimeModel? node;
  @override
  @JsonKey(name: 'num_recommendations')
  final int? numRecommendations;

  @override
  String toString() {
    return 'AnimeRecommendation(node: $node, numRecommendations: $numRecommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeRecommendationImpl &&
            (identical(other.node, node) || other.node == node) &&
            (identical(other.numRecommendations, numRecommendations) ||
                other.numRecommendations == numRecommendations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, node, numRecommendations);

  /// Create a copy of AnimeRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeRecommendationImplCopyWith<_$AnimeRecommendationImpl> get copyWith =>
      __$$AnimeRecommendationImplCopyWithImpl<_$AnimeRecommendationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeRecommendationImplToJson(this);
  }
}

abstract class _AnimeRecommendation implements AnimeRecommendation {
  const factory _AnimeRecommendation({
    @JsonKey(name: 'node') final AnimeModel? node,
    @JsonKey(name: 'num_recommendations') final int? numRecommendations,
  }) = _$AnimeRecommendationImpl;

  factory _AnimeRecommendation.fromJson(Map<String, dynamic> json) =
      _$AnimeRecommendationImpl.fromJson;

  @override
  @JsonKey(name: 'node')
  AnimeModel? get node;
  @override
  @JsonKey(name: 'num_recommendations')
  int? get numRecommendations;

  /// Create a copy of AnimeRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeRecommendationImplCopyWith<_$AnimeRecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
