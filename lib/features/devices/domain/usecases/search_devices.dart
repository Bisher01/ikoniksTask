import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/device_entity.dart';
import '../repositories/device_repository.dart';

class SearchDevices extends UseCase<DeviceListEntity, String> {
  final DeviceRepository deviceRepository;

  SearchDevices({required this.deviceRepository});

  @override
  Future<Either<Failure, DeviceListEntity>> call(
      {required String params}) async {
    return await deviceRepository.searchDevices(searchText: params);
  }
}
