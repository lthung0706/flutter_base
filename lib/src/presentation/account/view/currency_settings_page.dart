import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_base/src/presentation/app/bloc/global_app_bloc.dart';

class CurrencySettingsPage extends StatelessWidget {
  const CurrencySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.currencyTitle)),
      body: BlocBuilder<GlobalAppBloc, GlobalAppState>(
        builder: (context, state) {
          final currentCurrency = state.currencyCode ?? 'VNĐ';
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ListTile(
                title: Text(context.l10n.defaultCurrency),
                subtitle: Text(currentCurrency),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showCurrencyPicker(context, currentCurrency);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _showCurrencyPicker(BuildContext context, String currentCurrency) {
    // A simple mock list of currencies.
    final currencies = ['VNĐ', 'USD', 'EUR', 'JPY', 'GBP', 'KRW', 'CNY'];
    String searchQuery = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            final filteredCurrencies = currencies
                .where(
                  (c) => c.toLowerCase().contains(searchQuery.toLowerCase()),
                )
                .toList();

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.selectCurrency,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: context.l10n.search,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: filteredCurrencies.length,
                      itemBuilder: (context, index) {
                        final currency = filteredCurrencies[index];
                        return ListTile(
                          title: Text(currency),
                          trailing: currentCurrency == currency
                              ? const Icon(Icons.check, color: Colors.blue)
                              : null,
                          onTap: () {
                            BlocProvider.of<GlobalAppBloc>(
                              context,
                              listen: false,
                            ).add(GlobalAppCurrencyChanged(currency));
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
