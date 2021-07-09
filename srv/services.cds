using { alteaup.solutions.systems as systems } from '../db/schema';

@(path: '/services')
service Services  {
    @odata.draft.enabled
    @Common.DraftRoot.ActivationAction: 'Services.draftActivate'
    @Common.DraftRoot.NewAction: 'Services.draftPrepare'
    entity Servers as projection on systems.Servers  actions{
        
        //@cds.odata.bindingparameter.collection
        //@cds.odata.bindingparameter.name
        
     
        @cds.odata.bindingparameter.collection
        action draftPrepare( administrator_id : String(36) ) returns Servers;
        @cds.odata.bindingparameter.collection
        action draftActivate( ) returns Servers;

        @sap.applicable.path: 'startEnabled'
        action start();
        @sap.applicable.path: 'stopEnabled'
        action stop(satisfaction: Integer);

    };

    action createServer (server: Servers:ID, administrator: Administrators:ID) returns Servers;

    event CreateServer : { server: Servers:ID ; administrator: Administrators:ID };
    
    @odata.draft.enabled
    entity Systems as projection on systems.Systems;
    @odata.draft.enabled
    entity Products as projection on systems.Products;

    @readonly
    entity Administrators as projection on systems.Administrators;
}