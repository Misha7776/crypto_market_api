Rails.application.config.event_store.tap do |es|
  es.subscribe(Denormalizers::Currencies::CurrencyCreated, to: [Events::CurrencyCreated])
  es.subscribe(Denormalizers::Currencies::CurrencyUpdated, to: [Events::CurrencyUpdated])
  es.subscribe(Denormalizers::Currencies::CurrencyDeleted, to: [Events::CurrencyDeleted])
end