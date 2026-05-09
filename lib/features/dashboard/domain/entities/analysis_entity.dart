import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'record_details_item_entity.dart';

const List<String> analysisTypesList = [
  'cbc',
  'stool_analysis',
  'urine_test',
  'random_blood_glucose',
  'fasting_blood_sugar',
  'esr',
  'bleeding_time',
  'glucose',
  'cholesterol',
  'uric_acid',
  'creatinine',
  'triglycerides',
  'other',
];

class AnalysisEntity {
  final String? docId;
  final String analysisType;
  final String doctorName;
  final String? lab;
  String? diagnosis;
  final String examinationDate;
  bool isFavorite;
  final List<File>? images;
  List<String>? imageUrls;

  AnalysisEntity({
    this.docId,
    required this.analysisType,
    required this.doctorName,
    this.lab,
    this.diagnosis,
    required this.examinationDate,
    this.isFavorite = false,
    this.images,
    this.imageUrls,
  });
}

List<RecordDetailsItemEntity> analysisDetailsList(
  BuildContext context,
  AnalysisEntity analysis,
) => [
  RecordDetailsItemEntity(
    title: context.tr('doctor_name'),
    subTitle: analysis.doctorName,
    icon: FontAwesomeIcons.userDoctor,
  ),
  RecordDetailsItemEntity(
    title: context.tr('analysis_type'),
    subTitle: context.tr(analysis.analysisType),
    icon: FontAwesomeIcons.flaskVial,
  ),
  RecordDetailsItemEntity(
    title: context.tr('lab_name'),
    subTitle: analysis.lab ?? context.tr('not_added'),
    icon: FontAwesomeIcons.houseMedicalCircleCheck,
  ),
  RecordDetailsItemEntity(
    title: context.tr('diagnosis'),
    subTitle: analysis.diagnosis ?? context.tr('no_diagnosis'),
    icon: FontAwesomeIcons.notesMedical,
  ),
  RecordDetailsItemEntity(
    title: context.tr('examination_date'),
    subTitle: analysis.examinationDate,
    icon: FontAwesomeIcons.calendar,
  ),
];
