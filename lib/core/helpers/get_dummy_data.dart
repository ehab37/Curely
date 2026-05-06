import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

MedicineEntity medicineEntity() {
  return MedicineEntity(
    medicineUsage: BoneMock.title,
    medicineName: BoneMock.chars(5),
    frequency: BoneMock.words(2),
    isReminderActive: false,
    medicineTypes: BoneMock.title,
    imageUrl: BoneMock.title,
  );
}

List<MedicineEntity> getDummyMedicines() {
  return [
    medicineEntity(),
    medicineEntity(),
    medicineEntity(),
    medicineEntity(),
    medicineEntity(),
    medicineEntity(),
  ];
}

PrescriptionEntity prescriptionEntity() {
  return PrescriptionEntity(
    doctorSpecialization: BoneMock.title,
    doctorName: BoneMock.chars(5),
    examinationDate: BoneMock.date,
    imageUrls: [BoneMock.title],
  );
}

List<PrescriptionEntity> getDummyPrescriptions() {
  return [
    prescriptionEntity(),
    prescriptionEntity(),
    prescriptionEntity(),
    prescriptionEntity(),
    prescriptionEntity(),
    prescriptionEntity(),
  ];
}

RaysEntity raysEntity() {
  return RaysEntity(
    raysType: BoneMock.title,
    doctorName: BoneMock.chars(5),
    examinationDate: BoneMock.date,
    imageUrls: [BoneMock.title],
  );
}

List<RaysEntity> getDummyRays() {
  return [
    raysEntity(),
    raysEntity(),
    raysEntity(),
    raysEntity(),
    raysEntity(),
    raysEntity(),
  ];
}

AnalysisEntity analysisEntity() {
  return AnalysisEntity(
    analysisType: BoneMock.title,
    doctorName: BoneMock.chars(5),
    examinationDate: BoneMock.date,
    imageUrls: [BoneMock.title],
  );
}

List<AnalysisEntity> getDummyAnalysis() {
  return [
    analysisEntity(),
    analysisEntity(),
    analysisEntity(),
    analysisEntity(),
    analysisEntity(),
    analysisEntity(),
  ];
}

NoteEntity noteEntity() {
  return NoteEntity(
    title: BoneMock.title,
    description: BoneMock.subtitle,
    createdAt: BoneMock.date,
  );
}

List<NoteEntity> getDummyNotes() {
  return [
    noteEntity(),
    noteEntity(),
    noteEntity(),
    noteEntity(),
    noteEntity(),
    noteEntity(),
    noteEntity(),
    noteEntity(),
    noteEntity(),
  ];
}
