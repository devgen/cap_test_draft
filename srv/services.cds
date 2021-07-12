using { alteaup.solutions.systems as systems } from '../db/schema';

@(
    path: '/services',
    impl : './services.js'
)
service Services  {
    
    @odata.draft.enabled
    @Common.DraftRoot.NewAction: 'Services.createDraft'
    @Common.DraftRoot.ActivationAction: 'Services.draftActivate'
    entity Servers as projection on systems.Servers  actions{
        
        //@cds.odata.bindingparameter.collection
        //@cds.odata.bindingparameter.name
        
        //draftPrepare createDraft
        @cds.odata.bindingparameter.collection
        action createDraft( 
             @Common.Label : 'Administrator'
             @Common.ValueListForValidation : 'Administrators'
             @Common.ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Administrators',
                SearchSupported : false,
                Parameters : [
                     {
                        $Type : 'Common.ValueListParameterOut',
                        LocalDataProperty : administrator,
                        ValueListProperty : 'ID', 
                    },
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : administratorName,
                        ValueListProperty : 'name',
                    },

                ],
                PresentationVariantQualifier : 'Administrator_server',
                
                Label : 'Administrator move i18n',
            }
            administratorName : Administrators:name ,
            @UI.Hidden
            administrator : Administrators:ID not null 
            ) returns Servers;
        
        //draftActivate activeteDraft
        //@cds.odata.bindingparameter.collection
        //action activeteDraft( ) returns Servers;

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