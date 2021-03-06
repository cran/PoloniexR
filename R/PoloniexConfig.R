Sys.setenv(TZ="UTC")
public.commands.default <- list(returnTicker = "returnTicker",
                                return24hVolume = "return24hVolume",
                                returnOrderBook = "returnOrderBook",
                                returnTradeHistory = "returnTradeHistory",
                                returnChartData = "returnChartData",
                                returnCurrencies = "returnCurrencies",
                                returnLoanOrders = "returnLoanOrders")

trading.commands.default <- list(returnBalances = "returnBalances",
                                 returnCompleteBalances = "returnCompleteBalances",
                                 returnDepositAddresses = "returnDepositAddresses",
                                 generateNewAddress = "generateNewAddress",
                                 returnDepositWithdrawals = "returnDepositWithdrawals",
                                 returnOpenOrders = "returnOpenOrders",
                                 returnTradeHistory = "returnTradeHistory",
                                 returnOrderTrades = "returnOrderTrades",
                                 buy = "buy",
                                 sell = "sell",
                                 cancelOrder = "cancelOrder",
                                 moveOrder = "moveOrder",
                                 withdraw = "withdraw",
                                 returnFeeInfo = "returnFeeInfo",
                                 returnAvailableAccountBalances = "returnAvailableAccountBalances",
                                 returnTradeBalances = "returnTradeBalances",
                                 transferBalance = "transferBalance",
                                 returnMarginAccountSummary = "returnMarginAccountSummary",
                                 marginBuy = "marginBuy",
                                 marginSell = "marginSell",
                                 getMarginPosition = "getMarginPosition",
                                 closeMarginPosition = "closeMarginPosition")
