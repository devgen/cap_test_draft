////////////////////////////////////////////////////////////////////////////
//
//	Products List Page
//
annotate Services.Products with @(
	UI: {
		SelectionFields: [ name ],
		LineItem: [
			{Value: name	}
		]
	}
);

////////////////////////////////////////////////////////////////////////////
//
//	Products Object Page
//
annotate Services.Products with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Product',
			TypeNamePlural: 'Products'
		},
		Identification: [
			{Value: name}
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Identification', Target: '@UI.Identification'}
		]
	}
);
