// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i18n.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$i18nHash() => r'7686ea48dc2d40e85a65f761b6b21eade36c6f52';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [i18n].
@ProviderFor(i18n)
const i18nProvider = I18nFamily();

/// See also [i18n].
class I18nFamily extends Family<I18n> {
  /// See also [i18n].
  const I18nFamily();

  /// See also [i18n].
  I18nProvider call(BuildContext context) {
    return I18nProvider(context);
  }

  @override
  I18nProvider getProviderOverride(covariant I18nProvider provider) {
    return call(provider.context);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'i18nProvider';
}

/// See also [i18n].
class I18nProvider extends AutoDisposeProvider<I18n> {
  /// See also [i18n].
  I18nProvider(BuildContext context)
    : this._internal(
        (ref) => i18n(ref as I18nRef, context),
        from: i18nProvider,
        name: r'i18nProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$i18nHash,
        dependencies: I18nFamily._dependencies,
        allTransitiveDependencies: I18nFamily._allTransitiveDependencies,
        context: context,
      );

  I18nProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(I18n Function(I18nRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: I18nProvider._internal(
        (ref) => create(ref as I18nRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<I18n> createElement() {
    return _I18nProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is I18nProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin I18nRef on AutoDisposeProviderRef<I18n> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _I18nProviderElement extends AutoDisposeProviderElement<I18n>
    with I18nRef {
  _I18nProviderElement(super.provider);

  @override
  BuildContext get context => (origin as I18nProvider).context;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
