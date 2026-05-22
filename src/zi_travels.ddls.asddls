@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Travels'
define root view entity ZI_TRAVELS  as select from zdemo_travels
{
  key travel_id         as TravelId,
      description       as Description,
      status            as Status,
      begin_date        as BeginDate,
      end_date          as EndDate,
      total_price       as TotalPrice,
      booking_fee       as BookingFee,
      currency_code     as CurrencyCode,
      created_by        as CreatedBy,
      created_at        as CreatedAt,
      last_changed_by   as LastChangedBy,
      last_changed_at   as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt
}
