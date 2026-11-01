import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'record_details_item_entity.dart';

const List<String> raysTypesList = [
  'cardiogram',
  'x_rays',
  'deep_xray',
  'electrocardiogram',
  'ct_scan',
  'mri',
  'fluoroscopy',
  'mammography',
  'dexa',
  'isotope',
  'other',
];

class RaysEntity {
  final String? docId;
  final String raysType;
  final String doctorName;
  final String? radiologyCenter;
  String? diagnosis;
  final String examinationDate;
  bool isFavorite;
  final List<File>? images;
  List<String>? imageUrls;

  RaysEntity({
    this.docId,
    required this.raysType,
    required this.doctorName,
    this.radiologyCenter,
    this.diagnosis,
    required this.examinationDate,
    this.isFavorite = false,
    this.images,
    this.imageUrls,
  });
}

List<RecordDetailsItemEntity> raysDetailsList(
  BuildContext context,
  RaysEntity rays,
) => [
  RecordDetailsItemEntity(
    title: context.tr('doctor_name'),
    subTitle: rays.doctorName,
    icon: FontAwesomeIcons.userDoctor,
  ),
  RecordDetailsItemEntity(
    title: context.tr('rays_type'),
    subTitle: context.tr(rays.raysType),
    icon: FontAwesomeIcons.xRay,
  ),
  RecordDetailsItemEntity(
    title: context.tr('radiology_center'),
    subTitle: rays.radiologyCenter ?? context.tr('not_added'),
    icon: FontAwesomeIcons.circleRadiation,
  ),
  RecordDetailsItemEntity(
    title: context.tr('diagnosis'),
    subTitle: rays.diagnosis ?? context.tr('no_diagnosis'),
    icon: FontAwesomeIcons.notesMedical,
  ),
  RecordDetailsItemEntity(
    title: context.tr('examination_date'),
    subTitle: rays.examinationDate,
    icon: FontAwesomeIcons.calendar,
  ),
];
