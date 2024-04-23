import 'package:hotel_pra_hoje/src/core/domain/exceptions/repository_exception.dart';

import '../../utilities/helpers/result.dart';
import '../dtos/credential_dto.dart';

abstract interface class ICredentialRepository {
  Future<Result<RepositoryException, bool>> save({required CredentialDto credentialDto});

  Future<Result<RepositoryException, CredentialDto>> getCredential();

  Future<Result<RepositoryException, bool>> removeKey();
}
