using capLearning.schema00 as schema00 from '../db/schema00';

service CatalogService {
    entity Products as projection on schema00.Products;
}
