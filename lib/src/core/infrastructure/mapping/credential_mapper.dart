import 'package:hotel_pra_hoje/src/core/domain/dtos/credential_dto.dart';

class CredentialMapper {
  static CredentialDto fromMap({required Map map}) {
    return CredentialDto(token: map['token'] ?? '');
  }

  static Map toMap({required CredentialDto dto}) {
    return {
      'token': dto.token,
    };
  }
}
