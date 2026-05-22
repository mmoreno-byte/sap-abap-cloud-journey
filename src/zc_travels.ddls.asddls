@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Travels'
@Metadata.allowExtensions: true

@UI.headerInfo: {
  typeName: 'Travel',
  typeNamePlural: 'Travels',
  title: { type: #STANDARD, value: 'Description' }
}

@UI.createHidden: false
define root view entity ZC_TRAVELS
  provider contract transactional_query
  as projection on ZI_TRAVELS
{
      @UI.facet: [{ id: 'Travel', purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    label: 'Travel Details', position: 10 }]

  key TravelId,

      @UI.lineItem:       [{ position: 10, label: 'Description' }]
      @UI.identification: [{ position: 10, label: 'Description' }]
      Description,

      @UI.lineItem:       [{ position: 20, label: 'Status' }]
      @UI.identification: [{ position: 20, label: 'Status' }]
      @UI.selectionField: [{ position: 10 }]
      Status,

      @UI.lineItem:       [{ position: 30, label: 'Begin Date' }]
      @UI.identification: [{ position: 30, label: 'Begin Date' }]
      BeginDate,

      @UI.lineItem:       [{ position: 40, label: 'End Date' }]
      @UI.identification: [{ position: 40, label: 'End Date' }]
      EndDate,

      @UI.lineItem:       [{ position: 50, label: 'Total Price' }]
      @UI.identification: [{ position: 50, label: 'Total Price' }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @UI.identification: [{ position: 60, label: 'Booking Fee' }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @UI.identification: [{ position: 70, label: 'Currency' }]
      CurrencyCode,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt
}
