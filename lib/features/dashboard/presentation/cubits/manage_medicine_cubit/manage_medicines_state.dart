part of 'manage_medicines_cubit.dart';

@immutable
sealed class ManageMedicinesState {}

final class ManageMedicinesInitial extends ManageMedicinesState {}

final class ManageMedicinesLoading extends ManageMedicinesState {}

final class GetMedicinesFailure extends ManageMedicinesState {
  final String errMessage;

  GetMedicinesFailure(this.errMessage);
}

final class UpdateMedicinesFailure extends ManageMedicinesState {
  final String errMessage;

  UpdateMedicinesFailure(this.errMessage);
}

final class DeleteMedicinesFailure extends ManageMedicinesState {
  final String errMessage;

  DeleteMedicinesFailure(this.errMessage);
}

final class CancelMedicinesNotificationFailure extends ManageMedicinesState {
  final String errMessage;

  CancelMedicinesNotificationFailure(this.errMessage);
}

final class GetMedicinesSuccess extends ManageMedicinesState {
  final List<MedicineEntity> medicines;

  GetMedicinesSuccess(this.medicines);
}

final class UpdateMedicinesSuccess extends ManageMedicinesState {}

final class DeleteMedicinesSuccess extends ManageMedicinesState {}
