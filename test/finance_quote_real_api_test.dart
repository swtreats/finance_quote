// Copyright 2019 Ismael Jiménez. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:finance_quote/finance_quote.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

// to regenerate, flutter pub run build_runner build
//import 'finance_quote_real_api_test.mocks.dart';


// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
//class MockClient extends Mock implements http.Client {}
@GenerateMocks([http.Client])

void main() {
  group('downloadQuotePrice/downloadRawQuote Test [FinanceQuote] - Real API',
      () {
    test('Yahoo', () async {
      late Map<String, Map<String, String>> quote;
      try {
        quote = await FinanceQuote.getPrice(
            quoteProvider: QuoteProvider.yahoo, symbols: <String>['KO']);
      } catch (e) {
        expect(e, 'No exception');
      }

      expect(quote.keys.length, 1);
      expect(quote['KO']!.keys.length, 2);
    });

    test('MorningstarDe', () async {
      late Map<String, Map<String, String>> quote;
      try {
        quote = await FinanceQuote.getPrice(
            quoteProvider: QuoteProvider.morningstarDe,
            symbols: <String>['0P000001BW']);
      } catch (e) {
        expect(e, 'No exception');
      }

      expect(quote.keys.length, 1);
      expect(quote['0P000001BW']!.keys.length, 2);
    });

    test('MorningstarEs', () async {
      late Map<String, Map<String, String?>> quote;
      try {
        quote = await FinanceQuote.getPrice(
            quoteProvider: QuoteProvider.morningstarEs,
            symbols: <String>['0P000001BW']);
      } catch (e) {
        expect(e, 'No exception');
      }

      expect(quote.keys.length, 1);
      expect(quote['0P000001BW']!.keys.length, 2);
    });

    test('CoinMarketCap', () async {
      late Map<String, Map<String, String>> quote;
      try {
        quote = await FinanceQuote.getPrice(
            quoteProvider: QuoteProvider.coinmarketcap,
            symbols: <String>['BTC']);
      } catch (e) {
        expect(e, 'No exception');
      }

      expect(quote.keys.length, 1);
      expect(quote['BTC']!.keys.length, 2);
    });

    test('Coincap', () async {
      late Map<String, Map<String, String>> quote;
      try {
        quote = await FinanceQuote.getPrice(
            quoteProvider: QuoteProvider.coincap, symbols: <String>['bitcoin']);
      } catch (e) {
        expect(e, 'No exception');
      }

      expect(quote.keys.length, 1);
      expect(quote['bitcoin']!.keys.length, 2);
    });

    test('Binance', () async {
      late Map<String, Map<String, String>> quote;
      try {
        quote = await FinanceQuote.getPrice(
            quoteProvider: QuoteProvider.binance, symbols: <String>['BTCUSDT']);
      } catch (e) {
        expect(e, 'No exception');
      }

      expect(quote.keys.length, 1);
      expect(quote['BTCUSDT']!.keys.length, 2);
    });
  });
}
