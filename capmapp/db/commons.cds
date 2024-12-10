namespace capmapp.db.commons;

using { Currency } from '@sap/cds/common';



type Gender :String(1) enum{
    male = 'M';
    female = 'F';
    undisclosed = 'U'
}

type AmountT : Decimal(10,2)@(
Semantic.amount.currencyCode: 'CURRENCY_CODE',
sap.unit : 'CURRENCY_CODE'
);

aspect Amount:{
        CURRENCY: Currency;
        GROSS_AMOUNT:AmountT @(title:'Gross Amount');
        NET_AMOUNT:AmountT @(title:'Net Amount');
        TAX_AMOUNT:AmountT @(title:'Tax Amount');
}

type PhoneNumber:String(30)@assert.format : '^(\+?\d{1,2}\s?)?(\(?\d{3}\)?[\s.-]?)\d{3}[\s.-]?\d{4}$';
type EmailAddress: String(80)@assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';



//  type name to  reuse custom data types 
    type Guid: String(32);

    //aspect to hold address data
    //TO INCLUDE ADDRESS TO THE TABLE 
    aspect address{
        HOUSENO:Int16;
        STREET:String(32);
        CITY:String(10);
        COUNTRY:String(3);

    }