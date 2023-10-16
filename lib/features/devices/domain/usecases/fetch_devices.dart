import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/device_entity.dart';
import '../repositories/device_repository.dart';

class FetchDevices extends UseCase<DeviceListEntity,int>{

  final DeviceRepository deviceRepository;

  FetchDevices({required this.deviceRepository});

  @override
  Future<Either<Failure, DeviceListEntity>> call({required int params}) async {
   return await deviceRepository.getDeviceList(offset: params);
  }
}