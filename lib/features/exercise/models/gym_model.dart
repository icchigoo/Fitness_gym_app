import 'difficulty_model.dart';
import 'muscles_model.dart';

class GymModel {
  static String? muscles;
  static String? difficulty;

  static void beginner(String muscle, String level) {
    if (muscle == MusclesModel.getMusclesData[0].name &&
        level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'biceps';
      difficulty = 'beginner';
    } else if (muscle == MusclesModel.getMusclesData[1].name &&
        level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'forearms';
      difficulty = 'beginner';
    } else if (muscle == MusclesModel.getMusclesData[2].name &&
        level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'chest';
      difficulty = 'beginner';
    } else if (muscle == MusclesModel.getMusclesData[3].name &&
        level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'abdominals';
      difficulty = 'beginner';
    } else if (muscle == MusclesModel.getMusclesData[4].name &&
        level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'hamstrings';
      difficulty = 'beginner';
    } else if (muscle == MusclesModel.getMusclesData[5].name &&
        level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'lats';
      difficulty = 'beginner';
    } else if (muscle == MusclesModel.getMusclesData[6].name &&
        level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'traps';
      difficulty = 'beginner';
    } else if (muscle == MusclesModel.getMusclesData[7].name &&
        level == DifficultyModel.getDifficultyData[0].level) {
      muscles = 'triceps';
      difficulty = 'beginner';
    }
  }

  static void intermediate(String muscle, String level) {
    if (muscle == MusclesModel.getMusclesData[0].name &&
        level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'biceps';
      difficulty = 'intermediate';
    } else if (muscle == MusclesModel.getMusclesData[1].name &&
        level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'forearms';
      difficulty = 'intermediate';
    } else if (muscle == MusclesModel.getMusclesData[2].name &&
        level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'chest';
      difficulty = 'intermediate';
    } else if (muscle == MusclesModel.getMusclesData[3].name &&
        level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'abdominals';
      difficulty = 'intermediate';
    } else if (muscle == MusclesModel.getMusclesData[4].name &&
        level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'hamstrings';
      difficulty = 'intermediate';
    } else if (muscle == MusclesModel.getMusclesData[5].name &&
        level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'lats';
      difficulty = 'intermediate';
    } else if (muscle == MusclesModel.getMusclesData[6].name &&
        level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'traps';
      difficulty = 'intermediate';
    } else if (muscle == MusclesModel.getMusclesData[7].name &&
        level == DifficultyModel.getDifficultyData[1].level) {
      muscles = 'triceps';
      difficulty = 'intermediate';
    }
  }
}
