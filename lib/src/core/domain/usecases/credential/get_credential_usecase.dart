import 'package:hotel_pra_hoje/src/core/domain/dtos/credential_dto.dart';
import 'package:hotel_pra_hoje/src/core/domain/exceptions/application_exception.dart';
import 'package:hotel_pra_hoje/src/core/domain/repositories/i_credential_repository.dart';

import '../../../utilities/helpers/result.dart';

abstract interface class IGetCredentialUsecase {
  Future<Result<ApplicationException, CredentialDto>> call();
}

class GetCredentialUsecase implements IGetCredentialUsecase {
  final ICredentialRepository repository;
  GetCredentialUsecase({
    required this.repository,
  });

  @override
  Future<Result<ApplicationException, CredentialDto>> call() async {
    final response = await repository.getCredential();
    if (response.isFailure) {
      final failure = response.getFailure;
      return (ApplicationException(failure!.message), null);
    }
    return (null, response.getSuccess);
  }
}
