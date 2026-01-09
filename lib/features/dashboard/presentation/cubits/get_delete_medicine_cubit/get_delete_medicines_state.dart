part of 'get_delete_medicines_cubit.dart';

@immutable
sealed class GetDeleteMedicinesState {}

final class GetDeleteMedicinesInitial extends GetDeleteMedicinesState {}

final class GetDeleteMedicinesLoading extends GetDeleteMedicinesState {}

final class GetMedicinesFailure extends GetDeleteMedicinesState {
  final String errMessage;

  GetMedicinesFailure(this.errMessage);
}

final class DeleteMedicinesFailure extends GetDeleteMedicinesState {
  final String errMessage;

  DeleteMedicinesFailure(this.errMessage);
}

final class CancelMedicinesNotificationFailure extends GetDeleteMedicinesState {
  final String errMessage;

  CancelMedicinesNotificationFailure(this.errMessage);
}

final class GetMedicinesSuccess extends GetDeleteMedicinesState {
  final List<MedicineEntity> medicines;

  GetMedicinesSuccess(this.medicines);
}

final class DeleteMedicinesSuccess extends GetDeleteMedicinesState {}
