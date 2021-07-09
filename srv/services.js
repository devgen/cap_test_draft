const { connect } = require("@sap/cds");
const cds = require("@sap/cds");
module.exports = async function (srv) {

    
    const { Servers } = this.entities;
    //const { Servers } = cds.services;
    
    //const Services = await cds.connect.to('Services');
    //const db = await cds.connect.to("db");

      srv.before('*', async (req) => {

          console.log('Got request' ,req.method, req.path, req.target.name);
          console.log('Got request' , req.query );
         
    })


    srv.on('draftPrepare' , 'Services.Servers' , async (req) => {

        console.log('Got request createDraft' , req.data)
        console.log("Got request createDraft - Request Parameters:", req.params[0]);
        //req.reject(new Error("Veto UPDATE Orders!"))
    })

    srv.on('draftActivate' , 'Services.Servers' ,async (req) => {

        console.log('Got request activateDraft' , req.data)
        console.log("Got request activateDraft - Request Parameters:", req.params[0]);
    })


    
    srv.on('customAction' , 'Services.Servers' ,async (req) => {

        console.log('Got request customAction' , req.data)
        console.log("Got request customAction - Request Parameters:", req.params[0]);
    })

    srv.after('READ' , Servers ,(each) => {

        console.log('Got request Got READ servers' )
       
    })


}