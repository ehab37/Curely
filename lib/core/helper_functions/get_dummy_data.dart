import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';

MedicineEntity medicineEntity() {
  return MedicineEntity(
    medicineUsage: 'Anti Biotic',
    medicineName: "fdjndk",
    frequency: 'Once Daily',
    isReminderActive: false,
    medicineTypes: "Tablet",
  );
}
List<MedicineEntity> getDummyMedicines (){
  return [
    medicineEntity(),
    medicineEntity(),
    medicineEntity(),
    medicineEntity(),
    medicineEntity(),
    medicineEntity(),
  ];
}
