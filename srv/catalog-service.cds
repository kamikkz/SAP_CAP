using capLearning.schema00 as schema00 from '../db/schema00';
using capLearning.schema01 as schema01 from '../db/schema01';
using capLearning.schema02 as schema02 from '../db/schema02';

service CatalogService {
    entity Products as projection on schema00.Products;
    entity Clientes as projection on schema01.Clientes;
    
}

service CatalogService02 {
    entity Clients as projection on schema02.Client;
    entity Addresses as projection on schema02.Address;
    entity Phones as projection on schema02.Phone;
    
}
