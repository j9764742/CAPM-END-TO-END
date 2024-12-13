var cds = require("@sap/cds");
const { SalesOrderApi } = require("./src/generated/API_SALES_ORDER_SRV/SalesOrderApi");

module.exports = cds.service.impl(async function (srv) {
    const { Foo } = this.entities;
    // const { A_SalesOrder } = this.entities;

    const getallsalesorders = async function () {


        const { apiSalesOrderSrv } = require('./src/generated/API_SALES_ORDER_SRV')
        const { salesOrderApi } = apiSalesOrderSrv();
        // const datasalesOrders = await salesOrderApi.requestBuilder().getAll().top(100).select(
        //     salesOrderApi.schema.SALES_ORDER,
        //     salesOrderApi.schema.SALES_DOC_APPROVAL_STATUS,
        //     salesOrderApi.schema.SALES_ORDER_DATE,
        //     salesOrderApi.schema.SALES_ORDER_TYPE
        // ).execute({
        //     url: "https://sandbox.api.sap.com/s4hanacloud",
        //     headers: {
        //         // 'Authorization': `Bearer ${apiKey}`,  // Use API key as Bearer token
        //         // Or if it's a custom header:
        //         'APIKey': "T2HbkxQTpt5Jvn3N4Eq92qV1NukOH1iY"
        //     }
        // })
        const datasalesOrders = await salesOrderApi.requestBuilder().getAll().top().select().execute({
            url: "https://sandbox.api.sap.com/s4hanacloud",
            headers: {
                // 'Authorization': `Bearer ${apiKey}`,  // Use API key as Bearer token
                // Or if it's a custom header:
                'APIKey': "T2HbkxQTpt5Jvn3N4Eq92qV1NukOH1iY"
            }
        })
        return datasalesOrders;
    }
    srv.on("READ", Foo, async (req) => {

            var salesorderdata = await getallsalesorders().then(
                datasalesOrders=>{
                 return datasalesOrders   
                }
            )
       return salesorderdata;

        console.log("log aagaya");
        //start a db transaction



    });


});