import 'package:flowery_tts/src/schemas/voice.dart';

/// A representation of `TTSVoicesResponse` schema.
class VoicesResponse {
  /// {@template flowery.voicesResponse}
  /// Create a new [VoicesResponse] instance
  /// {@endtemplate}.
  VoicesResponse({required this.count, required this.voices});

  /// {@macro flowery.voicesResponse} {@macro flowery.fromMap}
  factory VoicesResponse.fromMap(Map<String, dynamic> map) => VoicesResponse(
        count: map['count'] as int,
        voices: [
          for (final voice in map['voices'] as List)
            Voice.fromMap(voice as Map<String, dynamic>),
        ],
      );

  /// The total number of voices. Prefer this over `voices.length`.
  final int count;

  /// A list of voices.
  final List<Voice> voices;

  /// A list of female voices.
  late final femaleVoices = voices.where((voice) => voice.isFemale).toList();

  /// A list of male voices.
  late final maleVoices = voices.where((voice) => voice.isMale).toList();

  /// A list of language codes.
  late final languageCodes =
      voices.map<String>((voice) => voice.language.code).toSet().toList();

  /// A list of language names.
  late final languageNames = voices
      .map<String>((voice) => voice.language.nameWithoutCountry)
      .toSet()
      .toList();

  /// A list of voice sources.
  late final sources =
      voices.map<String>((voice) => voice.source).toSet().toList();

  /// A list of speaker names.
  late final speakers =
      voices.map<String>((voice) => voice.name).toSet().toList();

  /// {@macro flowery.toMap}
  Map<String, Object> toMap() => {
        'count': count,
        'voices': voices..forEach((voice) => voice.toMap()),
      };

  /// {@macro flowery.toString}
  @override
  String toString() => 'VoicesResponse(count: $count, voices: $voices)';
}