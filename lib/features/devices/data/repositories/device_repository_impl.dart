import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/device_entity.dart';
import '../../domain/repositories/device_repository.dart';
import '../data_sources/device_data_source.dart';

class DeviceRepositoryImpl extends DeviceRepository {
  final DeviceDataSource deviceDataSource;

  DeviceRepositoryImpl({
    required this.deviceDataSource,
  });

  @override
  Future<Either<Failure, DeviceListEntity>> getDeviceList(
      {required int offset}) async {
    try {
      DeviceListEntity deviceListEntity =
          await deviceDataSource.fetchDeviceList(offset: offset);
      return Right(deviceListEntity);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, DeviceListEntity>> searchDevices(
      {required String searchText}) async {
    try {
      DeviceListEntity deviceListEntity =
          await deviceDataSource.searchDevices(searchText: searchText);
      return Right(deviceListEntity);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
