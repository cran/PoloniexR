PoloniexR
================

[![Travis-CI Build Status](https://travis-ci.org/VermeirJellen/PoloniexR.svg?branch=master)](https://travis-ci.org/VermeirJellen/PoloniexR)

This package provides a user-friendly R interface to the Poloniex (Cryptocurrency Trading) REST API.

Installation
--------------------------------------

The package has been submitted to CRAN and will most likely be released in the near future (after approval). After the release date, the package can be installed in the usual manner:

``` r
install.packages("PoloniexR")
```

Before the release date, the package can be installed from github by using the `devtools` utility:

``` r
# install.packages("devtools") # if devtools currently not installed
devtools::install_github("VermeirJellen/PoloniexR")
```

Following the installation, the library can be loaded: `library(PoloniexR)`.

PoloniexPublicAPI / PoloniexTradingAPI
--------------------------------------

The package exposes 2 S4 classes to the users:

-   `PoloniexPublicAPI`: Consists of wrapper methods on top of the Poloniex Public REST API.
-   `PoloniexTradingAPI`: Consists of wrapper methods on top of the Poloniex Trading REST API.

Methods provided by the `PoloniexPublicAPI`:

-   `ReturnTicker`
-   `Return24hVolume`
-   `ReturnOrderBook`
-   `ReturnTradeHistory`
-   `ReturnChartData`
-   `ReturnCurrencies`
-   `ReturnLoanOrders`

Methods provided by the `PoloniexTradingAPI`:

-   **ProcessTradingRequest()**: Allows the users to call any of the trading API methods that are provided by Poloniex.
-   `ReturnBalances`
-   `ReturnCompleteBalances`

Use`?<function.name>` to read full I/O specs and function documentation. cfr `?ReturnTicker`.

**Examples are provided in the sections below**

### PUBLIC API - EXAMPLES

#### ReturnTicker

Run `?ReturnTicker` for additional function documentation.

``` r
library(PoloniexR)
poloniex.public <- PoloniexPublicAPI()
ticker.info     <- ReturnTicker(poloniex.public)
head(ticker.info)
```

    ##          id       last  lowestAsk highestBid percentChange    baseVolume
    ## BTC_BCN   7 0.00000061 0.00000062 0.00000061   -0.11594202  237.75162490
    ## BTC_BELA  8 0.00008300 0.00008303 0.00008302   -0.00156381  190.14654746
    ## BTC_BLK  10 0.00012268 0.00012281 0.00012268   -0.09098992  268.85301544
    ## BTC_BTCD 12 0.02330672 0.02377138 0.02351052    0.01293928   40.86744262
    ## BTC_BTM  13 0.00025509 0.00025741 0.00025510   -0.12682275   15.17865271
    ## BTC_BTS  14 0.00007084 0.00007084 0.00007083   -0.07350248 3365.46596597
    ##                 quoteVolume isFrozen   high24hr    low24hr
    ## BTC_BCN  380502961.74155170        0 0.00000070 0.00000057
    ## BTC_BELA   2347915.33596919        0 0.00008511 0.00007557
    ## BTC_BLK    2202012.89035315        0 0.00016600 0.00010553
    ## BTC_BTCD      1825.01294801        0 0.02377139 0.02111147
    ## BTC_BTM      58244.42310928        0 0.00029213 0.00024126
    ## BTC_BTS   48841637.36506472        0 0.00007727 0.00006233

#### Return24hVolume

Run `?Return24hVolume` for additional function documentation.

``` r
poloniex.public <- PoloniexPublicAPI()
volume.info <- Return24hVolume(poloniex.public)
head(volume.info$volume.pairs)
```

    ##               pair1        pair2
    ## BTC_BCN   237.75162 3.805030e+08
    ## BTC_BELA  190.14655 2.347915e+06
    ## BTC_BLK   268.85302 2.202013e+06
    ## BTC_BTCD   40.86744 1.825013e+03
    ## BTC_BTM    15.17865 5.824442e+04
    ## BTC_BTS  3365.09927 4.883805e+07

``` r
volume.info$volume.totals
```

    ##                   BTC            ETH              USDT            XMR
    ## volume 82091.30031820 14390.57602507 56112825.95730906 65881.59253857
    ##              XUSD
    ## volume 0.00000000

#### ReturnOrderBook

Run `?ReturnOrderBook` for additional function documentation.

``` r
pair       <- "BTC_NXT"
depth      <- 10
order.book <- ReturnOrderBook(poloniex.public,
                              pair  = pair,
                              depth = depth)
head(order.book$bid)
```

    ##          bid        amount
    ## 1 0.00004201 4970.23255763
    ## 2 0.00004200 2380.95238095
    ## 3 0.00004187  14330.069262
    ## 4 0.00004185  1093.5584753
    ## 5 0.00004184 2583.61422176
    ## 6 0.00004180 7179.50598057

``` r
head(order.book$ask)
```

    ##          ask         amount
    ## 1 0.00004203         27.972
    ## 2 0.00004209  1897.28662399
    ## 3 0.00004212   475.93342702
    ## 4 0.00004219     238.036225
    ## 5 0.00004229 12525.93311398
    ## 6 0.00004235             30

``` r
order.book$frozen
```

    ## [1] FALSE

``` r
order.book$seq
```

    ## [1] 37184775

``` r
pair       <- "all"
depth      <- 10
order.book <- ReturnOrderBook(poloniex.public,
                              pair  = pair,
                              depth = depth)

order.book$BTC_ETH$bid
```

    ##           bid     amount
    ## 1  0.09560000 0.52003864
    ## 2  0.09556590 0.00206619
    ## 3  0.09556340 0.00372187
    ## 4  0.09554732        2.9
    ## 5  0.09552588       3.01
    ## 6  0.09551724 0.00637036
    ## 7  0.09550480       2.92
    ## 8  0.09547912          3
    ## 9  0.09546629        3.1
    ## 10 0.09544302     20.018

``` r
order.book$BTC_ETH$ask
```

    ##           ask     amount
    ## 1  0.09562712  6.0021786
    ## 2  0.09566919          3
    ## 3  0.09568858        0.2
    ## 4  0.09570759       2.84
    ## 5  0.09573016        2.8
    ## 6  0.09574036       3.08
    ## 7  0.09574037 3.13199029
    ## 8  0.09575283      3.015
    ## 9  0.09577057       2.87
    ## 10 0.09579392        3.1

``` r
order.book$BTC_ETH$frozen
```

    ## [1] FALSE

``` r
order.book$BTC_ETH$seq
```

    ## [1] 368985775

#### ReturnTradeHistory

Run `?ReturnTradeHistory` for additional function documentation.

``` r
Sys.setenv(tz="UTC")
pair   <- "BTC_ETH"
from   <- as.POSIXct("2017-07-01 00:00:00 UTC")
to     <- as.POSIXct("2017-07-04 00:00:00 UTC")

trades.data <- ReturnTradeHistory(theObject = poloniex.public,
                                  pair      = pair,
                                  from      = from,
                                  to        = to)

tail(trades.data)
```

    ##                     globalTradeID tradeID    type  rate        
    ## 2017-07-03 23:59:41 "183463123"   "29391027" "buy" "0.10833668"
    ## 2017-07-03 23:59:44 "183463138"   "29391033" "buy" "0.10857999"
    ## 2017-07-03 23:59:46 "183463154"   "29391034" "buy" "0.10863293"
    ## 2017-07-03 23:59:55 "183463170"   "29391037" "buy" "0.10865144"
    ## 2017-07-03 23:59:55 "183463169"   "29391036" "buy" "0.10863293"
    ## 2017-07-03 23:59:55 "183463168"   "29391035" "buy" "0.10846100"
    ##                     amount        total       
    ## 2017-07-03 23:59:41 "0.99125595"  "0.10738937"
    ## 2017-07-03 23:59:44 "0.22670282"  "0.02461538"
    ## 2017-07-03 23:59:46 "14.87694700" "1.61612634"
    ## 2017-07-03 23:59:55 "4.59690907"  "0.49946079"
    ## 2017-07-03 23:59:55 "2.19075626"  "0.23798827"
    ## 2017-07-03 23:59:55 "0.92199039"  "0.09999999"

#### ReturnChartData

Run `?ReturnChartData` for additional function documentation.

``` r
Sys.setenv(tz="UTC")
pair    <- "BTC_ETH"
from    <- as.POSIXct("2015-01-01 00:00:00 UTC")
to      <- as.POSIXct("2018-04-09 00:00:00 UTC")
period  <- "4H"

chart.data <- ReturnChartData(theObject = poloniex.public,
                              pair      = pair,
                              from      = from,
                              to        = to,
                              period    = period)

tail(chart.data)
```

    ##                           high        low       open      close   volume
    ## 2017-07-07 20:00:00 0.09861897 0.09560000 0.09794200 0.09637649 2904.181
    ## 2017-07-08 00:00:00 0.09700501 0.09314993 0.09633197 0.09606020 6122.119
    ## 2017-07-08 04:00:00 0.09828000 0.09569548 0.09606020 0.09670868 2002.657
    ## 2017-07-08 08:00:00 0.09737591 0.09387972 0.09670867 0.09484001 3395.786
    ## 2017-07-08 12:00:00 0.09828000 0.09468260 0.09484000 0.09793757 3256.373
    ## 2017-07-08 16:00:00 0.09830000 0.09401001 0.09793757 0.09574037 2095.198
    ##                     quotevolume weightedaverage
    ## 2017-07-07 20:00:00    30012.90      0.09676443
    ## 2017-07-08 00:00:00    64453.26      0.09498540
    ## 2017-07-08 04:00:00    20653.35      0.09696523
    ## 2017-07-08 08:00:00    35667.89      0.09520567
    ## 2017-07-08 12:00:00    33710.11      0.09659930
    ## 2017-07-08 16:00:00    21823.88      0.09600481

``` r
# install.packages("quantmod")
library(quantmod)
chart.plot <- chart_Series(chart.data[, "close"],
                           type   = "line",
                           name   = "BTC_ETH",
                           subset = "201705/201708")
chart.plot <- add_MACD()
chart.plot <- add_BBands()
chart.plot <- add_RSI()
chart.plot
```

![](inst/extdata/unnamed-chunk-7-1.png)

#### ReturnCurrencies

Run `?ReturnCurrencies` for function additional function documentation.

``` r
currencies <- ReturnCurrencies(poloniex.public)
head(currencies)
```

    ##      id           name      txFee minConf disabled delisted frozen
    ## 1CR   1        1CRedit 0.01000000       3        0        1      0
    ## ABY   2        ArtByte 0.01000000       8        0        1      0
    ## AC    3       AsiaCoin 0.01000000      15        0        1      0
    ## ACH   4 Altcoin Herald 0.00000000       5        0        1      0
    ## ADN   5          Aiden 0.01000000      24        0        1      0
    ## AEON  6      AEON Coin 0.01000000      10        0        1      0

#### ReturnLoanOrders

Run `?ReturnLoanOrders` for additional function documentation.

``` r
currency        <- "BTC"
loan.orders     <- ReturnLoanOrders(poloniex.public,
                                    currency = currency)
head(loan.orders$offers)
```

    ##         rate     amount min.days max.days
    ## 1 0.00079900 6.33131018        2        2
    ## 2 0.00079925 0.01064195        2        2
    ## 3 0.00079997 0.05277320        2        2
    ## 4 0.00079998 0.41191457        2        2
    ## 5 0.00080000 2.12478816        2        2
    ## 6 0.00080049 0.01000000        2        2

``` r
head(loan.orders$demands)
```

    ##         rate     amount min.days max.days
    ## 1 0.05000000 0.00759280        2        2
    ## 2 0.00060010 0.10957506        2        2
    ## 3 0.00060000 0.11550554        2        2
    ## 4 0.00030000 0.05584450        2        2
    ## 5 0.00010010 0.30211701        2        2
    ## 6 0.00010000 0.20208797        2        2

#### GET / SET public API URL and command Strings.

Note: Changing these settings is only useful if Poloniex makes changes to the base URL and/or command strings in the future. If nothing changes, object construction can remain default.

``` r
library(PoloniexR)

poloniex.public <- PoloniexPublicAPI() # Default constructor
GetPoloniexPublicURL(poloniex.public)
```

    ## [1] "https://poloniex.com/public?"

``` r
poloniex.public <- PoloniexPublicAPI(base.url                     = "https://not_working/public?")
poloniex.public <- SetPoloniexPublicURL(poloniex.public, base.url = "https://poloniex.com/public?")
GetPoloniexPublicURL(poloniex.public)
```

    ## [1] "https://poloniex.com/public?"

``` r
GetPoloniexPublicCommands(poloniex.public)
```

    ## $returnTicker
    ## [1] "returnTicker"
    ## 
    ## $return24hVolume
    ## [1] "return24hVolume"
    ## 
    ## $returnOrderBook
    ## [1] "returnOrderBook"
    ## 
    ## $returnTradeHistory
    ## [1] "returnTradeHistory"
    ## 
    ## $returnChartData
    ## [1] "returnChartData"
    ## 
    ## $returnCurrencies
    ## [1] "returnCurrencies"
    ## 
    ## $returnLoanOrders
    ## [1] "returnLoanOrders"

``` r
commands.new <- list(returnTicker    = "returnTicker.new",
                     return24hVolume = "return24hVolume.new")

# missing commands are kept default
poloniex.public <- SetPoloniexPublicCommands(poloniex.public,
                                             commands = commands.new)
```

    ## Warning in SetPoloniexPublicCommands(poloniex.public, commands =
    ## commands.new): Not all commands were set in the API command list input
    ## arguments: Setting missing commands to their respective default values.

``` r
GetPoloniexPublicCommands(poloniex.public)
```

    ## $returnTicker
    ## [1] "returnTicker.new"
    ## 
    ## $return24hVolume
    ## [1] "return24hVolume.new"
    ## 
    ## $returnOrderBook
    ## [1] "returnOrderBook"
    ## 
    ## $returnTradeHistory
    ## [1] "returnTradeHistory"
    ## 
    ## $returnChartData
    ## [1] "returnChartData"
    ## 
    ## $returnCurrencies
    ## [1] "returnCurrencies"
    ## 
    ## $returnLoanOrders
    ## [1] "returnLoanOrders"

### TRADING API - EXAMPLES

Trading should be enabled in your Poloniex settings and you should have access to your account key / secret in order to construct the `PoloniexTradingAPI` object. Internally, all calls to the trading API are sent via HTTP POST. The POST data itself is signed with your key's secret according to the HMAC-SHA512 method.

#### ReturnBalances

Wrapper on top of `ProcessTradingRequest` to fetch account balance info. Run `?ReturnBalances` for additional info.

``` r
key    = your.key
secret = your.secret
poloniex.trading <- PoloniexTradingAPI(key    = key,
                                       secret = secret)
balances <- ReturnBalances(poloniex.trading)
head(balances)
```

#### ReturnCompleteBalances

Wrapper on top of `ProcessTradingRequests` to fetch complete (margin, lending, ..) account balance info. Run `?ReturnCompleteBalances` for additional info.

``` r
balances <- ReturnCompleteBalances(poloniex.trading)
head(balances)

balances <- ReturnCompleteBalances(poloniex.trading, all.balances=TRUE)
head(balances)
```

#### ProcessTradingRequest

This function allows the users to call any of the trading functions that are accessible through the Poloniex Trading API. The `ProcessTradingRequest` method takes a command string as input argument in combination with a list of additional input arguments that correspond to the particular command in question.

Some examples:

``` r
##########################
# returnDepositAddresses #
##########################
?ProcessTradingRequest
deposit.addresses <- ProcessTradingRequest(poloniex.trading,
                                           command = poloniex.trading@commands$returnDepositAddresses)

#########################
# generateNewAddress ####
#########################
new.address <- ProcessTradingRequest(poloniex.trading,
                                     command = poloniex.trading@commands$generateNewAddress,
                                     args    = list(currency = "BTC"))


##############################
# returnDepositsWithdrawals ##
##############################
account.activity <- ProcessTradingRequest(poloniex.trading,
                                          command = poloniex.trading@commands$returnDepositWithdrawals,
                                          args = list(start = as.numeric(as.POSIXct("2017-01-01 00:00:00 UTC"))),
                                                      end   = as.numeric(as.POSIXct("2018-01-01 00:00:00 UTC")))

##############################
### returnOpenOrders #########
##############################
open.orders <- ProcessTradingRequest(poloniex.trading,
                                     command = poloniex.trading@commands$returnOpenOrders,
                                     args    = list(currencyPair = "BTC_ETH"))

open.orders.all <- ProcessTradingRequest(poloniex.trading,
                                         command = poloniex.trading@commands$returnOpenOrders,
                                         args    = list(currencyPair = "all"))


##############################
### Return Trade History #####
##############################
trade.history <-  ProcessTradingRequest(poloniex.trading,
                                        command = poloniex.trading@commands$returnTradeHistory,
                                        args = list(currencyPair = "BTC_ETH",
                                                    start        = as.numeric(as.POSIXct("2017-01-01 00:00:00 UTC"))),
                                                    end          = as.numeric(as.POSIXct("2018-01-01 00:00:00 UTC")))

# no range specified: limit to one day
trade.history.all <-  ProcessTradingRequest(poloniex.trading,
                                            command = poloniex.trading@commands$returnTradeHistory,
                                            args    = list(currencyPair = "all"))


##############################
### ReturnOrderTrades ########
##############################
order.trades <- ProcessTradingRequest(poloniex.trading,
                                      command = poloniex.trading@commands$returnOrderTrades,
                                      args    = list(orderNumber = 1))

##############################
######### Buy ################
##############################
buy.order <- ProcessTradingRequest(poloniex.trading,
                                   command = poloniex.trading@commands$buy,
                                   args    = list(currencyPair      = "BTC_ETH",
                                                  rate              = 0.01,
                                                  amount            = 1,
                                                  immediateOrCancel = 1)) # fillOrKill, postOnly

##############################
######### Sell ###############
##############################
sell.order <- ProcessTradingRequest(poloniex.trading,
                                    command = poloniex.trading@commands$sell,
                                    args    = list(currencyPair      = "BTC_ETH",
                                                   rate              = 0.01,
                                                   amount            = 1))


##############################
######### cancelOrder ########
##############################
cancel.order <- ProcessTradingRequest(poloniex.trading,
                                      command = poloniex.trading@commands$cancelOrder,
                                      args    = list(orderNumber = 1))

##############################
######### moveOrder ##########
##############################
move.order <- ProcessTradingRequest(poloniex.trading,
                                    command = poloniex.trading@commands$moveOrder,
                                    args    = list(orderNumber       = 1,
                                                   rate              = 0.1,
                                                   amount            = 1,
                                                   immediateOrCancel = 1)) # postOnly
```

Other Trade functionality (View Poloniex API documentation):

-   withdraw: `poloniex.trading@commands$withdraw`
-   returnFeeInfo: `poloniex.trading@commands$returnFeeInfo`
-   returnAvailableAccountBalances: `poloniex.trading@commands$returnAvailableAccountBalances`
-   returnTradeableBalances: `poloniex.trading@commands$returnTradeableBalances`
-   transferBalance: `poloniex.trading@commands$transferBalance`
-   returnMarginAccountSummary: `poloniex.trading@commands$returnMarginAccountSummary`
-   marginBuy: `poloniex.trading@commands$marginBuy`
-   marginSell: `poloniex.trading@commands$marginSell`
-   getmarginPosition: `poloniex.trading@getMarginPosition`
-   closeMarginPosition: `poloniex.trading@closeMarginPosition`
-   createLoanOffer: `poloniex.trading@commands$createLoanOffer`
-   cancelLoanOffer: `poloniex.trading@commands$cancelLoanOffer`
-   returnOpenLoanOffers: `poloniex.trading@commands$returnOpenLoanOffers`
-   returnActiveLoans: `poloniex.trading@commands$returnActiveLoans`
-   returnLendingHistory: `poloniex.trading@commands$returnLendingHistory`
-   toggleAutoRenew: `poloniex.trading@commands$toggleAutoRenew`

#### GETTERS / SETTERS

Same remark as before: Modification of the object fields are only required if and when Poloniex modifies the trading API base URL and/or the command strings. Default constructor can be used for now.

``` r
###########################################################
#################### GETTERs / SETTERS ####################
###########################################################

##################
# Get Trading URL#
##################
GetPoloniexTradingURL(poloniex.trading)

##################
# Set Trading URL#
##################
?SetPoloniexTradingURL
poloniex.trading <- PoloniexTradingAPI(trading.base.url = "https://not_working/tradingApi?",
                                       key              = your.key,
                                       secret           = your.secret)

poloniex.trading <- SetPoloniexTradingURL(poloniex.trading,
                                          trading.base.url = "https://poloniex.com/tradingApi?")
GetPoloniexTradingURL(poloniex.trading)

#######################
# Get Trading commands#
#######################
?GetPoloniexTradingCommands
GetPoloniexTradingCommands(poloniex.trading)

#######################
# Set Trading Commands#
#######################
?SetPoloniexTradingCommands
commands.new <- list(returnTradeHistory = "returnTradeHistory.new",
                     withdraw = "withdraw.new")
poloniex.trading <- SetPoloniexTradingCommands(poloniex.trading,
                                               commands = commands.new)

GetPoloniexTradingCommands(poloniex.trading)
commands.new <- list(returnTicker    = "returnTicker.new",
                     return24hVolume = "return24hVolume.new")
poloniex.trading <- SetPoloniexTradingCommands(poloniex.trading,
                                               commands = commands.new)
GetPoloniexPublicCommands(poloniex.public)
```

Donations
---------

If you find this software useful and/or you would like to see additional extensions, feel free to donate some crypto:

-   BTC: 1QHtZLZ15Cmj4FPr5h5exDjYciBDhh7mzA
-   LTC: LhKf6MQ7LY1k8YMaAq9z3APz8kVyFX3L2M
-   ETH: 0x8E44D7C96896f2e0Cd5a6CC1A2e6a3716B85B479
-   DASH: Xvicgp3ga3sczHtLqt3ekt7fQ62G9KaKNB

Or preferably, donate some of my favorite coins :)

-   GAME: GMxcsDAaHCBkLnN42Fs9Dy1fpDiLNxSKX1
-   WAVES: 3PQ8KFdw2nWxQATsXQj8NJvSa1VhBcKePaf

Licensing
---------

Copyright 2017 Essential Data Science Consulting ltd. ([EssentialQuant.com](http://essentialquant.com "EssentialQuant") / <jellenvermeir@essentialquant.com>). This software is copyrighted under the MIT license: View added [LICENSE](./LICENSE) file.
