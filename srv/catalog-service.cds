using capLearning.schema00 as schema00 from '../db/schema00';
using capLearning.schema01 as schema01 from '../db/schema01';

service CatalogService {
    entity Products as projection on schema00.Products;
    entity Clientes as projection on schema01.Clientes;
}
