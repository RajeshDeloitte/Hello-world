trigger amp_sf_OpportunityTrigger on Opportunity (before insert, before update) {
	
	amp_sf_CurrencyConverter.convertValues( Trigger.new );

}