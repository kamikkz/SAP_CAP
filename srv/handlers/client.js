const cds = require('@sap/cds')
class CatalogService02 extends cds.ApplicationService {
  init() {
    const { Client } = cds.entities('CatalogService02')

    // Register your event handlers in here, for example:
    this.on('CREATE', 'Client', async (req) => {
      const { address, phone, ...clientData } = req.data;
      // Crear cliente
      const client = await cds.transaction(req).run(
        INSERT.into('Client').entries(clientData)
      );

      // Crear dirección asociada
      if (address) {
        address.client_ID = client.ID; // Asocia el cliente a la dirección
        await cds.transaction(req).run(INSERT.into('Address').entries(address));
      }

      // Crear teléfonos asociados
      if (phone && phone.length) {
        const phones = phone.map((p) => ({ ...p, client_ID: client.ID }));
        await cds.transaction(req).run(INSERT.into('Phone').entries(phones));
      }
      return client;
    })

    return super.init()
  }
}
module.exports = CatalogService02