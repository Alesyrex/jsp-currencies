package com.epam.rd.jsp.currencies;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Currencies {
    public static final int RATE_SCALE = 5;
    public static final int DIVIDE_SCALE = 10;
    private final Map<String, BigDecimal> curs = new TreeMap<>();

    public void addCurrency(String currency, BigDecimal weight) {
        curs.put(currency, weight);
    }

    public Collection<String> getCurrencies() {
        List<String> currencies = new ArrayList<>(curs.keySet());
        Collections.sort(currencies);
        return currencies;
    }

    public Map<String, BigDecimal> getExchangeRates(String referenceCurrency) {
        Map<String, BigDecimal> currencies = new TreeMap<>();
        BigDecimal rate = curs.get(referenceCurrency);
        for (Map.Entry<String, BigDecimal> entryCurs : curs.entrySet()) {
            currencies.put(entryCurs.getKey(), rate.divide(entryCurs.getValue(), RATE_SCALE, RoundingMode.HALF_UP));
        }
        return currencies;
    }

    public BigDecimal convert(BigDecimal amount, String sourceCurrency, String targetCurrency) {
        BigDecimal rateSource = curs.get(sourceCurrency);
        BigDecimal rateTarget = curs.get(targetCurrency);
        BigDecimal exchange = rateSource.divide(rateTarget, DIVIDE_SCALE, RoundingMode.HALF_UP);

        return amount.multiply(exchange).setScale(RATE_SCALE, RoundingMode.HALF_UP);
    }
}
