import 'package:hotel_pra_hoje/src/core/domain/exceptions/application_exception.dart';
import 'package:hotel_pra_hoje/src/core/domain/repositories/i_credential_repository.dart';
import '../../../utilities/helpers/result.dart';

abstract interface class IRemoveCredentialUsecase {
  Future<Result<ApplicationException, bool>> call();
}

class RemoveCredentialUsecase implements IRemoveCredentialUsecase {
  final ICredentialRepository repository;
  RemoveCredentialUsecase({
    required this.repository,
  });

  @override
  Future<Result<ApplicationException, bool>> call() async {
    final response = await repository.removeKey();
    if (response.isFailure) {
      final failure = response.getFailure;
      return (ApplicationException(failure!.message), null);
    }
    return (null, response.getSuccess);
  }
}
