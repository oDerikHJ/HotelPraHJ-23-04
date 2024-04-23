import 'package:hotel_pra_hoje/src/core/domain/dtos/credential_dto.dart';
import 'package:hotel_pra_hoje/src/core/domain/exceptions/datasource_exception.dart';

import 'package:hotel_pra_hoje/src/core/domain/exceptions/repository_exception.dart';
import 'package:hotel_pra_hoje/src/core/infrastructure/datasources/i_local_datasource.dart';
import 'package:hotel_pra_hoje/src/core/infrastructure/mapping/credential_mapper.dart';

import 'package:hotel_pra_hoje/src/core/utilities/helpers/result.dart';

import '../../domain/repositories/i_credential_repository.dart';

class CredentialRepository implements ICredentialRepository {
  final ILocalDatasource datasource;

  CredentialRepository({required this.datasource});

  final String keyCredential = 'credential';

  @override
  Future<Result<RepositoryException, bool>> save({ required CredentialDto credentialDto}) async {
    try {
      final map = CredentialMapper.toMap(dto: credentialDto);
      final response = await datasource.save(keyCredential, map);
      return (null, response);
    } on DatasourceException catch (e) {
      return (RepositoryException(e.message), null);
    }
  }

  @override
  Future<Result<RepositoryException, CredentialDto>> getCredential() async {
    try {
      final map = await datasource.readString(keyCredential);
      if (map == null) return (null, CredentialDto.empty());

      final response = CredentialMapper.fromMap(map: map);
      return (null, response);
    } on DatasourceException catch (e) {
      return (RepositoryException(e.message), null);
    }
  }

  @override
  Future<Result<RepositoryException, bool>> removeKey() async {
    try {
      final response = await datasource.removeKey(keyCredential);
      return (null, response);
    } on DatasourceException catch (e) {
      return (RepositoryException(e.message), null);
    }
  }
}
