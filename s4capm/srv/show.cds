namespace s4capm.srv;

using { API_SALES_ORDER_SRV } from './external/API_SALES_ORDER_SRV';



service MyService {

     entity Foo as projection on API_SALES_ORDER_SRV.A_SalesOrder;

}