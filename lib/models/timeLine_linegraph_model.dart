class LineGraphData {
  final String id;
  final String coachId;
  final String clientId;
  final String skinFoldsJanuary;
  final String skinFoldsFebruary;
  final String skinFoldsMarch;
  final String skinFoldsApril;
  final String skinFoldsMay;
  final String skinFoldsJune;
  final String skinFoldsJuly;
  final String skinFoldsAugust;
  final String skinFoldsSeptember;
  final String skinFoldsOctober;
  final String skinFoldsNovember;
  final String skinFoldsDecember;
  final String boneMuscleJanuary;
  final String boneMuscleFebruary;
  final String boneMuscleMarch;
  final String boneMuscleApril;
  final String boneMuscleMay;
  final String boneMuscleJune;
  final String boneMuscleJuly;
  final String boneMuscleAugust;
  final String boneMuscleSeptember;
  final String boneMuscleOctober;
  final String boneMuscleNovember;
  final String boneMuscleDecember;
  final String adiposeTissueJanuary;
  final String adiposeTissueFebruary;
  final String adiposeTissueMarch;
  final String adiposeTissueApril;
  final String adiposeTissueMay;
  final String adiposeTissueJune;
  final String adiposeTissueJuly;
  final String adiposeTissueAugust;
  final String adiposeTissueSeptember;
  final String adiposeTissueOctober;
  final String adiposeTissueNovember;
  final String adiposeTissueDecember;
  final String muscularTissueJanuary;
  final String muscularTissueFebruary;
  final String muscularTissueMarch;
  final String muscularTissueApril;
  final String muscularTissueMay;
  final String muscularTissueJune;
  final String muscularTissueJuly;
  final String muscularTissueAugust;
  final String muscularTissueSeptember;
  final String muscularTissueOctober;
  final String muscularTissueNovember;
  final String muscularTissueDecember;

  LineGraphData({
    required this.id,
    required this.coachId,
    required this.clientId,
    required this.skinFoldsJanuary,
    required this.skinFoldsFebruary,
    required this.skinFoldsMarch,
    required this.skinFoldsApril,
    required this.skinFoldsMay,
    required this.skinFoldsJune,
    required this.skinFoldsJuly,
    required this.skinFoldsAugust,
    required this.skinFoldsSeptember,
    required this.skinFoldsOctober,
    required this.skinFoldsNovember,
    required this.skinFoldsDecember,
    required this.boneMuscleJanuary,
    required this.boneMuscleFebruary,
    required this.boneMuscleMarch,
    required this.boneMuscleApril,
    required this.boneMuscleMay,
    required this.boneMuscleJune,
    required this.boneMuscleJuly,
    required this.boneMuscleAugust,
    required this.boneMuscleSeptember,
    required this.boneMuscleOctober,
    required this.boneMuscleNovember,
    required this.boneMuscleDecember,
    required this.adiposeTissueJanuary,
    required this.adiposeTissueFebruary,
    required this.adiposeTissueMarch,
    required this.adiposeTissueApril,
    required this.adiposeTissueMay,
    required this.adiposeTissueJune,
    required this.adiposeTissueJuly,
    required this.adiposeTissueAugust,
    required this.adiposeTissueSeptember,
    required this.adiposeTissueOctober,
    required this.adiposeTissueNovember,
    required this.adiposeTissueDecember,
    required this.muscularTissueJanuary,
    required this.muscularTissueFebruary,
    required this.muscularTissueMarch,
    required this.muscularTissueApril,
    required this.muscularTissueMay,
    required this.muscularTissueJune,
    required this.muscularTissueJuly,
    required this.muscularTissueAugust,
    required this.muscularTissueSeptember,
    required this.muscularTissueOctober,
    required this.muscularTissueNovember,
    required this.muscularTissueDecember,
  });

  factory LineGraphData.fromJson(Map<String, dynamic> json) {
    return LineGraphData(
      id: json['id'],
      coachId: json['coach_id'],
      clientId: json['client_id'],
      skinFoldsJanuary: json['skin_folds_january'],
      skinFoldsFebruary: json['skin_folds_february'],
      skinFoldsMarch: json['skin_folds_march'],
      skinFoldsApril: json['skin_folds_april'],
      skinFoldsMay: json['skin_folds_may'],
      skinFoldsJune: json['skin_folds_june'],
      skinFoldsJuly: json['skin_folds_july'],
      skinFoldsAugust: json['skin_folds_august'],
      skinFoldsSeptember: json['skin_folds_september'],
      skinFoldsOctober: json['skin_folds_october'],
      skinFoldsNovember: json['skin_folds_november'],
      skinFoldsDecember: json['skin_folds_december'],
      boneMuscleJanuary: json['bone_muscle_january'],
      boneMuscleFebruary: json['bone_muscle_february'],
      boneMuscleMarch: json['bone_muscle_march'],
      boneMuscleApril: json['bone_muscle_april'],
      boneMuscleMay: json['bone_muscle_may'],
      boneMuscleJune: json['bone_muscle_june'],
      boneMuscleJuly: json['bone_muscle_july'],
      boneMuscleAugust: json['bone_muscle_august'],
      boneMuscleSeptember: json['bone_muscle_september'],
      boneMuscleOctober: json['bone_muscle_october'],
      boneMuscleNovember: json['bone_muscle_november'],
      boneMuscleDecember: json['bone_muscle_december'],
      adiposeTissueJanuary: json['adipose_tissue_january'],
      adiposeTissueFebruary: json['adipose_tissue_february'],
      adiposeTissueMarch: json['adipose_tissue_march'],
      adiposeTissueApril: json['adipose_tissue_april'],
      adiposeTissueMay: json['adipose_tissue_may'],
      adiposeTissueJune: json['adipose_tissue_june'],
      adiposeTissueJuly: json['adipose_tissue_july'],
      adiposeTissueAugust: json['adipose_tissue_august'],
      adiposeTissueSeptember: json['adipose_tissue_september'],
      adiposeTissueOctober: json['adipose_tissue_october'],
      adiposeTissueNovember: json['adipose_tissue_november'],
      adiposeTissueDecember: json['adipose_tissue_december'],
      muscularTissueJanuary: json['muscular_tissue_january'],
      muscularTissueFebruary: json['muscular_tissue_february'],
      muscularTissueMarch: json['muscular_tissue_march'],
      muscularTissueApril: json['muscular_tissue_april'],
      muscularTissueMay: json['muscular_tissue_may'],
      muscularTissueJune: json['muscular_tissue_june'],
      muscularTissueJuly: json['muscular_tissue_july'],
      muscularTissueAugust: json['muscular_tissue_august'],
      muscularTissueSeptember: json['muscular_tissue_september'],
      muscularTissueOctober: json['muscular_tissue_october'],
      muscularTissueNovember: json['muscular_tissue_november'],
      muscularTissueDecember: json['muscular_tissue_december'],
    );
  }
}
