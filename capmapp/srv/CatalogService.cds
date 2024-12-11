using { capmappDB.master,capmappDB.transaction } from '../db/data-model';

//
service CatalogService @(path:'CatalogService'){
    @Capabilities:{Deletable,Updatable,Insertable}
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    @readonly
    entity EmployeeSet as projection on master.employees
      actions{
        action boost() returns EmployeeSet;
        function largestSalary() returns EmployeeSet
    };
    entity ProductSet as projection on master.product;
    entity POs as projection on transaction.purchaseorder
    actions{
        action boost() returns POs;
    };
    entity POItems as projection on transaction.poitems;

}