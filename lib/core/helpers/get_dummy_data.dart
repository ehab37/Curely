import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/domain/entities/prescription_entity.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';

MedicineEntity medicineEntity() {
  return MedicineEntity(
    medicineUsage: 'Anti Biotic',
    medicineName: "fdjndk",
    frequency: 'Once Daily',
    isReminderActive: false,
    medicineTypes: "Tablet",
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
    doctorSpecialization: 'Dentistry',
    doctorName: 'ehab',
    examinationDate: DateTime.now().toString(),
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
    raysType: 'Cardiogram',
    doctorName: 'ehab',
    examinationDate: DateTime.now().toString(),
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
    analysisType: 'Cardiogram',
    doctorName: 'ehab',
    examinationDate: DateTime.now().toString(),
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
