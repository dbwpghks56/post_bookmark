extension RouteUtil on String {
  String changeIdtoValue({required int id}) {
    return replaceFirst(':id', id.toString());
  }
}
