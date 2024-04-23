import 'package:hotel_pra_hoje/src/core/domain/dtos/credential_dto.dart';
import 'package:hotel_pra_hoje/src/core/domain/exceptions/application_exception.dart';
import 'package:hotel_pra_hoje/src/core/domain/repositories/i_credential_repository.dart';

import '../../../utilities/helpers/result.dart';

abstract interface class ISaveCredentialUsecase {
  Future<Result<ApplicationException, bool>> call({required CredentialDto credentialDto});
}

class SaveCredentialUsecase implements ISaveCredentialUsecase {
  final ICredentialRepository repository;
  SaveCredentialUsecase({
    required this.repository,
  });

  @override
  Future<Result<ApplicationException, bool>> call({required CredentialDto credentialDto}) async {
    final response = await repository.save(credentialDto: credentialDto);
    if (response.isFailure) {
      final failure = response.getFailure;
      return (ApplicationException(failure!.message), null);
    }
    return (null, response.getSuccess);
  }
}
