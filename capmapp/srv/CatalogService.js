var cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
    const { EmployeeSet } = this.entities;


    this.on("boost", async (req) => {
        console.log("log aagaya");
        //start a db transaction
        try {
            const ID = req.params[0];
            const tx = cds.tx(req);
            //CDS Query Language - Communicate to DB in agnostic manner
            // await tx.update(EmployeeSet).with({
            //     "salaryAmount" : { '+=' :  2000 }
            // }).where(ID);
          await tx.UPDATE (EmployeeSet,ID) .with ({
                salaryAmount: { '+=' :  2000 }      //>  simple value
              
              })
        }
        catch (error) {
            return "Error" + error.toString();
        }


    });

    this.on("largestSalary", async (req) => {
        console.log("log aagaya")
        return {
            "NODE_KEY":"Largest Salary",
            "GROSS_AMOUNT":"6000000"
            // req
        };
        //start a db transaction
        // try {
        //     const ID = req.params[0];
        //     const tx = cds.tx(req);
        //     //CDS Query Language - Communicate to DB in agnostic manner
        //     await tx.update(EmployeeSet).with({
        //         "salaryAmount" : { '+=' :  2000 }
        //     }).where(ID);
        // }
        // catch (error) {
        //     return "Error" + error.toString();
        // }


    });
});