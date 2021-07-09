using Services from '../../srv/services';

// annotate Services.Servers.action.createDraft with {

// administrator_id @Common : {
// 		Text            : administrator.name,
//         TextArrangement : #TextOnly,
// 		ValueList       : {
//              $Type          : 'Common.ValueListType',
//              Label          : 'Administrator',
//              CollectionPath : 'Administrators',
//             Parameters     : [
//              {
//                  $Type             : 'Common.ValueListParameterInOut',
//                  LocalDataProperty : ID,
//                  ValueListProperty : 'ID'
//             },
//              {
//                  $Type             : 'Common.ValueListParameterDisplayOnly',
//                  ValueListProperty : 'name'
//              } 
// 			 ]
//  	}
// }

// };

annotate Services.Servers.action.createDraft with {
}


////////////////////////////////////////////////////////////////////////////
//
//	Products Object Page
//
annotate Services.Servers with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Server',
			TypeNamePlural: 'Servers'
		},
		Identification: [
			{Value: hostname}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Identification', Target: '@UI.Identification'},
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>General}', Target: '@UI.FieldGroup#General'},
		],
		FieldGroup#General: {
			Data: [
				{Value: ip_address}
			]
		}
	}
);

////////////////////////////////////////////////////////////////////////////
//
//	Products List Page
//
annotate Services.Servers with @(
	UI: {
		SelectionFields: [ hostname ],
		LineItem: [
			{Value: hostname},
			{Value: ip_address},
			{ $Type: 'UI.DataFieldForAction', Action: 'Services.EntityContainer/Servers_start', Label: 'Start',  Visible, Enabled},
            { $Type: 'UI.DataFieldForAction', Action: 'Services.EntityContainer/Servers_stop', Label: 'Stop',  Visible, Enabled},
		]
	}
);
