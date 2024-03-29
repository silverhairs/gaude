import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaude/src/features/features.dart';
import 'package:gaude/src/shared/shared.dart';
import 'package:ionicons/ionicons.dart';

class SettingsCurrencyPage extends StatefulWidget {
  const SettingsCurrencyPage({super.key, required this.settings});

  final AccountSettings settings;

  @override
  State<SettingsCurrencyPage> createState() => _SettingsCurrencyPageState();
}

class _SettingsCurrencyPageState extends State<SettingsCurrencyPage> {
  late Currency _selectedCurrency;
  @override
  void initState() {
    super.initState();
    _selectedCurrency = widget.settings.currency;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _updateCurrency();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(elevation: 1, title: const Text('Currency')),
        body: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const CenteredCircledIndicator(),
            orElse: SizedBox.shrink,
            loaded: (account) => ListView.separated(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                return ListTile(
                  key: ValueKey(account.settings!.currency.code),
                  title: Text('${currency.name} (${currency.code})'),
                  trailing: currency == _selectedCurrency
                      ? const Icon(Ionicons.checkmark_circle)
                      : null,
                  onTap: () => setState(() => _selectedCurrency = currency),
                );
              },
              separatorBuilder: (context, _) => const Divider(),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateCurrency() async {
    await context.read<AccountCubit>().updateSettings(
          widget.settings.copyWith(currency: _selectedCurrency),
        );
  }

  List<Currency> get currencies => [
        ...kPopularCurrencies.map(Currency.fromJson),
      ]..sort((a, b) => a.name.compareTo(b.name));
}
