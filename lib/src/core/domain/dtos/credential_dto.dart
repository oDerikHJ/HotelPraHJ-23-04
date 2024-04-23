class CredentialDto {
  final String token;

  CredentialDto({required this.token});

  factory CredentialDto.empty() {
    return CredentialDto(token: '');
  }
}
