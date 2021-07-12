const cds = require("@sap/cds");


//const generateUUID1 = require('uuid/v4')
module.exports = cds.service.impl( async (srv) => {


    const { connect } = require("@sap/cds");
    const generateUUID = require('@sap/cds-foss')
    const uuidGener = require('uuid');
    const db = cds.connect('db');

    const { Servers } = cds.entities('alteaup.solutions.systems');
    //const { Services } = cds.services;
    //
    //const ServicesService1 =  cds.connect.to('Services');
    //const Services2 =  cds.connect.to('Services');
     //const db = await cds.connect.to("db");

     srv.before('*','Servers' , async (req) => {

          console.log('*====> Got request' ,req.method, req.path, req.target.name);
          //logs to long 
          //console.log('*====> Got request' , req.query );
     })

    //draftPrepare createDraft
    srv.on('createDraft' , 'Services.Servers' , async (req) => {
        //const uuid = generateUUID.v4(); 
        //const uuidGenerator = generateUUID; 
        const uuidServer = uuidGener.v4();
        const uuidDraft = uuidGener.v4();
        const { Servers, Administrators } = cds.entities;
        const tx = srv.tx(req)
        const tx1 = cds.transaction(req);
        Servers.administrator = req.data.administrator;
       
        
        // let query = INSERT.into('Services.Servers').entries([{
        //     ID: '0e0e3ba6-b620-4a59-bec1-cb9a5d2643ba',
        //     DraftAdministrativeData_DraftUUID: "a9782f4f-4999-47ad-bcac-89af90a2d972"
        // }]);
        console.log('Got administrator:  ' , req.data.administrator)
         req.data.administrator || req.reject(new Error("Administrator muss gesetzt werden"))
        
        let query = INSERT.into('Services.Servers').entries([{
            ID: uuidServer,
            administrator_id: req.data.administrator
        }]);


        
        const response = await tx.send({ event: 'NEW' ,query  });


        //var test = srv.emit('NEW',query);
        //const { Services } = cds.services;
        
        //Services.NEW(query).single(Servers);
        //let servers = await srv.run (query)
        console.log('Got request createDraft' , req.data)
        console.log("Got request createDraft - Request Parameters:", req.params[0]);
        //req.reject(new Error("Veto UPDATE Orders!"))
        req.reply(response);
    })
    //draftActivate activeteDraft
    srv.before('draftActivate' , 'Services.Servers' ,async (req) => {

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

});
