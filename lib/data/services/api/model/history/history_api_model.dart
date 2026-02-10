import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_api_model.freezed.dart';
part 'history_api_model.g.dart';

@freezed
abstract class HistoryApiModel with _$HistoryApiModel {
  const factory HistoryApiModel({
    required int id,
    String? name,
    String? country,
    String? icon,
    String? description,
  }) = _HistoryApiModel;

  factory HistoryApiModel.fromJson(Map<String, dynamic> json) => _$HistoryApiModelFromJson(json);
}