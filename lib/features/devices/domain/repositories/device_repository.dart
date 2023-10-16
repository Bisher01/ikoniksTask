import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/device_entity.dart';

abstract class DeviceRepository {
  Future<Either<Failure, DeviceListEntity>> getDeviceList({required int offset});
}
