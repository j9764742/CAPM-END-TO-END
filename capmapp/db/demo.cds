namespace capmapp.db;
using { capmapp.db.commons as exter } from './commons';
using { cuid,temporal,managed } from '@sap/cds/common';



context master {
    //first table for storing student data

    entity students : exter.address{
        key ID: exter.Guid;
        NAME: String(80);
        CLASS: Association to one standards;
        GENDER : String(1);

    }
    entity books{
        key ID: exter.Guid;
        BOOKNAME: String(30);
        AUTHOR :String(80);
    }
//FOREIGN KEY RELATIONS
 entity standards{
    key ID: Int16;
    CLASSNAME:String(10);
    SECTIONS:Int16;
    CLASSTEACHER: String(80);
 }
}

context trans {
    
    entity rentals :cuid,temporal,managed{
        student: Association to one master.students;
        book:Association to one master.books;

    }
}