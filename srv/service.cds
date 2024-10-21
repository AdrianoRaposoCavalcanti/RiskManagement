using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { Riskmanagement as my } from '../db/schema.cds';

@path : '/service/RiskmanagementService'
service RiskmanagementService
{
    @odata.draft.enabled
    entity Risks as
        projection on my.Risks;

    @odata.draft.enabled
    entity Mitigations as
        projection on my.Mitigations;

    entity A_BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };
}

annotate RiskmanagementService with @requires :
[
    'authenticated-user'
];
