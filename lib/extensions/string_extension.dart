extension StringExtension on String {
  String toCapitalize() {
    if (isEmpty) return this;
    return split(' ')
        .where((word) => word.isNotEmpty)
        .map(
          (word) =>
              '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }
}
