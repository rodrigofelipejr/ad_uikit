enum ADBehavior {
  disabled,
  empty,
  error,
  loading,
  regular;

  bool get isDisabled => this == ADBehavior.disabled;
  bool get isEmpty => this == ADBehavior.empty;
  bool get isError => this == ADBehavior.error;
  bool get isLoading => this == ADBehavior.loading;
  bool get isRegular => this == ADBehavior.regular;
}
