interface BuyItemsInterface {
    OneWay:

    RequestResponse:
        checkCatalogue()(string)
        buyItems( Item[] )( void )
}