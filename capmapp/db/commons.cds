namespace capmapp.db.commons;

 //type name to  reuse custom data types 
    type Guid: String(32);

    //aspect to hold address data
    //TO INCLUDE ADDRESS TO THE TABLE 
    aspect address{
        HOUSENO:Int16;
        STREET:String(32);
        CITY:String(10);
        COUNTRY:String(3);

    }