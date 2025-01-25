sealed class APIException implements Exception {
  APIException(this.message);
  final String message;

  @override
  String toString() => message; // Override toString untuk menampilkan pesan
}

class InvalidApiKeyException extends APIException {
  InvalidApiKeyException() : super('Invalid API key');
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('No Internet connection');
}

class CityNotFoundException extends APIException {
  CityNotFoundException()
      : super(
            'Kota/Kabupaten yang dicari tidak ditemukan. Silakan cari kembali.');
}

class UnknownException extends APIException {
  UnknownException() : super('Some error occurred');
}
